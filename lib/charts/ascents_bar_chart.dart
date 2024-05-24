import 'package:climb_logger/charts/models/grade_bar_chart_data.dart';
import 'package:climb_logger/models/chart_settings_model.dart';
import 'package:climb_logger/models/logbook_entry_model.dart';
import 'package:climb_logger/util/ascent_type.dart';
import 'package:climb_logger/util/chart_util.dart';
import 'package:climb_logger/util/int_list_extensions.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AscentsBarChart extends StatefulWidget {
  final List<LogbookEntryModel> logbookEntries;
  final ChartSettingsModel chartSettings;

  const AscentsBarChart({
    Key? key,
    required this.chartSettings,
    required this.logbookEntries,
  }) : super(key: key);

  @override
  State<AscentsBarChart> createState() => _AscentsBarChartState();
}

class _AscentsBarChartState extends State<AscentsBarChart> {
  late final chartData = GradeBarChartData.fromLogbookEntries(
      widget.logbookEntries, widget.chartSettings);

  late final maximum =
      chartData.map((e) => e.sum).maxOrDefault(kDefaultGradeAxisMaximum);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: SfCartesianChart(
        zoomPanBehavior: ChartUtil.staticChart,
        legend: Legend(isVisible: true),
        plotAreaBorderWidth: 0,
        primaryXAxis: ChartUtil.categoryAxis("Grade"),
        primaryYAxis: ChartUtil.sumAxis(maximum.toDouble()),
        series: _getStackedColumnSeries(chartData),
      ),
    );
  }

  List<StackedColumnSeries<GradeBarChartData, String>> _getStackedColumnSeries(
      List<GradeBarChartData> chartData) {
    return <StackedColumnSeries<GradeBarChartData, String>>[
      if (maximum != 0 && widget.chartSettings.showRedpoints)
        StackedColumnSeries<GradeBarChartData, String>(
          dataSource: chartData,
          xValueMapper: (GradeBarChartData data, _) => data.gradeLabel,
          yValueMapper: (GradeBarChartData data, _) => data.redpoints,
          name: 'Redpoints',
          color: AscentType.redpoint.color(context),
        ),
      if (maximum != 0 && widget.chartSettings.showFlashes)
        StackedColumnSeries<GradeBarChartData, String>(
          dataSource: chartData,
          xValueMapper: (GradeBarChartData data, _) => data.gradeLabel,
          yValueMapper: (GradeBarChartData data, _) => data.flashes,
          name: 'Flashes',
          color: AscentType.flash.color(context),
        ),
      if (maximum != 0 && widget.chartSettings.showOnsights)
        StackedColumnSeries<GradeBarChartData, String>(
          dataSource: chartData,
          xValueMapper: (GradeBarChartData data, _) => data.gradeLabel,
          yValueMapper: (GradeBarChartData data, _) => data.onsights,
          name: 'Onsights',
          color: AscentType.onsight.color(context),
        ),
      if (maximum != 0 && widget.chartSettings.showProjects)
        StackedColumnSeries<GradeBarChartData, String>(
          dataSource: chartData,
          xValueMapper: (GradeBarChartData data, _) => data.gradeLabel,
          yValueMapper: (GradeBarChartData data, _) => data.projects,
          name: 'Projects',
          color: AscentType.project.color(context),
        ),
    ];
  }
}
