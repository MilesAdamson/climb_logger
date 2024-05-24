import 'package:climb_logger/util/grading_system.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

const kDefaultGradeAxisMaximum = 10;
const kDefaultScoreAxisMaximum = 1000;
const kDefaultMinutesAxisMaximum = 10.0;

class ChartUtil {
  static final xZoomPanBehavior = ZoomPanBehavior(
    enablePanning: true,
    enablePinching: true,
    zoomMode: ZoomMode.x,
    maximumZoomLevel: 0.0,
  );

  static final staticChart = ZoomPanBehavior(
    enablePanning: false,
    enablePinching: false,
  );

  static NumericAxis numericAxis(
    int maximum, {
    String label = "Score",
  }) {
    var interval = (maximum.toDouble() / 10).truncateToDouble();
    if (interval < 1) {
      interval = 1;
    }
    return NumericAxis(
      minimum: 0,
      maximum: (maximum.toDouble() * 1.1).truncateToDouble(),
      interval: interval,
      title: AxisTitle(text: label),
    );
  }

  static CategoryAxis categoryAxis(
    String title, {
    bool arrangeByIndex = false,
  }) =>
      CategoryAxis(
        majorGridLines: const MajorGridLines(width: 1),
        title: AxisTitle(text: title),
        arrangeByIndex: arrangeByIndex,
      );

  static NumericAxis gradeNumericAxis(
      GradingSystem gradingSystem, int maxGradeIndex) {
    late final double maximum;
    if (maxGradeIndex == 0 ||
        maxGradeIndex + 1 >= gradingSystem.labels.length) {
      maximum = gradingSystem.labels.length.toDouble();
    } else {
      maximum = maxGradeIndex + 1.0;
    }

    return NumericAxis(
      maximum: maximum,
      title: AxisTitle(text: "Grade"),
      axisLabelFormatter: (details) {
        // Plots need axis labels higher than the highest selectable grade
        final allLabels = [
          ...gradingSystem.labels,
          ...gradingSystem.extensionLabels,
        ];

        final i = details.value.toInt().clamp(0, allLabels.length - 1);
        return ChartAxisLabel(allLabels[i], const TextStyle());
      },
    );
  }

  static final dateTimeAxis = DateTimeAxis(
    title: AxisTitle(text: "Date"),
    labelIntersectAction: AxisLabelIntersectAction.multipleRows,
    majorGridLines: const MajorGridLines(width: 0),
    rangePadding: ChartRangePadding.additional,
  );

  static final timeAxis = DateTimeAxis(
    title: AxisTitle(text: "Time"),
    dateFormat: DateFormat.jm(),
    labelIntersectAction: AxisLabelIntersectAction.multipleRows,
    majorGridLines: const MajorGridLines(width: 0),
    rangePadding: ChartRangePadding.additional,
  );

  static NumericAxis sumAxis(
    double maximum, {
    String? label,
  }) =>
      NumericAxis(
        axisLine: const AxisLine(width: 0),
        majorTickLines: const MajorTickLines(size: 0),
        minorTicksPerInterval: 0,
        interval: (maximum / 10).round() + 1,
        maximum: maximum,
        title: AxisTitle(text: label ?? "Count"),
      );
}
