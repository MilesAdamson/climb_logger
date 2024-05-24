import 'dart:async';

import 'package:climb_logger/components/dialogs/confirm_dialog.dart';
import 'package:climb_logger/components/grade_icon.dart';
import 'package:climb_logger/components/state_builder.dart';
import 'package:climb_logger/models/logbook_entry_model.dart';
import 'package:climb_logger/routing/navigator_extensions.dart';
import 'package:climb_logger/state/events.dart';
import 'package:climb_logger/theme/ui_constants.dart';
import 'package:climb_logger/util/ascent_type.dart';
import 'package:climb_logger/util/build_context_extensions.dart';
import 'package:climb_logger/util/date_time_extensions.dart';
import 'package:climb_logger/util/widget_with_date.dart';
import 'package:flutter/material.dart';

class CsvImportPreviewScreen extends StatefulWidget {
  final List<LogbookEntryModel> entries;

  const CsvImportPreviewScreen({
    Key? key,
    required this.entries,
  }) : super(key: key);

  @override
  State<CsvImportPreviewScreen> createState() => _CsvImportPreviewScreenState();
}

class _CsvImportPreviewScreenState extends State<CsvImportPreviewScreen> {
  late final StreamSubscription s;

  @override
  void initState() {
    s = context.bloc.stream
        .map((state) => state.bulkInsertComplete)
        .listen((isComplete) {
      if (isComplete) {
        s.cancel();
        Navigator.of(context).home();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    s.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final children = buildChildren(context);

    return StateBuilder(builder: (context, state) {
      if (state.bulkInsertProgress != 0) {
        return WillPopScope(
          onWillPop: () async => false,
          child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: const Text("Import Preview"),
            ),
            body: Center(
              child: Text(
                "Inserted ${state.bulkInsertProgress} out of ${widget.entries.length} entries..."
                "\nPlease do not navigate backwards or close the app.",
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      }

      return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          heroTag: null,
          onPressed: () async {
            final confirm = await showConfirmationDialog(
              context,
              title: "Insert ${widget.entries.length} Logbook Entries",
              message: "Importing logbook entries does NOT affect your goals. "
                  "This can take a while, please wait for the entire import to complete.",
            );

            if (confirm) {
              context.bloc.add(LoadAllLogbooksEvent());
              context.bloc.add(LogbookBulkInsertEvent(widget.entries));
            }
          },
          label: Text("Save ${widget.entries.length} logbook entries"),
          icon: const Icon(Icons.save),
        ),
        appBar: AppBar(
          title: const Text("Import Preview"),
        ),
        body: ListView.builder(
          itemCount: children.length,
          padding: kListViewPadding,
          itemBuilder: (context, i) => children[i],
        ),
      );
    });
  }

  List<Widget> buildChildren(BuildContext context) {
    final logbookWidgets = widget.entries.map(
      (logbookEntry) => WidgetWithDate(
        logbookEntry.dateTime,
        ListTile(
          trailing: Text(logbookEntry.score.toString()),
          title: Text(logbookEntry.title),
          subtitle: Text(logbookEntry.subtitle),
          leading: GradeIcon(
            color: logbookEntry.ascentType.color(context),
            gradeLabel: logbookEntry.gradeLabel,
          ),
        ),
      ),
    );

    final dates = widget.entries
        .map((e) => DateTime(
              e.dateTime.year,
              e.dateTime.month,
              e.dateTime.day,
            ).roundUpToEndOfDay())
        .toSet();

    final dateHeaders = dates.map(
      (dateTime) => WidgetWithDate(
        dateTime,
        ListTile(
          contentPadding: const EdgeInsets.only(left: 16.0, right: 4.0),
          title: Text(
            dateTime.formattedDate,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
      ),
    );

    final children = <WidgetWithDate>[
      ...dateHeaders,
      ...logbookWidgets,
    ]..sort();

    return children.map((e) => e.widget).toList();
  }
}
