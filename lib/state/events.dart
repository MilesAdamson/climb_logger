import 'package:climb_logger/components/dialogs/delete_project_dialog.dart';
import 'package:climb_logger/models/filters_model.dart';
import 'package:climb_logger/models/goal_model.dart';
import 'package:climb_logger/models/hangboard_entry_model.dart';
import 'package:climb_logger/models/hangboard_routine_model.dart';
import 'package:climb_logger/models/logbook_entry_model.dart';
import 'package:climb_logger/models/project_model.dart';
import 'package:climb_logger/models/settings_model.dart';
import 'package:climb_logger/models/stats_model.dart';
import 'package:climb_logger/models/training_notes_model.dart';
import 'package:climb_logger/util/project_view_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

@immutable
abstract class Event {}

@immutable
class AppStartupEvent extends Event {}

@immutable
class LoginWithGoogleEvent extends Event {}

@immutable
class LoginWithAppleEvent extends Event {}

@immutable
class InitializeDocumentServiceEvent extends Event {}

@immutable
class DocumentLoadedEvent extends Event {
  final DocumentSnapshot document;

  DocumentLoadedEvent(this.document);
}

@immutable
class CreateLogbookEntryEvent extends Event {
  final LogbookEntryModel entry;

  CreateLogbookEntryEvent(this.entry);
}

@immutable
class LogbookBulkInsertEvent extends Event {
  final List<LogbookEntryModel> entries;

  LogbookBulkInsertEvent(this.entries);
}

@immutable
class CreateGoalEvent extends Event {
  final GoalModel goal;

  CreateGoalEvent(this.goal);
}

@immutable
class EditGoalEvent extends Event {
  final String id;
  final GoalModel goal;

  EditGoalEvent(this.id, this.goal);
}

@immutable
class DeleteLogbookEntryEvent extends Event {
  final String id;

  DeleteLogbookEntryEvent(this.id);
}

@immutable
class DeleteGoalEvent extends Event {
  final String id;

  DeleteGoalEvent(this.id);
}

@immutable
class EditLogbookEntryEvent extends Event {
  final String id;
  final LogbookEntryModel logbookEntry;

  EditLogbookEntryEvent(this.id, this.logbookEntry);
}

@immutable
class GoalCompletedEvent extends Event {
  final GoalModel goal;

  GoalCompletedEvent(this.goal);
}

@immutable
class ChangeSettingsEvent extends Event {
  final SettingsModel settings;

  ChangeSettingsEvent(this.settings);
}

@immutable
class LoadAllLogbooksEvent extends Event {}

@immutable
class LogoutEvent extends Event {}

@immutable
class SetCurrentUserAsPaidEvent extends Event {}

@immutable
class PurchaseMadeEvent extends Event {
  final PurchaseDetails purchaseDetails;

  PurchaseMadeEvent(this.purchaseDetails);
}

@immutable
class ModifyTrainingNotesEvent extends Event {
  final DateTime dateTime;
  final String notes;

  ModifyTrainingNotesEvent(this.dateTime, this.notes);
}

@immutable
class ModifyFiltersEvent extends Event {
  final FiltersModel filters;

  ModifyFiltersEvent(this.filters);
}

@immutable
class StartStatsSubscriptionEvent extends Event {}

@immutable
class StatsLoadedEvent extends Event {
  final StatsModel statsModel;

  StatsLoadedEvent(this.statsModel);
}

@immutable
class StopStatsSubscriptionEvent extends Event {}

@immutable
class CreateProjectEvent extends Event {
  final ProjectModel project;

  CreateProjectEvent(this.project);
}

@immutable
class DeleteProjectEvent extends Event {
  final ProjectViewModel viewModel;
  final DeleteProjectOption option;

  DeleteProjectEvent(this.viewModel, this.option);
}

@immutable
class AddLogbookToProjectEvent extends Event {
  final LogbookEntryModel logbookEntry;
  final String projectId;

  AddLogbookToProjectEvent(this.logbookEntry, this.projectId);
}

@immutable
class EditProjectEvent extends Event {
  final ProjectModel project;
  final String projectId;

  EditProjectEvent(this.project, this.projectId);
}

@immutable
class CreateHangboardRoutineEvent extends Event {
  final HangboardRoutineModel hangboardRoutine;

  CreateHangboardRoutineEvent(this.hangboardRoutine);
}

@immutable
class EditHangboardRoutineEvent extends Event {
  final String id;
  final HangboardRoutineModel hangboardRoutine;

  EditHangboardRoutineEvent(this.id, this.hangboardRoutine);
}

@immutable
class DeleteHangboardRoutineEvent extends Event {
  final String id;

  DeleteHangboardRoutineEvent(this.id);
}

@immutable
class HangboardRoutineCompletedEvent extends Event {
  final HangboardEntryModel hangboardEntry;

  HangboardRoutineCompletedEvent(this.hangboardEntry);
}

@immutable
class DeleteHangboardEntryEvent extends Event {
  final String id;

  DeleteHangboardEntryEvent(this.id);
}

@immutable
class UpsertTrainingNotesEvent extends Event {
  final TrainingNotesModel trainingNotesModel;

  UpsertTrainingNotesEvent(this.trainingNotesModel);
}
