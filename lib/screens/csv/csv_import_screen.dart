import 'package:climb_logger/components/dialogs/confirm_dialog.dart';
import 'package:climb_logger/routing/navigator_extensions.dart';
import 'package:climb_logger/services/logger.dart';
import 'package:climb_logger/theme/ui_constants.dart';
import 'package:climb_logger/util/ascent_type.dart';
import 'package:climb_logger/util/csv_helper.dart';
import 'package:climb_logger/util/wall_type.dart';
import 'package:flutter/material.dart';

class CsvImportScreen extends StatefulWidget {
  const CsvImportScreen({Key? key}) : super(key: key);

  @override
  State<CsvImportScreen> createState() => CsvImportScreenState();
}

class CsvImportScreenState extends State<CsvImportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        heroTag: null,
        onPressed: onSelectFile,
        label: const Text("Select .csv or .xlsx file"),
        icon: const Icon(Icons.file_copy_outlined),
      ),
      appBar: AppBar(
        title: const Text("CSV Import"),
      ),
      body: ListView(
        padding: kListViewPadding,
        children: [
          const ListTile(
            title: Text("Import Instructions"),
            subtitle: Text(
              "To import from CSV (comma separated values), "
              "you will need a file which maps to logbook entries. This can either be a file with the .csv extension, or "
              "an excel file with an extension of .xlsx."
              "\n\n"
              "The first row of your data is assumed to be headings and will be ignored.",
            ),
          ),
          TextButton(
            onPressed: Navigator.of(context).csvExample,
            child: const Text("View example data"),
          ),
          const ListTile(
            title: Text("Column 1: Date"),
            subtitle: Text(
              'In the left-most column there must be a date. '
              'It can be in a format like "2020-02-10", "Jan 5, 2020", "20200210" or an '
              'ISO 8601 formatted string.',
            ),
          ),
          const ListTile(
            title: Text("Column 2: Grade"),
            subtitle: Text(
              'In the second column there must be a grade. '
              'The grade must EXACTLY match the labels displayed in the app. '
              'This is case sensitive due to French grades.'
              ' Examples: "V4", "10a", "6a+" or "7C+"',
            ),
          ),
          ListTile(
            title: const Text("Column 3: Ascent Type"),
            subtitle: Text(
              'In the third column there must be an ascent type. '
              'The ascent type is not case sensitive, and must'
              ' match one of the values used in the app (${AscentType.values.map((e) => e.label).join(", ")})',
            ),
          ),
          ListTile(
            title: const Text("Column 4: Wall Type"),
            subtitle: Text(
              'In the fourth column there must be a wall type. '
              'The wall type is not case sensitive, and must'
              ' match one of the values used in the app (${WallType.values.map((e) => e.label).join(", ")})',
            ),
          ),
          const ListTile(
            title: Text("Column 5: Climb Name"),
            subtitle: Text(
              'In the fifth column you can optionally add a climb name.',
            ),
          ),
          const ListTile(
            title: Text("Column 6: Climb Details"),
            subtitle: Text(
              'In the sixth column you can optionally add additional details.',
            ),
          ),
        ]
            .map((e) => Padding(
                  child: e,
                  padding: const EdgeInsets.only(bottom: 8.0),
                ))
            .toList(),
      ),
    );
  }

  void onSelectFile() async {
    try {
      final file = await CsvHelper.chooseCSV();
      if (file == null) {
        return;
      }

      final csv = await CsvHelper.convertFileToRows(file);
      final entries = CsvHelper.parseIntoLogbook(csv);
      Navigator.of(context).csvImportPreview(entries);
      return;
    } on CsvException catch (e) {
      showConfirmationDialog(
        context,
        title: "Error",
        message: e.message,
        showCancelButton: false,
      );
    } catch (e, s) {
      Logger.captureException(e, s);
      showConfirmationDialog(
        context,
        title: "Unknown Error",
        message: "This error was unexpected, and has been logged.",
        showCancelButton: false,
      );
    }
  }
}
