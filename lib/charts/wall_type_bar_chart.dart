import 'package:climb_logger/charts/models/wall_type_bar_chart_data.dart';
import 'package:climb_logger/models/chart_settings_model.dart';
import 'package:climb_logger/models/logbook_entry_model.dart';
import 'package:climb_logger/util/ascent_type.dart';
import 'package:climb_logger/util/chart_util.dart';
import 'package:climb_logger/util/int_list_extensions.dart';
import 'package:climb_logger/util/wall_type.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class WallTypeBarChart extends StatefulWidget {
  final List<LogbookEntryModel> logbookEntries;
  final ChartSettingsModel chartSettings;
  final bool showLegend;

  const WallTypeBarChart({
    Key? key,
    required this.chartSettings,
    required this.logbookEntries,
    required this.showLegend,
  }) : super(key: key);

  @override
  State<WallTypeBarChart> createState() => _WallTypeBarChartState();
}

class _WallTypeBarChartState extends State<WallTypeBarChart> {
  late final chartData = WallTypeBarChartData.fromLogbookEntries(
      widget.logbookEntries, widget.chartSettings);

  int get maximum => chartData
      .map((data) => data.maximum)
      .maxOrDefault(kDefaultGradeAxisMaximum);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: SfCartesianChart(
        zoomPanBehavior: ChartUtil.staticChart,
        legend: Legend(isVisible: widget.showLegend),
        primaryXAxis: ChartUtil.categoryAxis("Wall Type"),
        primaryYAxis: widget.chartSettings.buildChartAxis(maximum),
        series: _getStackedColumnSeries(chartData),
      ),
    );
  }

  List<ColumnSeries<WallTypeBarChartData, String>> _getStackedColumnSeries(
      List<WallTypeBarChartData> chartData) {
    final data = <ColumnSeries<WallTypeBarChartData, String>>[
      if (widget.chartSettings.showRedpoints)
        ColumnSeries<WallTypeBarChartData, String>(
          dataSource: chartData,
          name: "Best Redpoint",
          xValueMapper: (data, _) => data.wallType.label,
          color: AscentType.redpoint.color(context),
          yValueMapper: (data, _) => data.bestRedpoint,
        ),
      if (widget.chartSettings.showFlashes)
        ColumnSeries<WallTypeBarChartData, String>(
          dataSource: chartData,
          name: "Best Flash",
          xValueMapper: (data, _) => data.wallType.label,
          color: AscentType.flash.color(context),
          yValueMapper: (data, _) => data.bestFlash,
        ),
      if (widget.chartSettings.showOnsights)
        ColumnSeries<WallTypeBarChartData, String>(
          dataSource: chartData,
          name: "Best Onsight",
          xValueMapper: (data, _) => data.wallType.label,
          color: AscentType.onsight.color(context),
          yValueMapper: (data, _) => data.bestOnsight,
        ),
      if (widget.chartSettings.showProjects)
        ColumnSeries<WallTypeBarChartData, String>(
          dataSource: chartData,
          name: "Best Project",
          xValueMapper: (data, _) => data.wallType.label,
          color: AscentType.project.color(context),
          yValueMapper: (data, _) => data.bestProject,
        ),
    ];

    return data;
  }
}
