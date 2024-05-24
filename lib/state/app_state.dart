import 'package:climb_logger/models/filters_model.dart';
import 'package:climb_logger/models/goal_model.dart';
import 'package:climb_logger/models/hangboard_entry_model.dart';
import 'package:climb_logger/models/hangboard_routine_model.dart';
import 'package:climb_logger/models/logbook_entry_model.dart';
import 'package:climb_logger/models/project_model.dart';
import 'package:climb_logger/models/settings_model.dart';
import 'package:climb_logger/models/stats_model.dart';
import 'package:climb_logger/models/training_notes_model.dart';
import 'package:climb_logger/models/user_model.dart';
import 'package:climb_logger/services/document_service.dart';
import 'package:climb_logger/util/map_extensions.dart';
import 'package:climb_logger/util/measurement_system.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_state.freezed.dart';

@freezed
class AppState with _$AppState {
  AppState._();

  factory AppState(
    bool appStartupHasRan,
    bool isLoggedIn,
    DocumentSnapshot<UserModel>? userDocument,
    String? loginError,
    Map<String, DocumentSnapshot<LogbookEntryModel>> logbookEntryMap,
    Map<String, DocumentSnapshot<GoalModel>> goalMap,
    Map<String, DocumentSnapshot<ProjectModel>> projectMap,
    Map<String, DocumentSnapshot<HangboardRoutineModel>> hangboardRoutineMap,
    Map<String, DocumentSnapshot<HangboardEntryModel>> hangboardEntryMap,
    Map<DateTime, DocumentSnapshot<TrainingNotesModel>> trainingNotesMap,
    GoalModel? recentlyCompletedGoal,
    String? fatalError,
    bool hasLoadedAllLogbooks,
    FiltersModel filters,
    int bulkInsertProgress,
    bool bulkInsertComplete,
    StatsModel statsModel,
    String? newVersionNumber,
  ) = _AppState;

  late final List<DocumentSnapshot<LogbookEntryModel>> logbookEntryDocList =
      logbookEntryMap.documentsWithData();

  late final List<DocumentSnapshot<GoalModel>> goalDocList =
      goalMap.documentsWithData();

  late final List<DocumentSnapshot<ProjectModel>> projectDocList =
      projectMap.documentsWithData();

  late final List<DocumentSnapshot<HangboardRoutineModel>>
      hangboardRoutineDocList = hangboardRoutineMap.documentsWithData();

  late final List<DocumentSnapshot<HangboardEntryModel>> hangboardEntryDocList =
      hangboardEntryMap.documentsWithData();

  late final int filteredLogbookLength =
      filteredLogbook.length + filteredHangboardEntries.length;

  late final int totalLogbookLength =
      logbookEntryMap.length + hangboardEntryMap.length;

  late final List<DocumentSnapshot<LogbookEntryModel>> filteredLogbook =
      logbookEntryDocList
          .where((doc) => filters.showLogbookEntry(doc.data()))
          .toList();

  late final List<DocumentSnapshot<HangboardEntryModel>>
      filteredHangboardEntries = hangboardEntryDocList
          .where((doc) => filters.showHangboardEntry(doc.data()))
          .toList();

  late final List<DocumentSnapshot<HangboardRoutineModel>>
      sortedHangboardRoutineDocuments = hangboardRoutineDocList
        ..sort((a, b) => b
            .data()!
            .name
            .toLowerCase()
            .compareTo(a.data()!.name.toLowerCase()));

  late final List<DocumentSnapshot<ProjectModel>> sortedProjectDocuments =
      projectDocList
        ..sort((a, b) => b.data()!.createdAt.compareTo(a.data()!.createdAt));

  late final List<DocumentSnapshot<GoalModel>> incompleteGoals =
      goalDocList.where((doc) => !doc.data()!.isCompleted).toList();

  late final List<DocumentSnapshot<GoalModel>> completeGoals =
      goalDocList.where((doc) => doc.data()!.isCompleted).toList();

  late final bool useMetricSystem =
      settings.measurementSystem == MeasurementSystem.metric;

  late final SettingsModel settings =
      userDocument?.data()?.settingsModel ?? SettingsModel.defaultValues();

  late final bool appReady = userDocument != null;

  late final bool shouldShowAds = !(userDocument?.data()?.isPaidUser ?? true);

  late final bool canLoadMoreLogbookEntries =
      logbookEntryMap.length >= DocumentService.paginationSize &&
          !hasLoadedAllLogbooks;

  @Deprecated("Use new map")
  String? trainingNotes(DateTime dateTime) {
    final notes =
        userDocument?.data()?.trainingNotes[dateTime.millisecondsSinceEpoch];

    if (notes != null && notes.trim().isNotEmpty) {
      return notes;
    }

    return null;
  }

  int scoreOfTimeRange(DateTime start, DateTime end) {
    final scores = logbookEntryMap
        .mapToData()
        .where(
            (log) => log.dateTime.isBefore(end) && log.dateTime.isAfter(start))
        .map((doc) => doc.score);

    final hangboardScores = hangboardEntryMap
        .mapToData()
        .where(
            (log) => log.dateTime.isBefore(end) && log.dateTime.isAfter(start))
        .map((doc) => doc.score);

    return [...scores, ...hangboardScores].fold(0, (a, b) => a + b);
  }

  factory AppState.initial() {
    return AppState(
      false,
      false,
      null,
      null,
      {},
      {},
      {},
      {},
      {},
      {},
      null,
      null,
      false,
      FiltersModel.showAll(),
      0,
      false,
      StatsModel.zero(),
      null,
    );
  }
}
