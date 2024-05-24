import 'package:climb_logger/charts/models/score_chart_data.dart';
import 'package:climb_logger/util/chart_util.dart';
import 'package:climb_logger/util/int_list_extensions.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CumulativeScoreChart extends StatefulWidget {
  final List<ScoreChartData> chartData;

  const CumulativeScoreChart({
    Key? key,
    required this.chartData,
  }) : super(key: key);

  @override
  State<CumulativeScoreChart> createState() => _CumulativeScoreChartState();
}

class _CumulativeScoreChartState extends State<CumulativeScoreChart> {
  List<ScoreChartData> get chartData => widget.chartData;

  late final maximum =
      chartData.map((e) => e.score).maxOrDefault(kDefaultScoreAxisMaximum);

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      zoomPanBehavior: ChartUtil.xZoomPanBehavior,
      plotAreaBorderWidth: 0.0,
      primaryXAxis: ChartUtil.dateTimeAxis,
      primaryYAxis: ChartUtil.numericAxis(maximum),
      series: <ChartSeries<ScoreChartData, DateTime>>[
        LineSeries<ScoreChartData, DateTime>(
          dataSource: chartData,
          xValueMapper: (ScoreChartData data, _) => data.dateTime,
          yValueMapper: (ScoreChartData data, _) => data.score,
          color: Colors.blue,
        )
      ],
    );
  }
}
