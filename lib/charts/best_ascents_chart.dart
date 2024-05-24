import 'package:climb_logger/charts/models/best_ascent_data.dart';
import 'package:climb_logger/models/chart_settings_model.dart';
import 'package:climb_logger/models/logbook_entry_model.dart';
import 'package:climb_logger/util/ascent_type.dart';
import 'package:climb_logger/util/chart_util.dart';
import 'package:climb_logger/util/int_list_extensions.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BestAscentsChart extends StatefulWidget {
  final List<LogbookEntryModel> logbookEntries;
  final ChartSettingsModel chartSettings;

  const BestAscentsChart({
    Key? key,
    required this.logbookEntries,
    required this.chartSettings,
  }) : super(key: key);

  @override
  State<BestAscentsChart> createState() => _BestAscentsChartState();
}

class _BestAscentsChartState extends State<BestAscentsChart> {
  late final chartData = BestAscentData.fromLogbookEntries(
      widget.logbookEntries, widget.chartSettings);

  late final redpointData =
      chartData.where((d) => d.ascentType == AscentType.redpoint).toList();

  late final flashData =
      chartData.where((d) => d.ascentType == AscentType.flash).toList();

  late final onsightData =
      chartData.where((d) => d.ascentType == AscentType.onsight).toList();

  late final projectData =
      chartData.where((d) => d.ascentType == AscentType.project).toList();

  late final maximumGradeIndex =
      chartData.map((e) => e.gradeIndex).maxOrDefault(kDefaultGradeAxisMaximum);

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      legend: Legend(isVisible: true),
      zoomPanBehavior: ChartUtil.xZoomPanBehavior,
      plotAreaBorderWidth: 0.0,
      primaryXAxis: ChartUtil.dateTimeAxis,
      primaryYAxis: widget.chartSettings.buildChartAxis(maximumGradeIndex),
      series: <ChartSeries<BestAscentData, DateTime>>[
        if (redpointData.isNotEmpty && widget.chartSettings.showRedpoints)
          LineSeries<BestAscentData, DateTime>(
            dataSource: redpointData,
            xValueMapper: (BestAscentData data, _) => data.dateTime,
            yValueMapper: (BestAscentData data, _) => data.gradeIndex,
            color: AscentType.redpoint.color(context),
            name: "Best ${AscentType.redpoint.label}",
          ),
        if (flashData.isNotEmpty && widget.chartSettings.showFlashes)
          LineSeries<BestAscentData, DateTime>(
            dataSource: flashData,
            xValueMapper: (BestAscentData data, _) => data.dateTime,
            yValueMapper: (BestAscentData data, _) => data.gradeIndex,
            color: AscentType.flash.color(context),
            name: "Best ${AscentType.flash.label}",
          ),
        if (onsightData.isNotEmpty && widget.chartSettings.showOnsights)
          LineSeries<BestAscentData, DateTime>(
            dataSource: onsightData,
            xValueMapper: (BestAscentData data, _) => data.dateTime,
            yValueMapper: (BestAscentData data, _) => data.gradeIndex,
            color: AscentType.onsight.color(context),
            name: "Best ${AscentType.onsight.label}",
          ),
        if (projectData.isNotEmpty && widget.chartSettings.showProjects)
          LineSeries<BestAscentData, DateTime>(
            dataSource: projectData,
            xValueMapper: (BestAscentData data, _) => data.dateTime,
            yValueMapper: (BestAscentData data, _) => data.gradeIndex,
            color: AscentType.project.color(context),
            name: "Best ${AscentType.project.label}",
          ),
      ],
    );
  }
}
