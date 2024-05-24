import 'package:climb_logger/components/mood_history/mood_score_icon.dart';
import 'package:climb_logger/models/training_notes_model.dart';
import 'package:climb_logger/theme/ui_constants.dart';
import 'package:climb_logger/util/sentiment_calculator.dart';
import 'package:flutter/material.dart';

class AverageMoodTable extends StatelessWidget {
  final List<TrainingNotesModel> trainingNotes;

  const AverageMoodTable({
    Key? key,
    required this.trainingNotes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final calc = SentimentCalculator([], [], trainingNotes);
    final moodResult = calc.averageOverallSentiment((t) => t.moodScore);
    final sleepResult = calc.averageOverallSentiment((t) => t.sleepScore);
    final stressResult = calc.averageOverallSentiment((t) => t.stressScore);
    final dietResult = calc.averageOverallSentiment((t) => t.dietScore);
    final energyResult = calc.averageOverallSentiment((t) => t.energyScore);

    return Column(
      children: [
        ListTile(
          title: Text(
            "Average Ratings",
            style: Theme.of(context).textTheme.headline6,
          ),
          subtitle: const Text(
            "These are your average ratings"
            " across every day you have added training notes. "
            "5 is the most positive score, and 1 is the most negative.",
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Table(
            border: kTableBorder,
            children: [
              TableRow(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Mood\n${moodResult.length} ratings"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MoodScoreIcon(
                      score: moodResult.average,
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Sleep\n${sleepResult.length} ratings"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MoodScoreIcon(
                      score: sleepResult.average,
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Stress\n${stressResult.length} ratings"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MoodScoreIcon(
                      score: stressResult.average,
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Diet\n${dietResult.length} ratings"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MoodScoreIcon(
                      score: dietResult.average,
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Energy\n${energyResult.length} ratings"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MoodScoreIcon(
                      score: energyResult.average,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
