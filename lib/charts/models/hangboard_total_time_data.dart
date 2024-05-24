import 'package:climb_logger/models/hangboard_entry_model.dart';
import 'package:climb_logger/models/hangboard_item_model.dart';
import 'package:climb_logger/services/logger.dart';
import 'package:climb_logger/util/hangboard_plot_type.dart';
import 'package:climb_logger/util/measurement_system.dart';

class HangboardBarChartData {
  final String xLabel;
  final int yValue;

  double get minutes => yValue.toDouble() / 60.0;

  HangboardBarChartData(this.xLabel, this.yValue);

  static List<HangboardBarChartData> build(
    List<HangboardEntryModel> entries,
    HangboardPlotType hangboardPlotType,
    MeasurementSystem measurementSystem,
  ) {
    switch (hangboardPlotType) {
      case HangboardPlotType.holdName:
        return totalTimePerHold(entries);
      case HangboardPlotType.holdSize:
        return totalTimePerHoldSize(entries, measurementSystem);
    }
  }

  static List<HangboardBarChartData> totalTimePerHold(
    List<HangboardEntryModel> entries,
  ) {
    final durationMap = <String, Duration>{};

    for (final entry in entries) {
      final nonRestItems = entry.hangboardRoutine.nonRestItems;

      for (final item in nonRestItems) {
        durationMap[item.name] =
            (durationMap[item.name] ?? Duration.zero) + item.duration;
      }
    }

    return durationMap.keys
        .map(
          (holdName) => HangboardBarChartData(
            holdName,
            durationMap[holdName]!.inSeconds,
          ),
        )
        .toList();
  }

  static List<HangboardBarChartData> totalTimePerHoldSize(
    List<HangboardEntryModel> entries,
    MeasurementSystem measurementSystem,
  ) {
    final durationMap = <String, Duration>{};

    for (final entry in entries) {
      final workout = entry.hangboardRoutine.completeWorkout;
      for (final item in workout.where((i) => i.holdSize != null)) {
        durationMap[item.holdSize!] =
            (durationMap[item.holdSize] ?? Duration.zero) + item.duration;
      }
    }

    Logger.captureInfo(durationMap.keys.join(", "));

    return [
      if (measurementSystem == MeasurementSystem.metric)
        ...HangboardItemModel.holdSizesMetric,
      if (measurementSystem == MeasurementSystem.imperial)
        ...HangboardItemModel.holdSizesImperial
    ]
        .map(
          (holdSize) => HangboardBarChartData(
            holdSize,
            durationMap[holdSize]?.inSeconds ?? 0,
          ),
        )
        .toList();
  }
}
