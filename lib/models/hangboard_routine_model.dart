// ignore_for_file: invalid_annotation_target

import 'package:climb_logger/models/converters/timestamp_converter.dart';
import 'package:climb_logger/models/hangboard_item_model.dart';
import 'package:climb_logger/util/format_minutes_and_seconds.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'hangboard_routine_model.freezed.dart';
part 'hangboard_routine_model.g.dart';

@freezed
class HangboardRoutineModel with _$HangboardRoutineModel {
  HangboardRoutineModel._();

  Duration get totalDuration => completeWorkout.fold<Duration>(
      Duration.zero, (total, item) => total + item.duration);

  String get totalDurationLabel {
    final minutes = totalDuration.inMinutes;
    final seconds = totalDuration.inSeconds % 60;

    return formatMinutesAndSeconds(minutes, seconds);
  }

  String get restBetweenSetsDurationLabel =>
      formatMinutesAndSeconds(restBetweenSetsMinutes, restBetweenSetsSeconds);

  String get subtitle => items.map((e) => e.fullName()).join(", ");

  String get trailingLabel => "$sets set${sets == 1 ? "" : "s"}";

  List<HangboardItemModel> get nonRestItems => completeWorkout
      .where((item) => HangboardItemModel.itemNames.contains(item.name))
      .toList();

  List<HangboardItemModel> get completeWorkout {
    final allItems = <HangboardItemModel>[
      HangboardItemModel.countdown(5),
    ];

    for (int i = 0; i < sets; i++) {
      allItems.addAll(items.map((item) => item.copyWithNewUniqueId()));
      if (i + 1 != sets) {
        allItems.add(
          HangboardItemModel.rest(
            seconds: restBetweenSetsSeconds,
            minutes: restBetweenSetsMinutes,
            isRestBetweenSets: true,
          ),
        );
      }
    }

    return allItems.where((item) => item.duration > Duration.zero).toList();
  }

  @JsonSerializable(explicitToJson: true)
  factory HangboardRoutineModel(
    String name,
    @TimestampConverter()
        DateTime createdAt,
    @JsonKey(defaultValue: 100)
        int score,
    @JsonKey(defaultValue: 1)
        int sets,
    @JsonKey(defaultValue: 1)
        int restBetweenSetsMinutes,
    @JsonKey(defaultValue: 0)
        int restBetweenSetsSeconds,
    @JsonKey(
      fromJson: HangboardRoutineModel.setDefinitionFromJson,
      toJson: HangboardRoutineModel.setDefinitionToJson,
    )
        List<HangboardItemModel> items,
  ) = _HangboardRoutineModel;

  factory HangboardRoutineModel.fromJson(json) =>
      _$HangboardRoutineModelFromJson(json);

  static List<HangboardItemModel> setDefinitionFromJson(List jsonList) =>
      jsonList.map((json) => HangboardItemModel.fromJson(json)).toList();

  static List<Map<String, dynamic>> setDefinitionToJson(
          List<HangboardItemModel> items) =>
      items.map((item) => item.toJson()).toList();
}
