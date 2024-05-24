import 'package:climb_logger/models/chart_settings_model.dart';
import 'package:climb_logger/models/logbook_entry_model.dart';
import 'package:climb_logger/util/ascent_type.dart';
import 'package:climb_logger/util/int_list_extensions.dart';

class TagsBarChartData {
  final String tag;
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

  TagsBarChartData({
    required this.tag,
    required this.bestRedpoint,
    required this.bestFlash,
    required this.bestOnsight,
    required this.bestProject,
  });

  static List<TagsBarChartData> fromLogbookEntries(
    List<LogbookEntryModel> logbookEntries,
    ChartSettingsModel chartSettings,
    List<String> tags,
  ) {
    final result = <TagsBarChartData>[];

    final entriesOfGradingSystem = chartSettings.filterEntries(logbookEntries);

    for (final tag in tags) {
      final entries =
          entriesOfGradingSystem.where((entry) => entry.tags.contains(tag));

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

      result.add(TagsBarChartData(
        tag: tag,
        bestFlash: bestFlash,
        bestOnsight: bestOnsight,
        bestRedpoint: bestRedpoint,
        bestProject: bestProject,
      ));
    }

    return result.where((data) => data.maximum > 0).toList();
  }
}
