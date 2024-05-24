import 'package:climb_logger/models/logbook_entry_model.dart';
import 'package:climb_logger/util/ascent_type.dart';

extension LogbookEntriesExtensions on List<LogbookEntryModel> {
  List<LogbookEntryModel> redpoints() =>
      where((e) => e.ascentType == AscentType.redpoint).toList();

  List<LogbookEntryModel> onsights() =>
      where((e) => e.ascentType == AscentType.onsight).toList();

  List<LogbookEntryModel> flashes() =>
      where((e) => e.ascentType == AscentType.flash).toList();

  List<LogbookEntryModel> projects() =>
      where((e) => e.ascentType == AscentType.project).toList();

  List<LogbookEntryModel> ofGrade(String gradeLabel) =>
      where((e) => e.gradeLabel == gradeLabel).toList();
}
