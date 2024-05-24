import 'package:climb_logger/charts/models/pie_chart_hold_type_data.dart';
import 'package:climb_logger/components/empty_state.dart';
import 'package:climb_logger/models/hangboard_entry_model.dart';
import 'package:climb_logger/models/hangboard_item_model.dart';
import 'package:climb_logger/routing/navigator_extensions.dart';
import 'package:climb_logger/util/build_context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PieChartHangboardHoldType extends StatefulWidget {
  final List<HangboardEntryModel> entries;

  const PieChartHangboardHoldType({
    Key? key,
    required this.entries,
  }) : super(key: key);

  @override
  State<PieChartHangboardHoldType> createState() =>
      _PieChartHangboardHoldTypeState();
}

class _PieChartHangboardHoldTypeState extends State<PieChartHangboardHoldType> {
  late final chartData =
      PieChartHoldTypeData.fromLogbookEntries(widget.entries);

  late final hasAnyData = chartData.any((data) => data.percent > 0);

  @override
  Widget build(BuildContext context) {
    if (!hasAnyData) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const EmptyState(
              icon: Icons.search_off,
              title: "No Data",
              description: "You haven't completed any hangboard routines, "
                  "so this plot cannot be displayed yet. It would divide by zero, and that's bad",
            ),
            TextButton(
              child: const Text("Create a hangboard routine"),
              onPressed: Navigator.of(context).hangboardRoutines,
            ),
          ],
        ),
      );
    }

    return SfCircularChart(
      legend: Legend(isVisible: true),
      tooltipBehavior: TooltipBehavior(enable: true),
      series: _getDefaultPieSeries(),
    );
  }

  List<PieSeries<PieChartHoldTypeData, String>> _getDefaultPieSeries() {
    return <PieSeries<PieChartHoldTypeData, String>>[
      PieSeries<PieChartHoldTypeData, String>(
        dataSource: chartData,
        enableTooltip: true,
        xValueMapper: (PieChartHoldTypeData data, _) => data.holdType,
        yValueMapper: (PieChartHoldTypeData data, _) => data.percent,
        dataLabelMapper: (PieChartHoldTypeData data, _) => data.percentLabel,
        pointColorMapper: (PieChartHoldTypeData data, _) =>
            HangboardItemModel.getItemColor(
          data.holdType,
          context.bloc.state.settings,
        ),
      ),
    ];
  }
}
