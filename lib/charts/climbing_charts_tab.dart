import 'package:climb_logger/charts/ascents_bar_chart.dart';
import 'package:climb_logger/charts/best_ascents_chart.dart';
import 'package:climb_logger/charts/cumulative_score_chart.dart';
import 'package:climb_logger/charts/models/score_chart_data.dart';
import 'package:climb_logger/charts/pie_chart_wall_type.dart';
import 'package:climb_logger/charts/scatter_plot.dart';
import 'package:climb_logger/charts/score_chart_daily.dart';
import 'package:climb_logger/charts/tags_bar_chart.dart';
import 'package:climb_logger/charts/wall_type_bar_chart.dart';
import 'package:climb_logger/components/bottom_sheets/chart_settings_bottom_sheet.dart';
import 'package:climb_logger/models/chart_settings_model.dart';
import 'package:climb_logger/models/logbook_entry_model.dart';
import 'package:climb_logger/routing/navigator_extensions.dart';
import 'package:climb_logger/state/app_state.dart';
import 'package:climb_logger/theme/ui_constants.dart';
import 'package:climb_logger/util/build_context_extensions.dart';
import 'package:climb_logger/util/chart_type.dart';
import 'package:climb_logger/util/chart_y_axis_type.dart';
import 'package:climb_logger/util/grading_system.dart';
import 'package:flutter/material.dart';

class ClimbingChartsTab extends StatefulWidget {
  const ClimbingChartsTab({Key? key}) : super(key: key);

  @override
  State<ClimbingChartsTab> createState() => ClimbingChartsTabState();
}

class ClimbingChartsTabState extends State<ClimbingChartsTab> {
  AppState get state => context.bloc.state;

  List<String> get tags => context.bloc.state.settings.tags;

  late final boulderingSystem = state.settings.boulderingGradingSystem;
  late final sportSystem = state.settings.sportGradingSystem;
  late final randomBoulders = List.generate(
      20, (i) => LogbookEntryModel.randomEntry(boulderingSystem, tags));
  late final randomRoutes = List.generate(
      20, (i) => LogbookEntryModel.randomEntry(sportSystem, tags));

  late final routeChartSettings = ChartSettingsModel(
      true, true, true, false, ChartYAxisType.sport, sportSystem);

  late final boulderChartSettings = ChartSettingsModel(
      true, true, true, false, ChartYAxisType.bouldering, boulderingSystem);

  @override
  Widget build(BuildContext context) {
    final children = buildClimbingChartPreviews(
      context,
      state,
      boulderingSystem,
      sportSystem,
    );

    return ListView.builder(
      padding: kListViewPadding,
      itemCount: children.length,
      itemBuilder: (context, i) => children[i],
    );
  }

  List<Widget> buildClimbingChartPreviews(
    BuildContext context,
    AppState state,
    GradingSystem boulderingSystem,
    GradingSystem sportSystem,
  ) {
    return ChartType.values
        .map(
          (chartType) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: ListTile(
                      title: Text(chartType.label),
                      subtitle: Text(chartType.description),
                      trailing: TextButton(
                        child: const Text("VIEW"),
                        onPressed: () => onViewChartTapped(chartType),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 200,
                    child: buildExampleCharts(
                      state,
                      chartType,
                      boulderingSystem,
                      sportSystem,
                      randomBoulders,
                      randomRoutes,
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
        .toList();
  }

  Widget buildExampleCharts(
    AppState state,
    ChartType chartType,
    GradingSystem boulderingSystem,
    GradingSystem sportSystem,
    List<LogbookEntryModel> randomBoulders,
    List<LogbookEntryModel> randomRoutes,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Builder(
        builder: (context) {
          switch (chartType) {
            case ChartType.scoreDaily:
              return ScoreChartDaily(
                chartData: ScoreChartData.fromLogbookEntries(
                  randomBoulders,
                  [],
                ),
              );

            case ChartType.scatter:
              return ScatterPlot(
                logbookEntries: randomRoutes,
                chartSettings: routeChartSettings,
              );

            case ChartType.barAllTime:
              return AscentsBarChart(
                chartSettings: boulderChartSettings,
                logbookEntries: randomBoulders,
              );

            case ChartType.scoreCumulative:
              return CumulativeScoreChart(
                chartData: ScoreChartData.cumulative(
                  randomRoutes,
                  [],
                ),
              );

            case ChartType.hardestOverTime:
              return BestAscentsChart(
                logbookEntries: randomRoutes,
                chartSettings: routeChartSettings,
              );

            case ChartType.pieChartWallType:
              return PieChartWallType(logbookEntries: randomBoulders);

            case ChartType.barChartWallType:
              return WallTypeBarChart(
                showLegend: false,
                logbookEntries: randomRoutes,
                chartSettings: routeChartSettings,
              );

            case ChartType.barChartTags:
              return TagsBarChart(
                showLegend: false,
                logbookEntries: randomBoulders,
                chartSettings: boulderChartSettings,
              );
          }
        },
      ),
    );
  }

  void onViewChartTapped(ChartType chartType) async {
    if (chartType.shouldPromptForSettings) {
      final settings = await showChartSettingsBottomSheet(context, chartType);
      if (settings != null) {
        Navigator.of(context).chart(chartType, settings);
      }
    } else {
      Navigator.of(context).chart(chartType, null);
    }
  }
}
