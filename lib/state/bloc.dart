import 'dart:async';

import 'package:climb_logger/models/goal_model.dart';
import 'package:climb_logger/services/ad_service.dart';
import 'package:climb_logger/services/auth_service.dart';
import 'package:climb_logger/services/document_service.dart';
import 'package:climb_logger/services/iap_service.dart';
import 'package:climb_logger/state/app_state.dart';
import 'package:climb_logger/state/event_handling/on_add_logbook_to_project_event.dart';
import 'package:climb_logger/state/event_handling/on_app_startup_event.dart';
import 'package:climb_logger/state/event_handling/on_delete_hangboard_entry_event.dart';
import 'package:climb_logger/state/event_handling/on_delete_hangboard_routine_event.dart';
import 'package:climb_logger/state/event_handling/on_delete_project_event.dart';
import 'package:climb_logger/state/event_handling/on_document_loaded_event.dart';
import 'package:climb_logger/state/event_handling/on_edit_logbook_entry_event.dart';
import 'package:climb_logger/state/event_handling/on_edit_project_event.dart';
import 'package:climb_logger/state/event_handling/on_goal_deleted_event.dart';
import 'package:climb_logger/state/event_handling/on_initialize_document_service_event.dart';
import 'package:climb_logger/state/event_handling/on_load_all_logbooks_event.dart';
import 'package:climb_logger/state/event_handling/on_logbook_bulk_insert_event.dart';
import 'package:climb_logger/state/event_handling/on_logbook_entry_deleted_event.dart';
import 'package:climb_logger/state/event_handling/on_login_with_apple_event.dart';
import 'package:climb_logger/state/event_handling/on_login_with_google_event.dart';
import 'package:climb_logger/state/event_handling/on_logout_event.dart';
import 'package:climb_logger/state/event_handling/on_purchase_details_event.dart';
import 'package:climb_logger/state/events.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

typedef StateGetter = AppState Function();

class AppStateBloc extends Bloc<Event, AppState> {
  static const minimumSplashDuration = Duration(seconds: 1, milliseconds: 500);

  late final StreamSubscription<DocumentSnapshot> _documentSubscription;
  late final StreamSubscription<GoalModel> _completedGoalSubscription;
  late final StreamSubscription<PurchaseDetails> _purchasesMadeSubscription;

  @override
  Future<void> close() async {
    await Future.wait([
      _documentSubscription.cancel(),
      _documentService.cancelSubscriptions(),
      _completedGoalSubscription.cancel(),
      _purchasesMadeSubscription.cancel(),
    ]);
    return super.close();
  }

  final AdService _adService;
  final AuthService _authService;
  final DocumentService _documentService;
  final IapService _iapService;

  AppState _state() => state;

  List<DocumentSnapshot<GoalModel>> _incompleteGoalsProvider() =>
      state.incompleteGoals;

