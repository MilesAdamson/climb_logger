// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'hangboard_chart_settings_model.freezed.dart';

@freezed
class HangboardChartSettingsModel with _$HangboardChartSettingsModel {
  HangboardChartSettingsModel._();

  factory HangboardChartSettingsModel(
    List<String> holdSizes,
  ) = _HangboardChartSettingsModel;
}
