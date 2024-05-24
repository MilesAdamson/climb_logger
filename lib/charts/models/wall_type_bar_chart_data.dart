import 'package:climb_logger/models/chart_settings_model.dart';
import 'package:climb_logger/models/logbook_entry_model.dart';
import 'package:climb_logger/util/ascent_type.dart';
import 'package:climb_logger/util/int_list_extensions.dart';
import 'package:climb_logger/util/wall_type.dart';

class WallTypeBarChartData {
  final WallType wallType;
  final int bestRedpoint;
  final int bestFlash;
  final int bestOnsight;
  final int bestProject;

  int get maximum => [
        bestRedpoint,
        bestFlash,
        bestOnsight,
        bestProject,
      ].maxOrDefault(0);

  WallTypeBarChartData({
    required this.wallType,
    required this.bestRedpoint,
    required this.bestFlash,
    required this.bestOnsight,
    required this.bestProject,
  });

  static List<WallTypeBarChartData> fromLogbookEntries(
    List<LogbookEntryModel> logbookEntries,
    ChartSettingsModel chartSettings,
  ) {
    final result = <WallTypeBarChartData>[];
    final entriesOfGradingSystem = chartSettings.filterEntries(logbookEntries);

    for (final wallType in WallType.values) {
      final entries =
          entriesOfGradingSystem.where((entry) => entry.wallType == wallType);

      final bestRedpoint = [
        ...entries
            .where((entry) => entry.ascentType == AscentType.redpoint)
            .map((entry) => entry.gradeIndex),
      ].maxOrDefault(0);

      final bestFlash = [
        ...entries
            .where((entry) => entry.ascentType == AscentType.flash)
            .map((entry) => entry.gradeIndex),
      ].maxOrDefault(0);

      final bestOnsight = [
        ...entries
            .where((entry) => entry.ascentType == AscentType.onsight)
            .map((entry) => entry.gradeIndex),
      ].maxOrDefault(0);

      final bestProject = [
        ...entries
            .where((entry) => entry.ascentType == AscentType.project)
            .map((entry) => entry.gradeIndex),
      ].maxOrDefault(0);

      result.add(WallTypeBarChartData(
        wallType: wallType,
        bestFlash: bestFlash,
        bestOnsight: bestOnsight,
        bestRedpoint: bestRedpoint,
        bestProject: bestProject,
      ));
    }

    return result;
  }
}
