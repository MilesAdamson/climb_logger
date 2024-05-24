import 'package:climb_logger/charts/models/tags_bar_chart_data.dart';
import 'package:climb_logger/models/chart_settings_model.dart';
import 'package:climb_logger/models/logbook_entry_model.dart';
import 'package:climb_logger/util/ascent_type.dart';
import 'package:climb_logger/util/build_context_extensions.dart';
import 'package:climb_logger/util/chart_util.dart';
import 'package:climb_logger/util/int_list_extensions.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class TagsBarChart extends StatefulWidget {
  final List<LogbookEntryModel> logbookEntries;
  final ChartSettingsModel chartSettings;
  final bool showLegend;

  const TagsBarChart({
    Key? key,
    required this.chartSettings,
    required this.logbookEntries,
    required this.showLegend,
  }) : super(key: key);

  @override
  State<TagsBarChart> createState() => _TagsBarChartState();
}

class _TagsBarChartState extends State<TagsBarChart> {
  late final chartData = TagsBarChartData.fromLogbookEntries(
    widget.logbookEntries,
    widget.chartSettings,
    context.bloc.state.settings.tags,
  );

  int get maximum => chartData
      .map((data) => data.maximum)
      .maxOrDefault(kDefaultGradeAxisMaximum);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: SfCartesianChart(
        zoomPanBehavior: ChartUtil.xZoomPanBehavior,
        legend: Legend(isVisible: widget.showLegend),
        primaryXAxis: ChartUtil.categoryAxis("Tag"),
        primaryYAxis: widget.chartSettings.buildChartAxis(maximum),
        series: _getStackedColumnSeries(chartData),
      ),
    );
  }

  List<ColumnSeries<TagsBarChartData, String>> _getStackedColumnSeries(
      List<TagsBarChartData> chartData) {
    final data = <ColumnSeries<TagsBarChartData, String>>[
      if (widget.chartSettings.showRedpoints)
        ColumnSeries<TagsBarChartData, String>(
          dataSource: chartData,
          name: "Best Redpoint",
          xValueMapper: (data, _) => data.tag,
          color: AscentType.redpoint.color(context),
          yValueMapper: (data, _) => data.bestRedpoint,
        ),
      if (widget.chartSettings.showFlashes)
        ColumnSeries<TagsBarChartData, String>(
          dataSource: chartData,
          name: "Best Flash",
          xValueMapper: (data, _) => data.tag,
          color: AscentType.flash.color(context),
          yValueMapper: (data, _) => data.bestFlash,
        ),
      if (widget.chartSettings.showOnsights)
        ColumnSeries<TagsBarChartData, String>(
          dataSource: chartData,
          name: "Best Onsight",
          xValueMapper: (data, _) => data.tag,
          color: AscentType.onsight.color(context),
          yValueMapper: (data, _) => data.bestOnsight,
        ),
      if (widget.chartSettings.showProjects)
        ColumnSeries<TagsBarChartData, String>(
          dataSource: chartData,
          name: "Best Project",
          xValueMapper: (data, _) => data.tag,
          color: AscentType.project.color(context),
          yValueMapper: (data, _) => data.bestProject,
        ),
    ];

    return data;
  }
}
