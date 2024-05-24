import 'package:climb_logger/models/chart_settings_model.dart';
import 'package:climb_logger/models/logbook_entry_model.dart';
import 'package:climb_logger/util/logbook_entries_extensions.dart';

class GradeBarChartData {
  final String gradeLabel;
  final int redpoints;
  final int onsights;
  final int flashes;
  final int projects;

  int get sum => redpoints + onsights + flashes + projects;

  bool get isEmpty => sum == 0;

  GradeBarChartData({
    required this.gradeLabel,
    required this.redpoints,
    required this.onsights,
    required this.flashes,
    required this.projects,
  });

  static List<GradeBarChartData> fromLogbookEntries(
    List<LogbookEntryModel> logbookEntries,
    ChartSettingsModel chartSettings,
  ) {
    final labels = chartSettings.gradingSystem!.labels;

    final rawData = labels
        .map(
          (gradeLabel) => GradeBarChartData(
            onsights: chartSettings.showOnsights
                ? logbookEntries.onsights().ofGrade(gradeLabel).length
                : 0,
            flashes: chartSettings.showFlashes
                ? logbookEntries.flashes().ofGrade(gradeLabel).length
                : 0,
            redpoints: chartSettings.showRedpoints
                ? logbookEntries.redpoints().ofGrade(gradeLabel).length
                : 0,
            projects: chartSettings.showProjects
                ? logbookEntries.projects().ofGrade(gradeLabel).length
                : 0,
            gradeLabel: gradeLabel,
          ),
        )
        .toList();

    if (rawData.every((element) => element.isEmpty)) return rawData;

    final firstPopulatedData = rawData.firstWhere((data) => !data.isEmpty);
    final lastPopulatedData = rawData.lastWhere((data) => !data.isEmpty);

    rawData.removeRange(0, rawData.indexOf(firstPopulatedData));
    rawData.removeRange(rawData.indexOf(lastPopulatedData) + 1, rawData.length);

    return rawData;
  }
}
