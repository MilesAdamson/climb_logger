import 'dart:convert';
import 'dart:io';

import 'package:climb_logger/models/logbook_entry_model.dart';
import 'package:climb_logger/services/logger.dart';
import 'package:climb_logger/util/ascent_type.dart';
import 'package:climb_logger/util/climb_type.dart';
import 'package:climb_logger/util/date_time_extensions.dart';
import 'package:climb_logger/util/grading_system.dart';
import 'package:climb_logger/util/wall_type.dart';
import 'package:csv/csv.dart';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class CsvHelper {
  final List<LogbookEntryModel> logbookEntries;
  final List<String> tags;

  CsvHelper(this.logbookEntries, this.tags);

  String get _ms => DateTime.now().millisecondsSinceEpoch.toString();

  String buildCsv() {
    final lists = <List<dynamic>>[
      LogbookEntryModel.csvTitles(tags),
      ...logbookEntries.map((entry) => entry.csvEntry(tags)),
    ];

    assert(lists.every((row) => row.length == lists.first.length),
        "All rows should be the same length");

    final csvOutput = const ListToCsvConverter().convert(lists).trim();

    Logger.captureInfo("Raw csv string below:");
    Logger.captureInfo(csvOutput);

    return csvOutput;
  }

  Future<File> download() async {
    try {
      late final Directory storage;

      if (Platform.isAndroid) {
        storage = await getExternalStorageDirectory() ??
            await getApplicationDocumentsDirectory();
      } else {
        storage = await getApplicationDocumentsDirectory();
      }

      final filename = "climbing_logbook_$_ms.csv";

      final file = File("${storage.path}/$filename");
      await file.writeAsString(buildCsv());

      Logger.captureInfo("Downloaded csv to ${file.path}");

      return file;
    } on CsvException {
      rethrow;
    } catch (e) {
      throw CsvException("An unknown error occurred.");
    }
  }

  Future<void> openFile(String path) async {
    try {
      final openResult = await OpenFile.open(path);

      switch (openResult.type) {
        case ResultType.fileNotFound:
          throw CsvException(
              "The file was not created successfully and could not be found.");
        case ResultType.noAppToOpen:
          throw CsvException("You have no app to open csv files. "
              "The csv was saved successfully at:\n\n$path");
        case ResultType.permissionDenied:
          throw CsvException(
              "Climbing Logbook lacks your permission to open the file.");
        case ResultType.error:
          throw CsvException("An unknown error occurred.");
        default:
          return;
      }
    } catch (e) {
      throw CsvException("An unknown error occurred.");
    }
  }

  static List<LogbookEntryModel> parseIntoLogbook(List<List<dynamic>> csv) {
    final entries = <LogbookEntryModel>[];

    if (csv.isEmpty) {
      throw CsvException('No data');
    }

    if (!csv.every((row) => row.length >= 6)) {
      throw CsvException(
          'Some columns of data are missing. You must have a column for date,'
          ' grade, ascent type, wall type, climb name and details (in that exact order).');
    }

    for (final csvRow in csv.skip(1)) {
      var date = DateTimeExtensions.tryParse(csvRow[0]);

      if (date == null) {
        throw CsvException(
            'Expected a date in column 1, instead got "${csvRow[0]}". '
            'Try a date format like 2020/01/23, 2020-01-23, or Jan 23, 2020');
      }

      if (date.hour == 0 && date.minute == 0) {
        date = DateTime(date.year, date.month, date.day, 12);
      }

      final grade = GradingSystem.tryParse(csvRow[1]);

      if (grade == null) {
        throw CsvException(
            'Expected a grade in column 2, instead got "${csvRow[1]}". View the score screen for all acceptable grades. '
            'Grade parsing is CASE SENSITIVE due to the letters case mattering for french grades.');
      }

      final ascentType = AscentTypeExtensions.tryParse(csvRow[2]);

      if (ascentType == null) {
        throw CsvException(
            'Expected an ascent type in column 3, instead got "${csvRow[2]}". '
            'Acceptable values are ${AscentType.values.map((e) => e.label).join(", ")}. '
            'Ascent type is not case sensitive.');
      }

      final wallType = WallTypeExtensions.tryParse(csvRow[3]);

      if (wallType == null) {
        throw CsvException(
            'Expected a wall type in column 4, instead got "${csvRow[3]}"'
            'Acceptable values are ${WallType.values.map((e) => e.label).join(", ")}. '
            'Wall type is not case sensitive.');
      }

      final climbName = "${csvRow[4]}".trim();
      final details = "${csvRow[5]}".trim();

      final isBoulder = [
        ...const VerminSystem().labels,
        ...const FrenchBoulderingSystem().labels
      ].contains(grade);

      entries.add(LogbookEntryModel(
        date,
        details.isNotEmpty ? details : null,
        climbName.isNotEmpty ? climbName : null,
        grade,
        isBoulder ? ClimbType.boulder : ClimbType.sport,
        ascentType,
        [],
        wallType,
        null,
      ));
    }

    return entries;
  }

  static Future<File?> chooseCSV() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['csv', 'txt', 'xlsx'],
    );

    if (result != null && result.files.length == 1) {
      final platformFile = result.files.first;
      final ext = platformFile.extension;

      final isCSV = ext == "csv";
      final isXLSX = ext == "xlsx";

      if (!isCSV && !isXLSX) {
        throw CsvException(
            "The file you chose ended with $ext. It must be of type xlsx or csv.");
      }

      if (platformFile.path == null) {
        throw CsvException(
            "Something went wrong, and the file could not be found.");
      }

      return File(platformFile.path!);
    }

    return null;
  }

  static Future<List<List<dynamic>>> convertFileToRows(File file) async {
    final ext = file.path.split(".").last;

    switch (ext) {
      case "xlsx":
        final excel = Excel.decodeBytes(file.readAsBytesSync());
        final rows = excel.sheets.values.first.rows
            .map((row) => row.map((data) => data?.value ?? "").toList())
            .toList();
        return rows;
      case "csv":
        final csvRows = await file
            .openRead()
            .transform(utf8.decoder)
            .transform(const CsvToListConverter())
            .toList();
        return csvRows;
      default:
        throw CsvException(
            "The file you chose ended with $ext. It must be of type xlsx or csv.");
    }
  }
}

class CsvException {
  final String message;

  CsvException(this.message);
}
