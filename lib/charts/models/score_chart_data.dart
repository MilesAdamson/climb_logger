import 'package:climb_logger/models/hangboard_entry_model.dart';
import 'package:climb_logger/models/logbook_entry_model.dart';

class ScoreChartData {
  final DateTime dateTime;
  final int score;

  ScoreChartData(this.dateTime, this.score);

  static List<ScoreChartData> fromLogbookEntries(
    List<LogbookEntryModel> logbookEntries,
    List<HangboardEntryModel> hangboardEntries,
  ) {
    final dates = {
      ...logbookEntries.map((entry) => DateTime(
            entry.dateTime.year,
            entry.dateTime.month,
            entry.dateTime.day,
          )),
      ...hangboardEntries.map((entry) => DateTime(
            entry.dateTime.year,
            entry.dateTime.month,
            entry.dateTime.day,
          )),
    };

    return dates.map((date) {
      final logbookScore = logbookEntries
          .map((entry) => scoreOfEntryForDate(entry, date))
          .fold<int>(0, (a, b) => a + b);

      final hangboardScore = hangboardEntries
          .map((entry) => scoreOfHangboardForDate(entry, date))
          .fold<int>(0, (a, b) => a + b);

      return ScoreChartData(
        date,
        hangboardScore + logbookScore,
      );
    }).toList();
  }

  static int scoreOfEntryForDate(LogbookEntryModel entry, DateTime dateTime) {
    final truncatedDateTime =
        DateTime(entry.dateTime.year, entry.dateTime.month, entry.dateTime.day);

    if (truncatedDateTime == dateTime) return entry.score;

    return 0;
  }

  static int scoreOfHangboardForDate(
      HangboardEntryModel entry, DateTime dateTime) {
    final truncatedDateTime =
        DateTime(entry.dateTime.year, entry.dateTime.month, entry.dateTime.day);

    if (truncatedDateTime == dateTime) return entry.score;

    return 0;
  }

  static List<ScoreChartData> cumulative(
    List<LogbookEntryModel> logbookEntries,
    List<HangboardEntryModel> hangboardEntries,
  ) {
    final result = <ScoreChartData>[];

    final logbookScores = logbookEntries
        .map((entry) => ScoreChartData(entry.dateTime, entry.score));
    final hangboardScores = hangboardEntries
        .map((entry) => ScoreChartData(entry.dateTime, entry.score));

    final sortedEntries = [...logbookScores, ...hangboardScores]
      ..sort((a, b) => a.dateTime.compareTo(b.dateTime));

    int sum = 0;

    for (final data in sortedEntries) {
      sum += data.score;
      result.add(ScoreChartData(data.dateTime, sum));
    }

    return result;
  }
}
