import 'package:climb_logger/models/logbook_entry_model.dart';
import 'package:climb_logger/models/project_model.dart';
import 'package:climb_logger/state/app_state.dart';
import 'package:climb_logger/util/ascent_type.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';

class ProjectViewModel {
  final DocumentSnapshot<ProjectModel> projectDocument;
  final List<DocumentSnapshot<LogbookEntryModel>> relatedEntryDocuments;

  ProjectModel get project => projectDocument.data()!;

  bool get hasEntries => sortedEntryDocuments.isNotEmpty;

  bool get isLoaded => projectDocument.data() != null;

  List<DocumentSnapshot<LogbookEntryModel>> get sortedEntryDocuments =>
      relatedEntryDocuments
          .where((doc) => doc.exists && doc.data() != null)
          .toList()
        ..sort((a, b) => b.data()!.dateTime.compareTo(a.data()!.dateTime));

  List<LogbookEntryModel> get relatedEntries => sortedEntryDocuments
      .where((e) => e.data() != null)
      .map((e) => e.data()!)
      .toList();

  ProjectViewModel._(
    this.projectDocument,
    this.relatedEntryDocuments,
  );

  factory ProjectViewModel.fromState(String projectId, AppState appState) {
    final project = appState.projectMap[projectId]!;
    final relatedEntries = project
        .data()!
        .relatedLogbookEntryIds
        .map((id) => appState.logbookEntryMap[id])
        .whereType<DocumentSnapshot<LogbookEntryModel>>()
        .toList();

    return ProjectViewModel._(project, relatedEntries);
  }

  int get totalAttempts =>
      relatedEntries.fold<int>(0, (sum, e) => sum + (e.attempts ?? 0));

  String get totalAttemptsLabel =>
      "$totalAttempts attempts across ${relatedEntries.length} logbook entries";

  AscentType get ascentType {
    final completedAscent = relatedEntries
        .map((e) => e.ascentType)
        .firstWhereOrNull((ascentType) => ascentType.isCompleteAscent);
    return completedAscent ?? AscentType.project;
  }

  bool get projectIsCompleted => ascentType.isCompleteAscent;
}
