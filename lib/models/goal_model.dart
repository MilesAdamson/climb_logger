// ignore_for_file: invalid_annotation_target

import 'package:climb_logger/models/converters/timestamp_converter.dart';
import 'package:climb_logger/models/logbook_entry_model.dart';
import 'package:climb_logger/models/objective_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'goal_model.freezed.dart';
part 'goal_model.g.dart';

@freezed
class GoalModel with _$GoalModel {
  GoalModel._();

  bool get isCompleted => objectives.every((o) => o.isCompleted);

  @JsonSerializable(explicitToJson: true)
  factory GoalModel(
    List<ObjectiveModel> objectives,
    @TimestampConverter() DateTime endDateGoal,
    @TimestampConverter() DateTime createdAt,
  ) = _GoalModel;

  factory GoalModel.fromJson(json) => _$GoalModelFromJson(json);

  GoalModel updateAfterAscent(LogbookEntryModel logbookEntry) {
    final updated = objectives
        .map((objective) => objective.updateAfterAscent(logbookEntry))
        .toList();

    if (!listEquals(updated, objectives)) {
      return copyWith(objectives: updated);
    }

    return this;
  }

  GoalModel updateAfterAscentDeletion(LogbookEntryModel logbookEntry) {
    final updated = objectives
        .map((objective) => objective.updateAfterDeletion(logbookEntry))
        .toList();

    if (!listEquals(updated, objectives)) {
      return copyWith(objectives: updated);
    }

    return this;
  }

  GoalModel modifyObjectiveCompletion(ObjectiveModel objective, int delta) {
    int i = objectives.indexOf(objective);
    final modifiedObjectives = List.of(objectives);
    modifiedObjectives[i] = modifiedObjectives[i]
        .copyWith(countCompleted: modifiedObjectives[i].countCompleted + delta);
    return copyWith(objectives: modifiedObjectives);
  }
}