  AppStateBloc(
    this._authService,
    this._documentService,
    this._adService,
    this._iapService,
  ) : super(AppState.initial()) {
    on<LoginWithGoogleEvent>(
        (event, emit) => onLoginWithGoogleEvent(_state, emit, _authService));

    on<LoginWithAppleEvent>(
        (event, emit) => onLoginWithAppleEvent(_state, emit, _authService));

    on<AppStartupEvent>((event, emit) =>
        onAppStartupEvent(_state, emit, _authService, _adService, _iapService));

    on<InitializeDocumentServiceEvent>((event, emit) =>
        onInitializeDocumentServiceEvent(_state, emit, _documentService));

    on<DocumentLoadedEvent>(
        (event, emit) => onDocumentLoadedEvent(event, _state, emit));

    on<CreateLogbookEntryEvent>((event, emit) => _documentService
        .insertLogbookEntry(event.entry, _incompleteGoalsProvider));

    on<LogbookBulkInsertEvent>((event, emit) =>
        onLogbookBulkInsertEvent(event, _state, emit, _documentService));

    on<CreateGoalEvent>(
        (event, emit) => _documentService.insertGoal(event.goal));

    on<UpsertTrainingNotesEvent>((event, emit) =>
        _documentService.upsertTrainingNotes(event.trainingNotesModel));

    on<HangboardRoutineCompletedEvent>((event, emit) =>
        _documentService.insertHangboardEntry(event.hangboardEntry));

    on<GoalCompletedEvent>((event, emit) =>
        emit(state.copyWith(recentlyCompletedGoal: event.goal)));

    on<ChangeSettingsEvent>((event, emit) => _documentService.editCurrentUser(
        state.userDocument!.data()!.copyWith(settingsModel: event.settings)));

    on<LogoutEvent>((event, emit) =>
        onLogoutEvent(_state, emit, _authService, _documentService));

    on<DeleteLogbookEntryEvent>((event, emit) => onLogbookEntryDeletedEvent(
        event, _state, _incompleteGoalsProvider, emit, _documentService));

    on<EditLogbookEntryEvent>((event, emit) => onEditLogbookEntryEvent(
        event, _state, _incompleteGoalsProvider, emit, _documentService));

    on<AddLogbookToProjectEvent>((event, emit) => onAddLogbookToProjectEvent(
        event, _state, _incompleteGoalsProvider, emit, _documentService));

    on<EditGoalEvent>(
        (event, emit) => _documentService.editGoal(event.id, event.goal));

    on<EditHangboardRoutineEvent>((event, emit) => _documentService
        .editHangboardRoutine(event.hangboardRoutine, event.id));

    on<DeleteGoalEvent>((event, emit) =>
        onGoalDeletedEvent(event, _state, emit, _documentService));

    on<DeleteHangboardRoutineEvent>((event, emit) =>
        onDeleteHangboardRoutineEvent(event, _state, emit, _documentService));

    on<DeleteHangboardEntryEvent>((event, emit) =>
        onDeleteHangboardEntryEvent(event, _state, emit, _documentService));

    on<LoadAllLogbooksEvent>((event, emit) =>
        onLoadAllLogbooksEvent(_state, emit, _documentService));

    on<SetCurrentUserAsPaidEvent>((event, emit) async => _documentService
        .setCurrentUserAsPaid(await _authService.getUidAsync()));

    on<PurchaseMadeEvent>((event, emit) => onPurchaseDetailsEvent(
        event, _state, emit, _iapService, _documentService, _authService));

    on<ModifyFiltersEvent>(
        (event, emit) => emit(state.copyWith(filters: event.filters)));

    on<ModifyTrainingNotesEvent>((event, emit) =>
        _documentService.editTrainingNotes(event.dateTime, event.notes));

    on<CreateProjectEvent>(
        (event, emit) => _documentService.insertProject(event.project));

    on<CreateHangboardRoutineEvent>((event, emit) =>
        _documentService.insertHangboardRoutine(event.hangboardRoutine));

    on<DeleteProjectEvent>((event, emit) => onDeleteProjectEvent(
        event, _state, emit, _documentService, _incompleteGoalsProvider));

    _documentSubscription = _documentService.documents
        .listen((document) => add(DocumentLoadedEvent(document)));

    _completedGoalSubscription = _documentService.completedGoals
        .listen((goal) => add(GoalCompletedEvent(goal)));

    _purchasesMadeSubscription = _iapService.purchases
        .listen((purchaseDetails) => add(PurchaseMadeEvent(purchaseDetails)));

    on<StartStatsSubscriptionEvent>(
        (event, emit) => _documentService.startStatsSubscription());

    on<StopStatsSubscriptionEvent>(
        (event, emit) => _documentService.stopStatsSubscription());

    on<StatsLoadedEvent>((event, emit) {
      emit(state.copyWith(statsModel: event.statsModel));
    });

    on<EditProjectEvent>((event, emit) => onEditProjectEvent(
        event, _state, _incompleteGoalsProvider, emit, _documentService));
  }
}
