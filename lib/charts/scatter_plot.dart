import 'package:climb_logger/charts/models/scatter_plot_grade_data.dart';
import 'package:climb_logger/models/chart_settings_model.dart';
import 'package:climb_logger/models/logbook_entry_model.dart';
import 'package:climb_logger/util/ascent_type.dart';
import 'package:climb_logger/util/chart_util.dart';
import 'package:climb_logger/util/int_list_extensions.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ScatterPlot extends StatefulWidget {
  final List<LogbookEntryModel> logbookEntries;
  final ChartSettingsModel chartSettings;
  final bool isSingleDayChart;

  const ScatterPlot({
    Key? key,
    required this.logbookEntries,
    required this.chartSettings,
    this.isSingleDayChart = false,
  }) : super(key: key);

  @override
  State<ScatterPlot> createState() => _ScatterPlotState();
}

class _ScatterPlotState extends State<ScatterPlot> {
  late final chartData = ScatterPlotGradeData.fromLogbookEntries(
      widget.logbookEntries, widget.chartSettings);

  late final maximumGradeIndex =
      chartData.map((e) => e.value).maxOrDefault(kDefaultGradeAxisMaximum);

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      legend: Legend(isVisible: true),
      zoomPanBehavior: ChartUtil.xZoomPanBehavior,
      plotAreaBorderWidth: 0,
      primaryXAxis:
          widget.isSingleDayChart ? ChartUtil.timeAxis : ChartUtil.dateTimeAxis,
      primaryYAxis: widget.chartSettings.buildChartAxis(
        maximumGradeIndex,
      ),
      tooltipBehavior: TooltipBehavior(enable: true),
      series: _getDefaultScatterSeries(chartData),
    );
  }

  List<ScatterSeries<ScatterPlotGradeData, DateTime>> _getDefaultScatterSeries(
      List<ScatterPlotGradeData> chartData) {
    return <ScatterSeries<ScatterPlotGradeData, DateTime>>[
      if (widget.chartSettings.showRedpoints)
        ScatterSeries<ScatterPlotGradeData, DateTime>(
          dataSource: chartData
              .where((data) => data.ascentType == AscentType.redpoint)
              .toList(),
          xValueMapper: (ScatterPlotGradeData data, _) => data.dateTime,
          yValueMapper: (ScatterPlotGradeData data, _) => data.value,
          markerSettings: MarkerSettings(
            height: 10,
            width: 10,
            color: AscentType.redpoint.color(context),
          ),
          color: AscentType.redpoint.color(context),
          name: AscentType.redpoint.pluralLabel,
        ),
      if (widget.chartSettings.showFlashes)
        ScatterSeries<ScatterPlotGradeData, DateTime>(
          dataSource: chartData
              .where((data) => data.ascentType == AscentType.flash)
              .toList(),
          xValueMapper: (ScatterPlotGradeData data, _) => data.dateTime,
          yValueMapper: (ScatterPlotGradeData data, _) => data.value,
          markerSettings: MarkerSettings(
            height: 10,
            width: 10,
            color: AscentType.flash.color(context),
          ),
          name: AscentType.flash.pluralLabel,
          color: AscentType.flash.color(context),
        ),
      if (widget.chartSettings.showOnsights)
        ScatterSeries<ScatterPlotGradeData, DateTime>(
          dataSource: chartData
              .where((data) => data.ascentType == AscentType.onsight)
              .toList(),
          xValueMapper: (ScatterPlotGradeData data, _) => data.dateTime,
          yValueMapper: (ScatterPlotGradeData data, _) => data.value,
          markerSettings: MarkerSettings(
            height: 10,
            width: 10,
            color: AscentType.onsight.color(context),
          ),
          name: AscentType.onsight.pluralLabel,
          color: AscentType.onsight.color(context),
        ),
      if (widget.chartSettings.showProjects)
        ScatterSeries<ScatterPlotGradeData, DateTime>(
          dataSource: chartData
              .where((data) => data.ascentType == AscentType.project)
              .toList(),
          xValueMapper: (ScatterPlotGradeData data, _) => data.dateTime,
          yValueMapper: (ScatterPlotGradeData data, _) => data.value,
          markerSettings: MarkerSettings(
            height: 10,
            width: 10,
            color: AscentType.project.color(context),
          ),
          name: AscentType.project.pluralLabel,
          color: AscentType.project.color(context),
        ),
    ];
  }
}
