import 'package:climb_logger/charts/best_hang_chart.dart';
import 'package:climb_logger/charts/chart_scaffold.dart';
import 'package:climb_logger/charts/hangboard_bar_chart.dart';
import 'package:climb_logger/charts/pie_chart_hangboard_hold_type.dart';
import 'package:climb_logger/models/hangboard_chart_settings_model.dart';
import 'package:climb_logger/models/hangboard_entry_model.dart';
import 'package:climb_logger/util/build_context_extensions.dart';
import 'package:climb_logger/util/hangboard_chart_type.dart';
import 'package:climb_logger/util/hangboard_plot_type.dart';
import 'package:climb_logger/util/map_extensions.dart';
import 'package:flutter/material.dart';

class HangboardChartScreenArgs {
  final HangboardChartType hangboardChartType;
  final HangboardChartSettingsModel? chartSettings;
  final List<HangboardEntryModel>? hangboardEntries;

  HangboardChartScreenArgs(
    this.hangboardChartType,
    this.chartSettings,
    this.hangboardEntries,
  ) {
    if (hangboardChartType.shouldPromptForHoldSizes) {
      assert(chartSettings != null && chartSettings!.holdSizes.isNotEmpty);
    }
  }
}

class HangboardChartScreen extends StatelessWidget {
  final HangboardChartScreenArgs args;

  const HangboardChartScreen({
    Key? key,
    required this.args,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hangboardEntries = context.bloc.state.hangboardEntryMap.mapToData();

    return ChartScaffold(
      appBar: AppBar(),
      body: buildChart(hangboardEntries),
    );
  }

  Widget buildChart(
    List<HangboardEntryModel> hangboardEntries,
  ) {
    switch (args.hangboardChartType) {
      case HangboardChartType.pieChartHangboardHoldType:
        return PieChartHangboardHoldType(
          entries: hangboardEntries,
        );

      case HangboardChartType.barChartHoldName:
        return HangboardBarChart(
          entries: hangboardEntries,
          hangboardPlotType: HangboardPlotType.holdName,
        );

      case HangboardChartType.barChartHoldSize:
        return HangboardBarChart(
          entries: hangboardEntries,
          hangboardPlotType: HangboardPlotType.holdSize,
        );

      case HangboardChartType.bestHangHoldSize:
        return BestHangChart(
          hangboardEntries: hangboardEntries,
          holdSizes: args.chartSettings!.holdSizes,
        );
    }
  }
}
