import 'package:climb_logger/models/logbook_entry_model.dart';
import 'package:climb_logger/util/ascent_type.dart';
import 'package:climb_logger/util/climb_type.dart';
import 'package:climb_logger/util/grading_system.dart';
import 'package:climb_logger/util/wall_type.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Grading system calculation test", () {
    test(
        "Deprecated grade of 5 makes french"
        "sport when climb type is sport", () {
      final entry = LogbookEntryModel(
        DateTime(2020),
        "details",
        "climbName",
        "5",
        ClimbType.sport,
        AscentType.redpoint,
        [],
        WallType.roof,
        1,
      );

      expect(entry.gradingSystem, const FrenchSportSystem());
    });

    test(
        "Deprecated grade of 5 makes french"
        "bouldering when climb type is bouldering", () {
      final entry = LogbookEntryModel(
        DateTime(2020),
        "details",
        "climbName",
        "5",
        ClimbType.boulder,
        AscentType.redpoint,
        [],
        WallType.roof,
        1,
      );

      expect(entry.gradingSystem, const FrenchBoulderingSystem());
    });

    test(
        "Grade of 5A makes french"
        "bouldering when climb type is bouldering", () {
      final entry = LogbookEntryModel(
        DateTime(2020),
        "details",
        "climbName",
        "5A",
        ClimbType.boulder,
        AscentType.redpoint,
        [],
        WallType.roof,
        1,
      );

      expect(entry.gradingSystem, const FrenchBoulderingSystem());
    });

    test(
        "Grade of 11a makes yosemite"
        "sport when climb type is sport", () {
      final entry = LogbookEntryModel(
        DateTime(2020),
        "details",
        "climbName",
        "11a",
        ClimbType.sport,
        AscentType.redpoint,
        [],
        WallType.roof,
        1,
      );

      expect(entry.gradingSystem, const YosemiteSystem());
    });
  });
}
