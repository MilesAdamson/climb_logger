import 'package:climb_logger/models/chart_settings_model.dart';
import 'package:climb_logger/models/logbook_entry_model.dart';
import 'package:climb_logger/util/ascent_type.dart';

class ScatterPlotGradeData {
  final DateTime dateTime;
  final AscentType ascentType;
  final int value;

  ScatterPlotGradeData(
    this.dateTime,
    this.ascentType,
    this.value,
  );

  static List<ScatterPlotGradeData> fromLogbookEntries(
    List<LogbookEntryModel> logbookEntries,
    ChartSettingsModel chartSettings,
  ) =>
      chartSettings
          .filterEntries(logbookEntries)
          .map(
            (entry) => ScatterPlotGradeData(
              entry.dateTime,
              entry.ascentType,
              chartSettings.gradingSystem?.labels.indexOf(entry.gradeLabel) ??
                  entry.score,
            ),
          )
          .toList();
}
