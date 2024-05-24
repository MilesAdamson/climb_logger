import 'package:climb_logger/components/bottom_banner_ad.dart';
import 'package:climb_logger/components/mood_history/average_mood_table.dart';
import 'package:climb_logger/components/mood_history/mood_calendar_list_tile.dart';
import 'package:climb_logger/components/mood_history/sentiment_score_table.dart';
import 'package:climb_logger/components/state_builder.dart';
import 'package:climb_logger/state/events.dart';
import 'package:climb_logger/theme/ui_constants.dart';
import 'package:climb_logger/util/build_context_extensions.dart';
import 'package:climb_logger/util/map_extensions.dart';
import 'package:climb_logger/util/sentiment_calculator.dart';
import 'package:flutter/material.dart';

class MoodHistoryScreen extends StatefulWidget {
  const MoodHistoryScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MoodHistoryScreenState();
}

class MoodHistoryScreenState extends State<MoodHistoryScreen> {
  @override
  void initState() {
    context.bloc.add(LoadAllLogbooksEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StateBuilder(
      builder: (context, state) {
        final trainingNotes = state.trainingNotesMap.mapToData();
        final logbookEntries = state.logbookEntryMap.mapToData();
        final hangboarding = state.hangboardEntryMap.mapToData();

        final calculator = SentimentCalculator(
          logbookEntries,
          hangboarding,
          trainingNotes,
        );

        return Scaffold(
          appBar: AppBar(
            title: const Text("Mood History"),
          ),
          bottomNavigationBar: const BottomBannerAd(),
          body: ListView(
            padding: kListViewPadding,
            children: [
              MoodCalendarListTile(trainingNotes: trainingNotes),
              const Divider(),
              AverageMoodTable(
                trainingNotes: trainingNotes,
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: ListTile(
                  title: Text(
                    "Scores by Metric",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  subtitle: const Text(
                    "Below is a table for each metric. "
                    "It shows you the average score based on how you rated your day.\n\n"
                    "For example, \"your average score is ___ when diet is good\". "
                    "Use this information to help determine which metric"
                    " matters the most to your climbing.",
                  ),
                ),
              ),
              SentimentScoreTable(
                title: "Mood",
                mapper: (a) => a.mood,
                calculator: calculator,
              ),
              SentimentScoreTable(
                title: "Sleep",
                mapper: (a) => a.sleep,
                calculator: calculator,
              ),
              SentimentScoreTable(
                title: "Stress",
                mapper: (a) => a.stress,
                calculator: calculator,
              ),
              SentimentScoreTable(
                title: "Diet",
                mapper: (a) => a.diet,
                calculator: calculator,
              ),
              SentimentScoreTable(
                title: "Energy",
                mapper: (a) => a.energy,
                calculator: calculator,
              ),
            ],
          ),
        );
      },
    );
  }
}
