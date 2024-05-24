import 'package:climb_logger/models/hangboard_entry_model.dart';
import 'package:climb_logger/models/logbook_entry_model.dart';
import 'package:climb_logger/models/training_notes_model.dart';
import 'package:climb_logger/util/date_time_extensions.dart';
import 'package:climb_logger/util/sentiment.dart';

typedef SentimentMapper = Sentiment? Function(TrainingNotesModel trainingNotes);
typedef ScoreMapper = int? Function(TrainingNotesModel trainingNotes);

class SentimentCalculator {
  final List<LogbookEntryModel> logbooks;

  final List<HangboardEntryModel> hangboarding;

  final List<TrainingNotesModel> trainingNotes;

  SentimentCalculator(
    this.logbooks,
    this.hangboarding,
    this.trainingNotes,
  );

  Map<Sentiment, double> averageScoreFromSentiment(SentimentMapper mapper) {
    final values = <Sentiment, double>{};
    final ratingCounts = <Sentiment, int>{};

    final notesWhereSentimentWasRated =
        trainingNotes.where((notes) => mapper(notes) != null);

    for (final notes in notesWhereSentimentWasRated) {
      final sentiment = mapper(notes)!;

      final logbookScores = logbooks
          .where((e) => e.dateTime.truncate() == notes.dateTime)
          .map((e) => e.score);

      final hangboardScores = hangboarding
          .where((e) => e.dateTime.truncate() == notes.dateTime)
          .map((e) => e.score);

      final totalScoreOfDate = [...logbookScores, ...hangboardScores]
          .fold(0.0, (double a, int b) => a + b);

      ratingCounts[sentiment] = (ratingCounts[sentiment] ?? 0) + 1;

      values.update(
        sentiment,
        (totalSum) => totalSum + totalScoreOfDate,
        ifAbsent: () => totalScoreOfDate,
      );
    }

    values.forEach((key, value) {
      final divisor = ratingCounts[key] ?? 0;
      if (divisor != 0) {
        values[key] = value / divisor;
      }
    });

    return values;
  }

  AverageCalculationResult averageOverallSentiment(ScoreMapper mapper) {
    final scores = trainingNotes.map((notes) => mapper(notes)).whereType<int>();

    if (scores.isEmpty) {
      return AverageCalculationResult(null, 0);
    }

    final average =
        scores.fold(0.0, (double a, int b) => a + b) / scores.length;

    return AverageCalculationResult(average, scores.length);
  }
}

class AverageCalculationResult {
  final double? average;
  final int length;

  AverageCalculationResult(this.average, this.length);
}
