import 'package:climb_logger/components/bottom_banner_ad.dart';
import 'package:climb_logger/components/state_builder.dart';
import 'package:climb_logger/models/logbook_entry_model.dart';
import 'package:climb_logger/theme/ui_constants.dart';
import 'package:climb_logger/util/ascent_type.dart';
import 'package:climb_logger/util/climb_type.dart';
import 'package:climb_logger/util/wall_type.dart';
import 'package:flutter/material.dart';

class ScoringInfoScreen extends StatelessWidget {
  const ScoringInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StateBuilder(builder: (context, state) {
      final boulderingSystem = state.settings.boulderingGradingSystem;
      final sportSystem = state.settings.sportGradingSystem;
      return Scaffold(
        bottomNavigationBar: const BottomBannerAd(),
        appBar: AppBar(
          title: const Text("Scoring System"),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          children: [
            const ListTile(
              title: Text("Scoring System"),
              subtitle: Text(
                  "The scoring system can be used as a metric to gauge your improvement."
                  " Days, weeks and months can be given a score based on your logbook.\n\n"
                  "Points are given based on grade and ascent type. Flashes give +1 grade, and onsights give +2."
                  "\n\nNo one can see your score! It is just a simple number to judge if your climbing days are improving over time."),
            ),
            const Divider(),
            Text(
              "Bouldering Points (Redpoint)",
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.center,
            ),
            buildGradeTable(boulderingSystem.labels, ClimbType.boulder),
            const Divider(),
            Text(
              "Sport Climbing Points (Redpoint)",
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.center,
            ),
            buildGradeTable(sportSystem.labels, ClimbType.sport),
          ],
        ),
      );
    });
  }

  Padding buildGradeTable(List<String> labels, ClimbType climbType) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
      child: Table(
        border: kTableBorder,
        children: [
          ...labels.map(
            (gradeLabel) => TableRow(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(gradeLabel),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  LogbookEntryModel(
                    DateTime.now(),
                    null,
                    null,
                    gradeLabel,
                    climbType,
                    AscentType.redpoint,
                    [],
                    WallType.overhang,
                    null,
                  ).score.toString(),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
