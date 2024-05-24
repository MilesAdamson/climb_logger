// ignore_for_file: invalid_annotation_target

import 'package:climb_logger/theme/app_color.dart';
import 'package:climb_logger/util/ascent_type.dart';
import 'package:climb_logger/util/chart_y_axis_type.dart';
import 'package:climb_logger/util/climb_type.dart';
import 'package:climb_logger/util/grading_system.dart';
import 'package:climb_logger/util/measurement_system.dart';
import 'package:climb_logger/util/wall_type.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_model.freezed.dart';
part 'settings_model.g.dart';

@freezed
class SettingsModel with _$SettingsModel {
  static const defaultTags = [
    "Crimps",
    "Slopers",
    "Edges",
    "Jugs",
    "Pinches",
    "Dynamic",
    "Static",
    "Dyno",
    "Volumes",
    "Reachy",
    "Scrunchy",
    "Technical",
    "Outdoors",
  ];

  SettingsModel._();

  GradingSystem get boulderingGradingSystem => gradeMap[boulderingSystemKey]!;

  GradingSystem get sportGradingSystem => gradeMap[sportSystemKey]!;

  @JsonSerializable()
  factory SettingsModel(
    @JsonKey(defaultValue: AscentType.redpoint) AscentType ascentType,
    @JsonKey(defaultValue: ClimbType.boulder) ClimbType climbType,
    @JsonKey(defaultValue: WallType.overhang) WallType wallType,
    @JsonKey(defaultValue: "vermin") String boulderingSystemKey,
    @JsonKey(defaultValue: "yosemite") String sportSystemKey,
    @JsonKey(defaultValue: false) bool exactGradesOnly,
    @JsonKey(defaultValue: true) bool playTimerSounds,
    @JsonKey(defaultValue: SettingsModel.defaultTags) List<String> tags,
    @JsonKey(name: "colorOne") int? colorOneValue,
    @JsonKey(name: "colorTwo") int? colorTwoValue,
    @JsonKey(name: "colorThree") int? colorThreeValue,
    @JsonKey(name: "colorFour") int? colorFourValue,
    @JsonKey(name: "colorFive") int? colorFiveValue,
    @JsonKey(name: "colorSix") int? colorSixValue,
    @JsonKey(defaultValue: ChartYAxisType.bouldering)
        ChartYAxisType chartYAxisType,
    @JsonKey(defaultValue: MeasurementSystem.metric)
        MeasurementSystem measurementSystem,
  ) = _SettingsModel;

  factory SettingsModel.fromJson(json) => _$SettingsModelFromJson(json);

  List<Color> get colors => [
        colorOne,
        colorTwo,
        colorThree,
        colorFour,
        colorFive,
        colorSix,
      ];

  late final colorOne =
      Color(colorOneValue ?? AppColor.colorOneDefaultValue.value);
  late final colorTwo =
      Color(colorTwoValue ?? AppColor.colorTwoDefaultValue.value);
  late final colorThree =
      Color(colorThreeValue ?? AppColor.colorThreeDefaultValue.value);
  late final colorFour =
      Color(colorFourValue ?? AppColor.colorFourDefaultValue.value);
  late final colorFive =
      Color(colorFiveValue ?? AppColor.colorFiveDefaultValue.value);
  late final colorSix =
      Color(colorSixValue ?? AppColor.colorSixDefaultValue.value);

  factory SettingsModel.defaultValues() {
    return SettingsModel(
      AscentType.redpoint,
      ClimbType.boulder,
      WallType.overhang,
      const VerminSystem().systemKey,
      const YosemiteSystem().systemKey,
      false,
      true,
      defaultTags,
      AppColor.colorOneDefaultValue.value,
      AppColor.colorTwoDefaultValue.value,
      AppColor.colorThreeDefaultValue.value,
      AppColor.colorFourDefaultValue.value,
      AppColor.colorFiveDefaultValue.value,
      AppColor.colorSixDefaultValue.value,
      ChartYAxisType.bouldering,
      MeasurementSystem.metric,
    );
  }
}
