import 'package:climb_logger/charts/models/pie_chart_wall_type_data.dart';
import 'package:climb_logger/models/logbook_entry_model.dart';
import 'package:climb_logger/util/wall_type.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PieChartWallType extends StatefulWidget {
  final List<LogbookEntryModel> logbookEntries;

  const PieChartWallType({
    Key? key,
    required this.logbookEntries,
  }) : super(key: key);

  @override
  State<PieChartWallType> createState() => _PieChartWallTypeState();
}

class _PieChartWallTypeState extends State<PieChartWallType> {
  late final chartData =
      PieChartWallTypeData.fromLogbookEntries(widget.logbookEntries);

  late final hasAnyData = chartData.any((data) => data.percent > 0);

  @override
  Widget build(BuildContext context) {
    if (!hasAnyData) {
      return const Center(
        child: Text("You must log some ascents to view a chart here"),
      );
    }

    return SfCircularChart(
      legend: Legend(isVisible: true),
      tooltipBehavior: TooltipBehavior(enable: true),
      series: _getDefaultPieSeries(),
    );
  }

  List<PieSeries<PieChartWallTypeData, String>> _getDefaultPieSeries() {
    return <PieSeries<PieChartWallTypeData, String>>[
      PieSeries<PieChartWallTypeData, String>(
        dataSource: chartData,
        enableTooltip: true,
        xValueMapper: (PieChartWallTypeData data, _) => data.wallType.label,
        yValueMapper: (PieChartWallTypeData data, _) => data.percent,
        pointColorMapper: (PieChartWallTypeData data, _) =>
            data.wallType.color(context),
        dataLabelMapper: (PieChartWallTypeData data, _) => data.percentLabel,
      ),
    ];
  }
}
