import 'package:climb_logger/models/logbook_entry_model.dart';
import 'package:climb_logger/models/training_notes_model.dart';
import 'package:climb_logger/util/ascent_type.dart';
import 'package:climb_logger/util/climb_type.dart';
import 'package:climb_logger/util/grading_system.dart';
import 'package:climb_logger/util/sentiment.dart';
import 'package:climb_logger/util/sentiment_calculator.dart';
import 'package:climb_logger/util/wall_type.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    "$SentimentCalculator tests",
    () {
      test(
        "With a single logbook entry, returns the score of the entry under "
        "the correct sentiment for the day",
        () {
          final date = DateTime(2022);

          final entry = LogbookEntryModel(
            date,
            null,
            null,
            const VerminSystem().labels[3],
            ClimbType.boulder,
            AscentType.redpoint,
            [],
            WallType.roof,
            2,
          );

          final notes = TrainingNotesModel(
            date,
            "notes",
            Sentiment.veryPoor,
            Sentiment.poor,
            Sentiment.neutral,
            Sentiment.good,
            Sentiment.veryGood,
          );

          final expectedScore = entry.score;

          final calc = SentimentCalculator([entry], [], [notes]);

          expect(
            calc.averageScoreFromSentiment(
              (trainingNotes) => trainingNotes.mood,
            )[Sentiment.veryPoor],
            expectedScore.toDouble(),
          );

          expect(
            calc.averageScoreFromSentiment(
              (trainingNotes) => trainingNotes.sleep,
            )[Sentiment.poor],
            expectedScore.toDouble(),
          );

          expect(
            calc.averageScoreFromSentiment(
              (trainingNotes) => trainingNotes.stress,
            )[Sentiment.neutral],
            expectedScore.toDouble(),
          );

          expect(
            calc.averageScoreFromSentiment(
              (trainingNotes) => trainingNotes.diet,
            )[Sentiment.good],
            expectedScore.toDouble(),
          );

          expect(
            calc.averageScoreFromSentiment(
              (trainingNotes) => trainingNotes.energy,
            )[Sentiment.veryGood],
            expectedScore.toDouble(),
          );

          // Energy was not given a score of "poor"
          expect(
            calc.averageScoreFromSentiment(
              (trainingNotes) => trainingNotes.energy,
            )[Sentiment.poor],
            isNot(equals(expectedScore.toDouble())),
          );

          expect(
            calc.averageScoreFromSentiment(
              (trainingNotes) => trainingNotes.energy,
            )[Sentiment.poor],
            isNull,
          );
        },
      );

      test(
        "With two logbook entries of the same day, returns their "
        "scores added together under "
        "the correct sentiment for the day",
        () {
          final date = DateTime(2022);

          final entry1 = LogbookEntryModel(
            date,
            null,
            null,
            const VerminSystem().labels[3],
            ClimbType.boulder,
            AscentType.redpoint,
            [],
            WallType.roof,
            2,
          );

          final entry2 = LogbookEntryModel(
            date,
            null,
            null,
            const VerminSystem().labels[5],
            ClimbType.boulder,
            AscentType.redpoint,
            [],
            WallType.roof,
            2,
          );

          final notes = TrainingNotesModel(
            date,
            "notes",
            Sentiment.veryPoor,
            Sentiment.poor,
            Sentiment.neutral,
            Sentiment.good,
            Sentiment.veryGood,
          );

          final expectedScore = entry1.score + entry2.score;

          final calc = SentimentCalculator([entry1, entry2], [], [notes]);

          expect(
            calc.averageScoreFromSentiment(
              (trainingNotes) => trainingNotes.mood,
            )[Sentiment.veryPoor],
            expectedScore.toDouble(),
          );

          expect(
            calc.averageScoreFromSentiment(
              (trainingNotes) => trainingNotes.sleep,
            )[Sentiment.poor],
            expectedScore.toDouble(),
          );

          expect(
            calc.averageScoreFromSentiment(
              (trainingNotes) => trainingNotes.stress,
            )[Sentiment.neutral],
            expectedScore.toDouble(),
          );

          expect(
            calc.averageScoreFromSentiment(
              (trainingNotes) => trainingNotes.diet,
            )[Sentiment.good],
            expectedScore.toDouble(),
          );

          expect(
            calc.averageScoreFromSentiment(
              (trainingNotes) => trainingNotes.energy,
            )[Sentiment.veryGood],
            expectedScore.toDouble(),
          );

          // Energy was not given a score of "poor"
          expect(
            calc.averageScoreFromSentiment(
              (trainingNotes) => trainingNotes.energy,
            )[Sentiment.poor],
            isNot(equals(expectedScore.toDouble())),
          );

          expect(
            calc.averageScoreFromSentiment(
              (trainingNotes) => trainingNotes.energy,
            )[Sentiment.poor],
            isNull,
          );
        },
      );

      test(
        "With two logbook entries of different dates, returns their "
        "scores added together under "
        "the correct sentiment for the day",
        () {
          final date1 = DateTime(2022);
          final date2 = DateTime(2023);

          final entry1 = LogbookEntryModel(
            date1,
            null,
            null,
            const VerminSystem().labels[3],
            ClimbType.boulder,
            AscentType.redpoint,
            [],
            WallType.roof,
            2,
          );

          final entry2 = LogbookEntryModel(
            date2,
            null,
            null,
            const VerminSystem().labels[5],
            ClimbType.boulder,
            AscentType.redpoint,
            [],
            WallType.roof,
            2,
          );

          final notes1 = TrainingNotesModel(
            date1,
            "notes",
            Sentiment.veryPoor,
            Sentiment.poor,
            Sentiment.neutral,
            Sentiment.good,
            Sentiment.veryGood,
          );

          final notes2 = TrainingNotesModel(
            date2,
            "notes",
            Sentiment.veryPoor,
            Sentiment.poor,
            Sentiment.neutral,
            Sentiment.good,
            Sentiment.veryGood,
          );

          final expectedScore = (entry1.score + entry2.score) / 2;

          final calc = SentimentCalculator(
            [entry1, entry2],
            [],
            [notes1, notes2],
          );

          expect(
            calc.averageScoreFromSentiment(
              (trainingNotes) => trainingNotes.mood,
            )[Sentiment.veryPoor],
            expectedScore.toDouble(),
          );
        },
      );

      test(
        "With logbook entries of different dates, "
        "returns their scores added together under "
        "the correct sentiment for the day",
        () {
          final date1 = DateTime(2022);
          final date2 = DateTime(2023);

          final entry1 = LogbookEntryModel(
            date1,
            null,
            null,
            const VerminSystem().labels[3],
            ClimbType.boulder,
            AscentType.redpoint,
            [],
            WallType.roof,
            2,
          );

          final entry2 = LogbookEntryModel(
            date2,
            null,
            null,
            const VerminSystem().labels[5],
            ClimbType.boulder,
            AscentType.redpoint,
            [],
            WallType.roof,
            2,
          );

          final entry3 = LogbookEntryModel(
            date2,
            null,
            null,
            const VerminSystem().labels[5],
            ClimbType.boulder,
            AscentType.redpoint,
            [],
            WallType.roof,
            2,
          );

          final notes1 = TrainingNotesModel(
            date1,
            "notes",
            Sentiment.veryPoor,
            Sentiment.poor,
            Sentiment.neutral,
            Sentiment.good,
            Sentiment.veryGood,
          );

          final notes2 = TrainingNotesModel(
            date2,
            "notes",
            Sentiment.veryPoor,
            Sentiment.poor,
            Sentiment.neutral,
            Sentiment.good,
            Sentiment.veryGood,
          );

          final day1score = entry1.score;
          final day2score = entry2.score + entry3.score;

          final expectedScore = (day1score + day2score) / 2;

          final calc = SentimentCalculator(
            [entry1, entry2, entry3],
            [],
            [notes1, notes2],
          );

          expect(
            calc.averageScoreFromSentiment(
              (trainingNotes) => trainingNotes.mood,
            )[Sentiment.veryPoor],
            expectedScore.toDouble(),
          );
        },
      );

      test(
        "Calculates properly when different sentiments"
        " are given on different days",
        () {
          final date1 = DateTime(2022);
          final date2 = DateTime(2023);

          final entry1 = LogbookEntryModel(
            date1,
            null,
            null,
            const VerminSystem().labels[3],
            ClimbType.boulder,
            AscentType.redpoint,
            [],
            WallType.roof,
            2,
          );

          final entry2 = LogbookEntryModel(
            date2,
            null,
            null,
            const VerminSystem().labels[4],
            ClimbType.boulder,
            AscentType.redpoint,
            [],
            WallType.roof,
            2,
          );

          final notes1 = TrainingNotesModel(
            date1,
            "notes",
            Sentiment.veryPoor,
            null,
            null,
            null,
            null,
          );

          final notes2 = TrainingNotesModel(
            date2,
            "notes",
            Sentiment.good,
            null,
            null,
            null,
            null,
          );

          final calc = SentimentCalculator(
            [entry1, entry2],
            [],
            [notes1, notes2],
          );

          expect(
            calc.averageScoreFromSentiment(
              (trainingNotes) => trainingNotes.mood,
            )[Sentiment.veryPoor],
            entry1.score.toDouble(),
          );

          expect(
            calc.averageScoreFromSentiment(
              (trainingNotes) => trainingNotes.mood,
            )[Sentiment.good],
            entry2.score.toDouble(),
          );
        },
      );

      test(
        "With a single logbook entry, returns the score of the entry under "
        "the correct sentiment for the day, ignoring irrelevant days",
        () {
          final date1 = DateTime(2022);
          final date2 = DateTime(2023);

          final entry1 = LogbookEntryModel(
            date1,
            null,
            null,
            const VerminSystem().labels[3],
            ClimbType.boulder,
            AscentType.redpoint,
            [],
            WallType.roof,
            2,
          );

          final entry2 = LogbookEntryModel(
            date2,
            null,
            null,
            const VerminSystem().labels[3],
            ClimbType.boulder,
            AscentType.redpoint,
            [],
            WallType.roof,
            2,
          );

          final notes1 = TrainingNotesModel(
            date1,
            "notes",
            Sentiment.veryPoor,
            null,
            null,
            null,
            null,
          );

          final notes2 = TrainingNotesModel(
            date2,
            "notes",
            null,
            null,
            null,
            null,
            null,
          );

          final expectedScore = entry1.score;

          final calc = SentimentCalculator(
            [entry1, entry2],
            [],
            [notes1, notes2],
          );

          expect(
            calc.averageScoreFromSentiment(
              (trainingNotes) => trainingNotes.mood,
            )[Sentiment.veryPoor],
            expectedScore.toDouble(),
          );

          expect(
            calc.averageScoreFromSentiment(
              (trainingNotes) => trainingNotes.stress,
            )[Sentiment.veryPoor],
            isNull,
          );
        },
      );
    },
  );
}
