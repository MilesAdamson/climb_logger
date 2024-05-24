import 'package:climb_logger/models/goal_model.dart';
import 'package:climb_logger/models/logbook_entry_model.dart';
import 'package:climb_logger/models/objective_model.dart';
import 'package:climb_logger/util/ascent_type.dart';
import 'package:climb_logger/util/climb_type.dart';
import 'package:climb_logger/util/grading_system.dart';
import 'package:climb_logger/util/wall_type.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
      "Updating a goal with a logbook entry which satisfies it "
      "updates the goals objectives", () {
    final grade = const YosemiteSystem().labels[3];

    final goal = GoalModel(
      [
        ObjectiveModel(
          1,
          0,
          ClimbType.sport,
          AscentType.redpoint,
          grade,
          true,
          null,
        ),
      ],
      DateTime.now(),
      DateTime.now(),
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

    final updated = goal.updateAfterAscent(logbookEntry);
    expect(updated, isNot(equals(goal)));
    expect(updated.isCompleted, isTrue);
  });

  test(
      "Updating a goal with a logbook entry which does not satisfy it "
      "does nothing", () {
    final grade = const YosemiteSystem().labels[3];

    final goal = GoalModel(
      [
        ObjectiveModel(
          1,
          0,
          ClimbType.sport,
          AscentType.onsight,
          grade,
          true,
          null,
        ),
      ],
      DateTime.now(),
      DateTime.now(),
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

    final updated = goal.updateAfterAscent(logbookEntry);
    expect(updated, equals(goal));
    expect(updated.isCompleted, isFalse);
  });

  test(
      "Updating a goal with a logbook entry which satisfies one objective "
      "does not modify another objective", () {
    final grade = const YosemiteSystem().labels[3];
    final harderGrade = const YosemiteSystem().labels[4];

    final goal = GoalModel(
      [
        ObjectiveModel(
          1,
          0,
          ClimbType.sport,
          AscentType.onsight,
          grade,
          true,
          null,
        ),
        ObjectiveModel(
          1,
          0,
          ClimbType.sport,
          AscentType.redpoint,
          harderGrade,
          true,
          null,
        ),
      ],
      DateTime.now(),
      DateTime.now(),
    );

    final logbookEntry = LogbookEntryModel(
      DateTime.now(),
      "details",
      "climbName",
      grade,
      ClimbType.sport,
      AscentType.onsight,
      [],
      WallType.overhang,
      null,
    );

    final updated = goal.updateAfterAscent(logbookEntry);
    expect(updated, isNot(equals(goal)));
    expect(updated.isCompleted, isFalse);

    final redpointObj = updated.objectives
        .singleWhere((obj) => obj.ascentType == AscentType.redpoint);
    expect(redpointObj.isCompleted, isFalse);

    final onsightObj = updated.objectives
        .singleWhere((obj) => obj.ascentType == AscentType.onsight);
    expect(onsightObj.isCompleted, isTrue);
  });

  test(
      "Deleting a logbook entry which satisfies goal will change objective if "
      "it's not already completed", () {
    final grade = const YosemiteSystem().labels[3];

    final goal = GoalModel(
      [
        ObjectiveModel(
          2,
          1,
          ClimbType.sport,
          AscentType.redpoint,
          grade,
          true,
          null,
        ),
      ],
      DateTime.now(),
      DateTime.now(),
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

    final updated = goal.updateAfterAscentDeletion(logbookEntry);
    expect(updated, isNot(equals(goal)));
    expect(updated.isCompleted, isFalse);
    expect(updated.objectives.single.countCompleted, 0);
  });

  test(
      "Deleting a logbook entry which satisfies goal will change objective if "
      "it's not already completed, but leave an unrelated objective unaffected",
      () {
    final grade = const YosemiteSystem().labels[3];
    final harderGrade = const YosemiteSystem().labels[4];

    final goal = GoalModel(
      [
        ObjectiveModel(
          2,
          1,
          ClimbType.sport,
          AscentType.redpoint,
          grade,
          true,
          null,
        ),
        ObjectiveModel(
          2,
          1,
          ClimbType.sport,
          AscentType.redpoint,
          harderGrade,
          true,
          null,
        ),
      ],
      DateTime.now(),
      DateTime.now(),
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

    final updated = goal.updateAfterAscentDeletion(logbookEntry);
    expect(updated, isNot(equals(goal)));
    expect(updated.isCompleted, isFalse);
    expect(updated.objectives.first.countCompleted, 0);
    expect(updated.objectives.last.countCompleted, 1);
  });

  test(
      "Inserting a logbook will update multiple objectives if multiple are satisfied",
      () {
    final grade = const YosemiteSystem().labels[3];
    final harderGrade = const YosemiteSystem().labels[4];

    final goal = GoalModel(
      [
        ObjectiveModel(
          2,
          1,
          ClimbType.sport,
          AscentType.redpoint,
          grade,
          false,
          null,
        ),
        ObjectiveModel(
          2,
          1,
          ClimbType.sport,
          AscentType.redpoint,
          harderGrade,
          true,
          null,
        ),
      ],
      DateTime.now(),
      DateTime.now(),
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

    final updated = goal.updateAfterAscent(logbookEntry);
    expect(updated, isNot(equals(goal)));
    expect(updated.isCompleted, isTrue);
    expect(updated.objectives.first.countCompleted, 2);
    expect(updated.objectives.last.countCompleted, 2);
  });
}
