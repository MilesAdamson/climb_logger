import 'package:flutter/material.dart';

enum Sentiment { veryPoor, poor, neutral, good, veryGood }

enum MoodType { mood, sleep, stress, diet, energy }

extension MoodTypeExtensions on MoodType {
  String get label {
    switch (this) {
      case MoodType.mood:
        return "Mood";
      case MoodType.sleep:
        return "Sleep";
      case MoodType.stress:
        return "Stress";
      case MoodType.diet:
        return "Diet";
      case MoodType.energy:
        return "Energy";
    }
  }
}

extension SentimentExtensions on Sentiment {
  int get value => Sentiment.values.indexOf(this);

  IconData get icon {
    switch (this) {
      case Sentiment.veryPoor:
        return Icons.sentiment_very_dissatisfied;
      case Sentiment.poor:
        return Icons.sentiment_dissatisfied;
      case Sentiment.neutral:
        return Icons.sentiment_neutral;
      case Sentiment.good:
        return Icons.sentiment_satisfied;
      case Sentiment.veryGood:
        return Icons.sentiment_very_satisfied;
    }
  }

  Color get color {
    switch (this) {
      case Sentiment.veryPoor:
        return Colors.red;
      case Sentiment.poor:
        return Colors.orange;
      case Sentiment.neutral:
        return Colors.yellow;
      case Sentiment.good:
        return Colors.green[300]!;
      case Sentiment.veryGood:
        return Colors.green;
    }
  }
}
