import 'package:climb_logger/components/state_builder.dart';
import 'package:climb_logger/state/events.dart';
import 'package:climb_logger/theme/ui_constants.dart';
import 'package:climb_logger/util/build_context_extensions.dart';
import 'package:climb_logger/util/icons.dart';
import 'package:flutter/material.dart';

class StatsScreen extends StatefulWidget {
  const StatsScreen({Key? key}) : super(key: key);

  @override
  State<StatsScreen> createState() => StatsScreenState();
}

class StatsScreenState extends State<StatsScreen> {
  late final bloc = context.bloc;

  @override
  void initState() {
    bloc.add(StartStatsSubscriptionEvent());
    super.initState();
  }

  @override
  void dispose() {
    bloc.add(StopStatsSubscriptionEvent());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StateBuilder(builder: (context, appState) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Global Usage Stats"),
        ),
        body: ListView(
          padding: kListViewPadding,
          children: [
            ListTile(
              leading: const Icon(kLogbookIcon),
              title: const Text("Logbook Entries"),
              trailing: Text("${appState.statsModel.logbookCount}"),
            ),
            ListTile(
              leading: const Icon(kGoalIcon),
              title: const Text("Goals"),
              trailing: Text("${appState.statsModel.goalCount}"),
            ),
            ListTile(
              leading: const Icon(kProjectIcon),
              title: const Text("Projects"),
              trailing: Text("${appState.statsModel.projectCount}"),
            ),
            ListTile(
              leading: const Icon(kHangboardIcon),
              title: const Text("Hangboard Routines"),
              trailing: Text("${appState.statsModel.hangboardRoutineCount}"),
            ),
            ListTile(
              leading: const Icon(Icons.timer),
              title: const Text("Routines Completed"),
              trailing: Text("${appState.statsModel.hangboardEntryCount}"),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("Users"),
              trailing: Text("${appState.statsModel.userCount}"),
            ),
            ListTile(
              leading: const Icon(Icons.sentiment_very_satisfied),
              title: const Text("Mood Scores and Notes"),
              trailing: Text("${appState.statsModel.trainingNotesCount}"),
            ),
          ],
        ),
      );
    });
  }
}
