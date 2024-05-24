// ignore_for_file: invalid_annotation_target

import 'package:climb_logger/models/logbook_entry_model.dart';
import 'package:climb_logger/util/ascent_type.dart';
import 'package:climb_logger/util/chart_util.dart';
import 'package:climb_logger/util/chart_y_axis_type.dart';
import 'package:climb_logger/util/climb_type.dart';
import 'package:climb_logger/util/grading_system.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

part 'chart_settings_model.freezed.dart';

@freezed
class ChartSettingsModel with _$ChartSettingsModel {
  ChartSettingsModel._();

  factory ChartSettingsModel(
    bool showRedpoints,
    bool showFlashes,
    bool showOnsights,
    bool showProjects,
    ChartYAxisType chartYAxisType,
    GradingSystem? gradingSystem,
  ) = _ChartSettingsModel;

  ChartAxis buildChartAxis(int maximum) {
    switch (chartYAxisType) {
      case ChartYAxisType.bouldering:
        return ChartUtil.gradeNumericAxis(gradingSystem!, maximum);
      case ChartYAxisType.sport:
        return ChartUtil.gradeNumericAxis(gradingSystem!, maximum);
      case ChartYAxisType.score:
        return ChartUtil.numericAxis(maximum);
    }
  }

  List<LogbookEntryModel> filterEntries(
    List<LogbookEntryModel> logbookEntries,
  ) {
    Iterable<LogbookEntryModel> entries = List.of(logbookEntries);

    if (!showRedpoints) {
      entries =
          entries.where((entry) => entry.ascentType != AscentType.redpoint);
    }

    if (!showFlashes) {
      entries = entries.where((entry) => entry.ascentType != AscentType.flash);
    }

    if (!showOnsights) {
      entries =
          entries.where((entry) => entry.ascentType != AscentType.onsight);
    }

    if (!showProjects) {
      entries =
          entries.where((entry) => entry.ascentType != AscentType.project);
    }

    switch (chartYAxisType) {
      case ChartYAxisType.bouldering:
        return entries
            .where((e) => e.climbType == ClimbType.boulder)
            .where((e) => gradingSystem!.labels.contains(e.gradeLabel))
            .toList();

      case ChartYAxisType.sport:
        return entries
            .where((e) => gradingSystem!.labels.contains(e.gradeLabel))
            .where((e) => e.climbType == ClimbType.sport)
            .toList();

      default:
        return entries.toList();
    }
  }
}
