// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'stats_model.freezed.dart';
part 'stats_model.g.dart';

@freezed
class StatsModel with _$StatsModel {
  StatsModel._();

  @JsonSerializable(explicitToJson: true)
  factory StatsModel(
    @JsonKey(defaultValue: 0) int logbookCount,
    @JsonKey(defaultValue: 0) int projectCount,
    @JsonKey(defaultValue: 0) int goalCount,
    @JsonKey(defaultValue: 0) int userCount,
    @JsonKey(defaultValue: 0) int hangboardEntryCount,
    @JsonKey(defaultValue: 0) int hangboardRoutineCount,
    @JsonKey(defaultValue: 0) int trainingNotesCount,
  ) = _StatsModel;

  factory StatsModel.fromJson(json) => _$StatsModelFromJson(json);

  factory StatsModel.zero() {
    return StatsModel(0, 0, 0, 0, 0, 0, 0);
  }
}
