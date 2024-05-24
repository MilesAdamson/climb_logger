// ignore_for_file: file_names

import 'package:climb_logger/charts/hangboard_bar_chart.dart';
import 'package:climb_logger/charts/pie_chart_hangboard_hold_type.dart';
import 'package:climb_logger/models/hangboard_entry_model.dart';
import 'package:climb_logger/routing/navigator_extensions.dart';
import 'package:climb_logger/util/hangboard_chart_type.dart';
import 'package:climb_logger/util/hangboard_plot_type.dart';
import 'package:climb_logger/util/measurement_system.dart';
import 'package:flutter/material.dart';

class V110 extends StatelessWidget {
  late final randomHangboarding = List.generate(
      5, (i) => HangboardEntryModel.randomEntry(MeasurementSystem.metric));

  V110({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            "Hangboarding",
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        const Text(
          "Added hangboard routines and timer. "
          "You can create hangboard routines with various holds, rests and set designs. "
          "Then, train them with the timer.",
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Center(
            child: TextButton(
              onPressed: Navigator.of(context).hangboardRoutines,
              child: const Text("Create a hangboard routine"),
            ),
          ),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            "Hangboard Charts",
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        Card(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: ListTile(
                  title: Text(HangboardChartType.barChartHoldName.label),
                  subtitle:
                      Text(HangboardChartType.barChartHoldName.description),
                ),
              ),
              SizedBox(
                height: 200,
                child: HangboardBarChart(
                  entries: randomHangboarding,
                  hangboardPlotType: HangboardPlotType.holdName,
                ),
              ),
            ],
          ),
        ),
        Card(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: ListTile(
                  title: Text(HangboardChartType.barChartHoldSize.label),
                  subtitle:
                      Text(HangboardChartType.barChartHoldSize.description),
                ),
              ),
              SizedBox(
                height: 200,
                child: HangboardBarChart(
                  entries: randomHangboarding,
                  hangboardPlotType: HangboardPlotType.holdSize,
                ),
              ),
            ],
          ),
        ),
        Card(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: ListTile(
                  title:
                      Text(HangboardChartType.pieChartHangboardHoldType.label),
                  subtitle: Text(
                      HangboardChartType.pieChartHangboardHoldType.description),
                ),
              ),
              SizedBox(
                height: 200,
                child: PieChartHangboardHoldType(
                  entries: randomHangboarding,
                ),
              ),
            ],
          ),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            "Home Screen Menu",
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        const Text(
          "Now, you can create logbook entries, goals, projects and"
          " hangboard routines all from one place on the home screen. This menu"
          " also adds more convenient ways to log attempts/sends on a project.",
        ),
      ],
    );
  }
}
