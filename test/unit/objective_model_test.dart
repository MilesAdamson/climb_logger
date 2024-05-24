import 'package:climb_logger/models/logbook_entry_model.dart';
import 'package:climb_logger/models/objective_model.dart';
import 'package:climb_logger/util/ascent_type.dart';
import 'package:climb_logger/util/climb_type.dart';
import 'package:climb_logger/util/grading_system.dart';
import 'package:climb_logger/util/wall_type.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
      "With exact grades, an ascent which matches"
      " grade and type satisfies objective", () {
    final grade = const YosemiteSystem().labels[3];

    final obj = ObjectiveModel(
      1,
      0,
      ClimbType.sport,
      AscentType.redpoint,
      grade,
      true,
      null,
    );

    final logbookEntry = LogbookEntryModel(
      DateTime.now(),
      "details",
      "climbName",
      grade,
      ClimbType.sport,
      AscentType.redpoint,
      [],
      WallType.overhang,
      null,
    );

    expect(obj.ascentSatisfiesObjective(logbookEntry), isTrue);
    expect(obj.updateAfterAscent(logbookEntry).countCompleted, 1);
  });

  test(
      "With exact grades, an ascent which matches"
      " grade but not type does not satisfy objective", () {
    final grade = const YosemiteSystem().labels[3];

    final obj = ObjectiveModel(
      1,
      0,
      ClimbType.sport,
      AscentType.redpoint,
      grade,
      true,
      null,
    );

    final logbookEntry = LogbookEntryModel(
      DateTime.now(),
      "details",
      "climbName",
      grade,
      ClimbType.sport,
      AscentType.flash,
      [],
      WallType.overhang,
      null,
    );

    expect(obj.ascentSatisfiesObjective(logbookEntry), isFalse);
    expect(obj.updateAfterAscent(logbookEntry).countCompleted, 0);
  });

  test(
      "With exact grades, an ascent which matches"
      " grade but not tag does not satisfy objective", () {
    final grade = const YosemiteSystem().labels[3];

    final obj = ObjectiveModel(
      1,
      0,
      ClimbType.sport,
      AscentType.redpoint,
      grade,
      true,
      "Crimps",
    );

    final logbookEntry = LogbookEntryModel(
      DateTime.now(),
      "details",
      "climbName",
      grade,
      ClimbType.sport,
      AscentType.redpoint,
      [],
      WallType.overhang,
      null,
    );

    expect(obj.ascentSatisfiesObjective(logbookEntry), isFalse);
    expect(obj.updateAfterAscent(logbookEntry).countCompleted, 0);
  });

  test(
      "With exact grades, an ascent which matches"
      " grade and tag does satisfy objective", () {
    final grade = const YosemiteSystem().labels[3];
    const tag = "Crimps";

    final obj = ObjectiveModel(
      1,
      0,
      ClimbType.sport,
      AscentType.redpoint,
      grade,
      true,
      tag,
    );

    final logbookEntry = LogbookEntryModel(
      DateTime.now(),
      "details",
      "climbName",
      grade,
      ClimbType.sport,
      AscentType.redpoint,
      [tag],
      WallType.overhang,
      null,
    );

    expect(obj.ascentSatisfiesObjective(logbookEntry), isTrue);
    expect(obj.updateAfterAscent(logbookEntry).countCompleted, 1);
  });

  test(
      "With exact grades, an ascent with a harder grade does not satisfy objective",
      () {
    final grade = const YosemiteSystem().labels[3];
    final harderGrade = const YosemiteSystem().labels[4];

    final obj = ObjectiveModel(
      1,
      0,
      ClimbType.sport,
      AscentType.redpoint,
      grade,
      true,
      null,
    );

    final logbookEntry = LogbookEntryModel(
      DateTime.now(),
      "details",
      "climbName",
      harderGrade,
      ClimbType.sport,
      AscentType.redpoint,
      [],
      WallType.overhang,
      null,
    );

    expect(obj.ascentSatisfiesObjective(logbookEntry), isFalse);
    expect(obj.updateAfterAscent(logbookEntry).countCompleted, 0);
  });

  test(
      "Without exact grades, an ascent with a harder grade does satisfy objective",
      () {
    final grade = const YosemiteSystem().labels[3];
    final harderGrade = const YosemiteSystem().labels[4];

    final obj = ObjectiveModel(
      1,
      0,
      ClimbType.sport,
      AscentType.redpoint,
      grade,
      false,
      null,
    );

    final logbookEntry = LogbookEntryModel(
      DateTime.now(),
      "details",
      "climbName",
      harderGrade,
      ClimbType.sport,
      AscentType.redpoint,
      [],
      WallType.overhang,
      null,
    );

    expect(obj.ascentSatisfiesObjective(logbookEntry), isTrue);
    expect(obj.updateAfterAscent(logbookEntry).countCompleted, 1);
  });

  test("Without exact grades, an onsight does not satisfy a redpoint", () {
    final grade = const YosemiteSystem().labels[3];
    final harderGrade = const YosemiteSystem().labels[4];

    final obj = ObjectiveModel(
      1,
      0,
      ClimbType.sport,
      AscentType.redpoint,
      grade,
      false,
      null,
    );

    final logbookEntry = LogbookEntryModel(
      DateTime.now(),
      "details",
      "climbName",
      harderGrade,
      ClimbType.sport,
      AscentType.onsight,
      [],
      WallType.overhang,
      null,
    );

    expect(obj.ascentSatisfiesObjective(logbookEntry), isFalse);
    expect(obj.updateAfterAscent(logbookEntry).countCompleted, 0);
  });

  test("Without exact grades, an easier climb does not satisfy an objective",
      () {
    final grade = const YosemiteSystem().labels[3];
    final harderGrade = const YosemiteSystem().labels[4];

    final obj = ObjectiveModel(
      1,
      0,
      ClimbType.sport,
      AscentType.redpoint,
      harderGrade,
      false,
      null,
    );

    final logbookEntry = LogbookEntryModel(
      DateTime.now(),
      "details",
      "climbName",
      grade,
      ClimbType.sport,
      AscentType.redpoint,
      [],
      WallType.overhang,
      null,
    );

    expect(obj.ascentSatisfiesObjective(logbookEntry), isFalse);
    expect(obj.updateAfterAscent(logbookEntry).countCompleted, 0);
  });

  test("With multiple tags, if any tag matches it satisfies objective", () {
    final grade = const YosemiteSystem().labels[3];
    const tag = "Crimps";

    final obj = ObjectiveModel(
      1,
      0,
      ClimbType.sport,
      AscentType.redpoint,
      grade,
      true,
      tag,
    );

    final logbookEntry = LogbookEntryModel(
      DateTime.now(),
      "details",
      "climbName",
      grade,
      ClimbType.sport,
      AscentType.redpoint,
      [tag, "test", "tags"],
      WallType.overhang,
      null,
    );

    expect(obj.ascentSatisfiesObjective(logbookEntry), isTrue);
    expect(obj.updateAfterAscent(logbookEntry).countCompleted, 1);
  });

  test("Count completed will not increase if already at the target", () {
    final grade = const YosemiteSystem().labels[3];

    final obj = ObjectiveModel(
      1,
      1,
      ClimbType.sport,
      AscentType.redpoint,
      grade,
      true,
      null,
    );

    final logbookEntry = LogbookEntryModel(
      DateTime.now(),
      "details",
      "climbName",
      grade,
      ClimbType.sport,
      AscentType.redpoint,
      [],
      WallType.overhang,
      null,
    );

    expect(obj.ascentSatisfiesObjective(logbookEntry), isTrue);
    expect(obj.updateAfterAscent(logbookEntry).countCompleted, 1);
  });

  test("Count completed will not decrease if already at zero", () {
    final grade = const YosemiteSystem().labels[3];

    final obj = ObjectiveModel(
      1,
      0,
      ClimbType.sport,
      AscentType.redpoint,
      grade,
      true,
      null,
    );

    final logbookEntry = LogbookEntryModel(
      DateTime.now(),
      "details",
      "climbName",
      grade,
      ClimbType.sport,
      AscentType.redpoint,
      [],
      WallType.overhang,
      null,
    );

    expect(obj.ascentSatisfiesObjective(logbookEntry), isTrue);
    expect(obj.updateAfterDeletion(logbookEntry).countCompleted, 0);
  });
}
