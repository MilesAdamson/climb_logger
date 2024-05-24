// ignore_for_file: file_names

import 'package:climb_logger/charts/best_hang_chart.dart';
import 'package:climb_logger/models/hangboard_entry_model.dart';
import 'package:climb_logger/routing/navigator_extensions.dart';
import 'package:climb_logger/util/hangboard_chart_type.dart';
import 'package:climb_logger/util/measurement_system.dart';
import 'package:flutter/material.dart';

class V111 extends StatelessWidget {
  late final randomHangboarding = List.generate(
      50, (i) => HangboardEntryModel.randomEntry(MeasurementSystem.metric));

  V111({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            "Hangboard Templates",
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 16.0),
          child: Text(
            "Don't know what goes into a hangboard routine? No problem! "
            "There are now three templates to create hangboard routines from.\n\n"
            "With an adjustable difficulty, you can get a good starting point "
            "for a routine and finish it off yourself from there.",
          ),
        ),
        Center(
          child: TextButton(
            onPressed: Navigator.of(context).hangboardTemplates,
            child: const Text("VIEW TEMPLATES"),
          ),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            "New Hangboarding Chart",
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 16.0),
          child: Text(
            "Added a new line chart. It plots your record hang on "
            "each hold size over time. You can use this plot to gauge"
            " how hold sizes are becoming easier over time.\n\n"
            "Also, climbing charts and hangboard charts are now on separate tabs. "
            "With a growing list of charts, this should make finding the one you want to view easier.",
          ),
        ),
        Card(
          child: Column(
            children: [
              ListTile(
                title: Text(HangboardChartType.bestHangHoldSize.label),
                subtitle: Text(HangboardChartType.bestHangHoldSize.description),
              ),
              SizedBox(
                height: 400,
                child: BestHangChart(
                  hangboardEntries: randomHangboarding,
                  holdSizes: MeasurementSystem.metric.holdSizes
                      .skip(2)
                      .take(2)
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
