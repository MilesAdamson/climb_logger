// ignore_for_file: invalid_annotation_target

import 'package:climb_logger/models/logbook_entry_model.dart';
import 'package:climb_logger/util/ascent_type.dart';
import 'package:climb_logger/util/climb_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:number_to_words/number_to_words.dart';

part 'objective_model.freezed.dart';
part 'objective_model.g.dart';

@freezed
class ObjectiveModel with _$ObjectiveModel {
  ObjectiveModel._();

  String get title {
    if (targetCount > 1) {
      final count = NumberToWord().convert('en-in', targetCount).trim();
      return "${ascentType.label} $count $gradeLabel's";
    }

    return "${ascentType.label} a $gradeLabel ${climbType.label}${!exactGradesOnly ? "\n(or harder)" : ""}";
  }

  String? get subtitle {
    return tag;
  }

  double get progress => (countCompleted / targetCount).clamp(0.0, 1.0);

  String get progressLabel {
    int p = (progress * 100).round();
    return "$p%";
  }

  bool get isCompleted => countCompleted >= targetCount;

  @JsonSerializable(explicitToJson: true)
  factory ObjectiveModel(
    @JsonKey(defaultValue: 0) int targetCount,
    @JsonKey(defaultValue: 0) int countCompleted,
    @JsonKey(defaultValue: ClimbType.boulder) ClimbType climbType,
    @JsonKey(defaultValue: AscentType.redpoint) AscentType ascentType,
    @JsonKey(defaultValue: "?") String gradeLabel,
    @JsonKey(defaultValue: false) bool exactGradesOnly,
    String? tag,
  ) = _ObjectiveModel;

  factory ObjectiveModel.fromJson(json) => _$ObjectiveModelFromJson(json);

  bool ascentSatisfiesObjective(LogbookEntryModel logbookEntry) {
    final tagSatisfied = tag == null ? true : logbookEntry.tags.contains(tag);
    if (!tagSatisfied) {
      return false;
    }

    final climbTypeSatisfied = logbookEntry.climbType == climbType;
    if (!climbTypeSatisfied) {
      return false;
    }

    final ascentTypeSatisfied = logbookEntry.ascentType == ascentType;
    if (!ascentTypeSatisfied) {
      return false;
    }

    final gradingSystem = logbookEntry.gradingSystem;
    if (!gradingSystem.labels.contains(logbookEntry.gradeLabel)) {
      return false;
    }

    if (exactGradesOnly) {
      return logbookEntry.gradeLabel == gradeLabel;
    } else {
      final climbedIndex = logbookEntry.gradeIndex;
      final targetIndex = gradingSystem.labels.indexOf(gradeLabel);

      return climbedIndex >= targetIndex;
    }
  }

  ObjectiveModel updateAfterAscent(LogbookEntryModel logbookEntry) {
    if (ascentSatisfiesObjective(logbookEntry) && !isCompleted) {
      return copyWith(countCompleted: countCompleted + 1);
    }

    return this;
  }

  ObjectiveModel updateAfterDeletion(LogbookEntryModel logbookEntry) {
    if (ascentSatisfiesObjective(logbookEntry) && countCompleted > 0) {
      return copyWith(countCompleted: countCompleted - 1);
    }

    return this;
  }
}
