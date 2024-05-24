import 'package:climb_logger/models/logbook_entry_model.dart';
import 'package:climb_logger/util/ascent_type.dart';
import 'package:climb_logger/util/climb_type.dart';
import 'package:climb_logger/util/csv_helper.dart';
import 'package:climb_logger/util/example_csv_data.dart';
import 'package:climb_logger/util/wall_type.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("CSV helper should parse the example csv into logbook entries", () {
    final entries = CsvHelper.parseIntoLogbook(exampleCsv);
    expect(entries.length, equals(exampleCsv.length - 1));
    final firstEntry = entries.first;

    expect(
      firstEntry,
      equals(
        LogbookEntryModel(
          DateTime(2020, 2, 10, 12),
          null,
          null,
          "V4",
          ClimbType.boulder,
          AscentType.redpoint,
          [],
          WallType.vert,
          null,
        ),
      ),
    );
  });
}
