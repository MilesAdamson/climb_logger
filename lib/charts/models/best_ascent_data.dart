import 'package:climb_logger/models/chart_settings_model.dart';
import 'package:climb_logger/models/logbook_entry_model.dart';
import 'package:climb_logger/util/ascent_type.dart';
import 'package:climb_logger/util/grading_system.dart';

class BestAscentData {
  final DateTime dateTime;
  final AscentType ascentType;
  final int gradeIndex;
  final GradingSystem gradingSystem;

  BestAscentData(
    this.dateTime,
    this.ascentType,
    this.gradeIndex,
    this.gradingSystem,
  );

  static List<BestAscentData> fromLogbookEntries(
    List<LogbookEntryModel> logbookEntries,
    ChartSettingsModel chartSettings,
  ) {
    final gradingSystem = chartSettings.gradingSystem!;

    final sortedEntries = logbookEntries
      ..sort((a, b) => a.dateTime.compareTo(b.dateTime));

    final redpointData = <BestAscentData>[];
    final onsightData = <BestAscentData>[];
    final flashData = <BestAscentData>[];
    final projectData = <BestAscentData>[];

    int bestRedpoint = 0;
    int bestOnsight = 0;
    int bestFlash = 0;
    int bestProject = 0;

    for (final log in sortedEntries) {
      final indexOfAscent = gradingSystem.labels.indexOf(log.gradeLabel);

      if (log.ascentType == AscentType.redpoint &&
          indexOfAscent > bestRedpoint) {
        redpointData.add(BestAscentData(
          log.dateTime.subtract(const Duration(seconds: 1)),
          AscentType.redpoint,
          bestRedpoint,
          gradingSystem,
        ));
        bestRedpoint = indexOfAscent;
      }

      if (log.ascentType == AscentType.flash && indexOfAscent > bestFlash) {
        flashData.add(BestAscentData(
          log.dateTime.subtract(const Duration(seconds: 1)),
          AscentType.flash,
          bestFlash,
          gradingSystem,
        ));
        bestFlash = indexOfAscent;
      }

      if (log.ascentType == AscentType.onsight && indexOfAscent > bestOnsight) {
        onsightData.add(BestAscentData(
          log.dateTime.subtract(const Duration(seconds: 1)),
          AscentType.onsight,
          bestOnsight,
          gradingSystem,
        ));
        bestOnsight = indexOfAscent;
      }

      if (log.ascentType == AscentType.project && indexOfAscent > bestProject) {
        projectData.add(BestAscentData(
          log.dateTime.subtract(const Duration(seconds: 1)),
          AscentType.project,
          bestProject,
          gradingSystem,
        ));
        bestProject = indexOfAscent;
      }

      redpointData.add(BestAscentData(
          log.dateTime, AscentType.redpoint, bestRedpoint, gradingSystem));
      flashData.add(BestAscentData(
          log.dateTime, AscentType.flash, bestFlash, gradingSystem));
      onsightData.add(BestAscentData(
          log.dateTime, AscentType.onsight, bestOnsight, gradingSystem));
      projectData.add(BestAscentData(
          log.dateTime, AscentType.project, bestProject, gradingSystem));
    }

    return [...redpointData, ...onsightData, ...flashData, ...projectData];
  }
}
