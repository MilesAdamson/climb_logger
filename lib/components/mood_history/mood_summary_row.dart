import 'package:climb_logger/models/training_notes_model.dart';
import 'package:climb_logger/util/sentiment.dart';
import 'package:flutter/material.dart';

class MoodSummaryRow extends StatelessWidget {
  final TrainingNotesModel trainingNotes;
  final bool hideIfNoRatings;

  const MoodSummaryRow({
    Key? key,
    required this.trainingNotes,
    this.hideIfNoRatings = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!trainingNotes.hasAnySentimentsSelected && hideIfNoRatings) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.only(
        bottom: 16.0,
        top: 8.0,
        left: 16.0,
        right: 16.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          moodIcon("Mood", trainingNotes.mood, context),
          moodIcon("Sleep", trainingNotes.sleep, context),
          moodIcon("Stress", trainingNotes.stress, context),
          moodIcon("Diet", trainingNotes.diet, context),
          moodIcon("Energy", trainingNotes.energy, context),
        ],
      ),
    );
  }

  Widget moodIcon(
    String label,
    Sentiment? sentiment,
    BuildContext context,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          sentiment?.icon ?? Icons.sentiment_neutral,
          color: sentiment?.color,
          size: 25.0,
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.caption,
        ),
      ],
    );
  }
}
