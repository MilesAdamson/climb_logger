import 'package:climb_logger/charts/models/best_hang_data.dart';
import 'package:climb_logger/models/hangboard_entry_model.dart';
import 'package:climb_logger/util/build_context_extensions.dart';
import 'package:climb_logger/util/chart_util.dart';
import 'package:climb_logger/util/int_list_extensions.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BestHangChart extends StatefulWidget {
  final List<HangboardEntryModel> hangboardEntries;
  final List<String> holdSizes;

  const BestHangChart({
    Key? key,
    required this.hangboardEntries,
    required this.holdSizes,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => BestHangChartState();
}

class BestHangChartState extends State<BestHangChart> {
  late final data = BestHangData.fromHangboardEntries(
    widget.hangboardEntries,
    widget.holdSizes,
  );

  late final maximum = data.values
      .fold(
          <BestHangData>[],
          (List<BestHangData> previousValue, element) =>
              [...previousValue, ...element])
      .map((e) => e.secondsHeld)
      .maxOrDefault(10);

  @override
  Widget build(BuildContext context) {
    assert(
      widget.holdSizes.length <= context.bloc.state.settings.colors.length,
      "Too many lines to be plotted",
    );

    return SfCartesianChart(
      legend: Legend(isVisible: true),
      zoomPanBehavior: ChartUtil.xZoomPanBehavior,
      plotAreaBorderWidth: 0.0,
      primaryXAxis: ChartUtil.dateTimeAxis,
      primaryYAxis: ChartUtil.numericAxis(
        maximum,
        label: "Seconds",
      ),
      series: buildSeries(),
    );
  }

  List<ChartSeries<BestHangData, DateTime>> buildSeries() {
    final series = <ChartSeries<BestHangData, DateTime>>[];

    for (final holdSize in data.keys) {
      final line = LineSeries<BestHangData, DateTime>(
        dataSource: data[holdSize]!,
        xValueMapper: (BestHangData data, _) => data.dateTime,
        yValueMapper: (BestHangData data, _) => data.secondsHeld,
        color: context
            .bloc.state.settings.colors[data.keys.toList().indexOf(holdSize)],
        name: holdSize,
      );

      series.add(line);
    }

    return series;
  }
}
