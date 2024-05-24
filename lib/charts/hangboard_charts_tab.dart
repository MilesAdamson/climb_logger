import 'package:climb_logger/charts/best_hang_chart.dart';
import 'package:climb_logger/charts/hangboard_bar_chart.dart';
import 'package:climb_logger/charts/pie_chart_hangboard_hold_type.dart';
import 'package:climb_logger/components/bottom_sheets/hangboard_chart_settings_bottom_sheet.dart';
import 'package:climb_logger/models/hangboard_entry_model.dart';
import 'package:climb_logger/routing/navigator_extensions.dart';
import 'package:climb_logger/state/app_state.dart';
import 'package:climb_logger/theme/ui_constants.dart';
import 'package:climb_logger/util/build_context_extensions.dart';
import 'package:climb_logger/util/hangboard_chart_type.dart';
import 'package:climb_logger/util/hangboard_plot_type.dart';
import 'package:climb_logger/util/measurement_system.dart';
import 'package:flutter/material.dart';

class HangboardChartsTab extends StatefulWidget {
  const HangboardChartsTab({Key? key}) : super(key: key);

  @override
  State<HangboardChartsTab> createState() => HangboardChartsTabState();
}

class HangboardChartsTabState extends State<HangboardChartsTab> {
  AppState get state => context.bloc.state;

  late final randomHangboarding = List.generate(20,
      (i) => HangboardEntryModel.randomEntry(state.settings.measurementSystem));

  @override
  Widget build(BuildContext context) {
    final children = buildClimbingChartPreviews(
      context,
      state,
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
  ) {
    return HangboardChartType.values
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
    HangboardChartType chartType,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Builder(
        builder: (context) {
          switch (chartType) {
            case HangboardChartType.pieChartHangboardHoldType:
              return PieChartHangboardHoldType(
                entries: randomHangboarding,
              );

            case HangboardChartType.barChartHoldName:
              return HangboardBarChart(
                entries: randomHangboarding,
                hangboardPlotType: HangboardPlotType.holdName,
              );

            case HangboardChartType.barChartHoldSize:
              return HangboardBarChart(
                entries: randomHangboarding,
                hangboardPlotType: HangboardPlotType.holdSize,
              );

            case HangboardChartType.bestHangHoldSize:
              return BestHangChart(
                hangboardEntries: randomHangboarding,
                holdSizes: context
                    .bloc.state.settings.measurementSystem.holdSizes
                    .skip(3)
                    .take(2)
                    .toList(),
              );
          }
        },
      ),
    );
  }

  void onViewChartTapped(HangboardChartType hangboardChartType) async {
    if (hangboardChartType.shouldPromptForHoldSizes) {
      final settings = await showHangboardChartSettingsBottomSheet(
        context,
        hangboardChartType,
      );

      if (settings != null) {
        Navigator.of(context).hangboardChart(hangboardChartType, settings);
      }
    } else {
      Navigator.of(context).hangboardChart(hangboardChartType, null);
    }
  }
}
