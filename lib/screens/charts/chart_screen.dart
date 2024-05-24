import 'package:climb_logger/charts/ascents_bar_chart.dart';
import 'package:climb_logger/charts/best_ascents_chart.dart';
import 'package:climb_logger/charts/chart_scaffold.dart';
import 'package:climb_logger/charts/cumulative_score_chart.dart';
import 'package:climb_logger/charts/models/score_chart_data.dart';
import 'package:climb_logger/charts/pie_chart_wall_type.dart';
import 'package:climb_logger/charts/scatter_plot.dart';
import 'package:climb_logger/charts/score_chart_daily.dart';
import 'package:climb_logger/charts/tags_bar_chart.dart';
import 'package:climb_logger/charts/wall_type_bar_chart.dart';
import 'package:climb_logger/models/chart_settings_model.dart';
import 'package:climb_logger/models/hangboard_entry_model.dart';
import 'package:climb_logger/models/logbook_entry_model.dart';
import 'package:climb_logger/util/build_context_extensions.dart';
import 'package:climb_logger/util/chart_type.dart';
import 'package:climb_logger/util/map_extensions.dart';
import 'package:flutter/material.dart';

class ChartScreenArgs {
  final ChartType chartType;
  final ChartSettingsModel? chartSettings;
  final List<LogbookEntryModel>? entries;

  ChartScreenArgs(
    this.chartType,
    this.chartSettings,
    this.entries,
  ) {
    assert(!chartType.shouldPromptForSettings || chartSettings != null,
        "Charts which require settings need them passed in");
  }
}

class ChartScreen extends StatelessWidget {
  final ChartScreenArgs args;

  const ChartScreen({
    Key? key,
    required this.args,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final entries =
        args.entries ?? context.bloc.state.logbookEntryMap.mapToData();
    final hangboardEntries = context.bloc.state.hangboardEntryMap.mapToData();

    return ChartScaffold(
      appBar: AppBar(),
      body: buildChart(entries, hangboardEntries),
    );
  }

  Widget buildChart(
    List<LogbookEntryModel> entries,
    List<HangboardEntryModel> hangboardEntries,
  ) {
    switch (args.chartType) {
      case ChartType.scoreDaily:
        return ScoreChartDaily(
          key: Key(args.chartType.toString()),
          chartData: ScoreChartData.fromLogbookEntries(
            entries,
            hangboardEntries,
          ),
        );

      case ChartType.scatter:
        return ScatterPlot(
          logbookEntries: entries,
          chartSettings: args.chartSettings!,
          key: Key(args.chartType.toString()),
        );

      case ChartType.barAllTime:
        return AscentsBarChart(
          key: Key(args.chartType.toString()),
          logbookEntries: entries,
          chartSettings: args.chartSettings!,
        );

      case ChartType.scoreCumulative:
        return CumulativeScoreChart(
          key: Key(args.chartType.toString()),
          chartData: ScoreChartData.cumulative(
            entries,
            hangboardEntries,
          ),
        );

      case ChartType.hardestOverTime:
        return BestAscentsChart(
          key: Key(args.chartType.toString()),
          logbookEntries: entries,
          chartSettings: args.chartSettings!,
        );

      case ChartType.pieChartWallType:
        return PieChartWallType(
          key: Key(args.chartType.toString()),
          logbookEntries: entries,
        );

      case ChartType.barChartWallType:
        return WallTypeBarChart(
          key: Key(args.chartType.toString()),
          logbookEntries: entries,
          chartSettings: args.chartSettings!,
          showLegend: true,
        );

      case ChartType.barChartTags:
        return TagsBarChart(
          key: Key(args.chartType.toString()),
          logbookEntries: entries,
          chartSettings: args.chartSettings!,
          showLegend: true,
        );
    }
  }
}
