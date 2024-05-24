import 'package:climb_logger/charts/models/hangboard_total_time_data.dart';
import 'package:climb_logger/components/empty_state.dart';
import 'package:climb_logger/models/hangboard_entry_model.dart';
import 'package:climb_logger/routing/navigator_extensions.dart';
import 'package:climb_logger/util/build_context_extensions.dart';
import 'package:climb_logger/util/chart_util.dart';
import 'package:climb_logger/util/hangboard_plot_type.dart';
import 'package:climb_logger/util/int_list_extensions.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HangboardBarChart extends StatefulWidget {
  final List<HangboardEntryModel> entries;
  final HangboardPlotType hangboardPlotType;

  const HangboardBarChart({
    Key? key,
    required this.hangboardPlotType,
    required this.entries,
  }) : super(key: key);

  @override
  State<HangboardBarChart> createState() => _HangboardBarChartState();
}

class _HangboardBarChartState extends State<HangboardBarChart> {
  late final chartData = HangboardBarChartData.build(
    widget.entries,
    widget.hangboardPlotType,
    context.bloc.state.settings.measurementSystem,
  );

  late final maximum =
      chartData.map((e) => e.minutes).maxOrDefault(kDefaultMinutesAxisMaximum);

  late final hasAnyData = chartData.any((d) => d.yValue > 0);

  String get description {
    if (widget.hangboardPlotType == HangboardPlotType.holdSize) {
      return "You haven't completed any hangboard routines which selected a hold size";
    }

    return "You haven't completed any hangboard routines yet";
  }

  @override
  Widget build(BuildContext context) {
    if (!hasAnyData) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            EmptyState(
              icon: Icons.search_off,
              title: "No Data",
              description: description,
            ),
            TextButton(
              child: const Text("Create a hangboard routine"),
              onPressed: Navigator.of(context).hangboardRoutines,
            ),
          ],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: SfCartesianChart(
        zoomPanBehavior: ChartUtil.staticChart,
        legend: Legend(isVisible: true),
        plotAreaBorderWidth: 0,
        primaryXAxis: ChartUtil.categoryAxis(
          widget.hangboardPlotType.xAxisLabel,
          arrangeByIndex: true,
        ),
        primaryYAxis: ChartUtil.sumAxis(
          maximum.toDouble(),
          label: "Minutes",
        ),
        series: _getStackedColumnSeries(chartData),
      ),
    );
  }

  List<StackedColumnSeries<HangboardBarChartData, String>>
      _getStackedColumnSeries(List<HangboardBarChartData> chartData) {
    return <StackedColumnSeries<HangboardBarChartData, String>>[
      StackedColumnSeries<HangboardBarChartData, String>(
        dataSource: chartData,
        xValueMapper: (HangboardBarChartData data, _) => data.xLabel,
        yValueMapper: (HangboardBarChartData data, _) => data.minutes,
        name: widget.hangboardPlotType.xAxisLabel,
        color: context.bloc.state.settings.colorFive,
      ),
    ];
  }
}
