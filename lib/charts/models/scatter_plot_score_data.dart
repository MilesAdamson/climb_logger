import 'package:climb_logger/models/logbook_entry_model.dart';
import 'package:climb_logger/util/ascent_type.dart';

class ScatterPlotScoreData {
  final DateTime dateTime;
  final AscentType ascentType;
  final int score;

  ScatterPlotScoreData(
    this.dateTime,
    this.ascentType,
    this.score,
  );

  static List<ScatterPlotScoreData> fromLogbookEntries(
          List<LogbookEntryModel> logbookEntries) =>
      logbookEntries
          .map(
            (entry) => ScatterPlotScoreData(
              entry.dateTime,
              entry.ascentType,
              entry.score,
            ),
          )
          .toList();
}
