// ignore_for_file: invalid_annotation_target

import 'package:climb_logger/models/settings_model.dart';
import 'package:climb_logger/state/app_state.dart';
import 'package:climb_logger/util/format_minutes_and_seconds.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'hangboard_item_model.freezed.dart';
part 'hangboard_item_model.g.dart';

@freezed
class HangboardItemModel with _$HangboardItemModel {
  static const restItemName = "Rest";

  static const itemModifierL = "1-Handed L";
  static const itemModifierR = "1-Handed R";
  static const itemModifierWeighted = "Weighted";

  static const modifiers = [
    itemModifierL,
    itemModifierR,
    itemModifierWeighted,
  ];

  static const itemNames = [
    itemNameJug,
    itemNameEdge,
    itemNameSloper,
    itemNamePocket,
    itemNamePinch,
    itemNameBall,
  ];

  static const itemNameJug = "Jug";
  static const itemNameEdge = "Edge";
  static const itemNameSloper = "Sloper";
  static const itemNamePocket = "Pocket";
  static const itemNamePinch = "Pinch";
  static const itemNameBall = "Ball";

  static Color getItemColor(String itemName, SettingsModel settings) {
    return {
      "Jug": settings.colorOne,
      "Edge": settings.colorTwo,
      "Sloper": settings.colorThree,
      "Pocket": settings.colorFour,
      "Pinch": settings.colorFive,
      "Ball": settings.colorSix,
    }[itemName]!;
  }

  static const holdSizesMetric = [
    "4mm",
    "6mm",
    "8mm",
    "10mm",
    "12mm",
    "14mm",
    "16mm",
    "18mm",
    "20mm",
    "22mm",
    "24mm",
    "30mm",
    "40mm",
    "50mm",
  ];

  static const holdSizesImperial = [
    '1/6"',
    '1/3"',
    '1/2"',
    '2/3"',
    '5/6"',
    '1"',
    '1 1/6"',
    '1 1/3"',
    '1 1/2"',
    '1 2/3"',
    '1 5/6"',
    '2"',
  ];

  HangboardItemModel._();

  bool get isRest => name == restItemName || isRestBetweenSets;

  Color itemColor(AppState appState) {
    return isRest ? appState.settings.colorFour : appState.settings.colorFive;
  }

  String fullName({bool useNewline = false}) {
    if (isRest) {
      return name;
    }

    return "${holdSize != null ? "$holdSize " : ""}$name${modifier != null ? "${useNewline ? "\n" : " "}($modifier)" : ""}";
  }

  Duration get duration => Duration(seconds: seconds, minutes: minutes);

  String get durationLabel => formatMinutesAndSeconds(minutes, seconds);

  @JsonSerializable(explicitToJson: true)
  factory HangboardItemModel(
    @JsonKey(defaultValue: "?") String name,
    String? modifier,
    String? holdSize,
    @JsonKey(defaultValue: 10) int seconds,
    @JsonKey(defaultValue: 0) int minutes,
    String uniqueId,
    @JsonKey(defaultValue: false) bool isRestBetweenSets,
  ) = _HangboardItemModel;

  factory HangboardItemModel.fromJson(json) =>
      _$HangboardItemModelFromJson(json);

  factory HangboardItemModel.exampleEdgeItem() {
    return HangboardItemModel(
      HangboardItemModel.itemNames[1],
      null,
      null,
      10,
      0,
      const Uuid().v4(),
      false,
    );
  }

  factory HangboardItemModel.countdown(int seconds) {
    return HangboardItemModel(
      "Countdown",
      null,
      null,
      seconds,
      0,
      const Uuid().v4(),
      false,
    );
  }

  factory HangboardItemModel.rest({
    int seconds = 10,
    int minutes = 0,
    bool isRestBetweenSets = false,
  }) {
    return HangboardItemModel(
      restItemName,
      null,
      null,
      seconds,
      minutes,
      const Uuid().v4(),
      isRestBetweenSets,
    );
  }

  HangboardItemModel copyWithNewUniqueId() =>
      copyWith(uniqueId: const Uuid().v4());
}
