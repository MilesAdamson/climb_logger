import 'dart:async';

import 'package:climb_logger/models/goal_model.dart';
import 'package:climb_logger/models/hangboard_entry_model.dart';
import 'package:climb_logger/models/hangboard_routine_model.dart';
import 'package:climb_logger/models/logbook_entry_model.dart';
import 'package:climb_logger/models/project_model.dart';
import 'package:climb_logger/models/stats_model.dart';
import 'package:climb_logger/models/training_notes_model.dart';
import 'package:climb_logger/models/user_model.dart';
import 'package:climb_logger/util/project_view_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

typedef UidProvider = String Function();
typedef IncompleteGoalsProvider = List<DocumentSnapshot<GoalModel>> Function();

class DocumentService {
  static const statsDocumentId = "statsDocument";
  static const paginationSize = 50;

  final FirebaseFirestore _firestore;
  final UidProvider _uidProvider;
  final _controller = StreamController<DocumentSnapshot>();
  final _completedGoalController = StreamController<GoalModel>();

  bool _allLogbooksLoaded = false;
  String get uid => _uidProvider();

  Stream<DocumentSnapshot> get documents => _controller.stream;
  Stream<GoalModel> get completedGoals => _completedGoalController.stream;

  StreamSubscription? _userSubscription;
  StreamSubscription? _goalsSubscription;
  StreamSubscription? _logbookSubscription;
  StreamSubscription? _projectsSubscription;
  StreamSubscription? _statsSubscription;
  StreamSubscription? _hangboardRoutinesSubscription;
  StreamSubscription? _hangboardEntriesSubscription;
  StreamSubscription? _trainingNotesSubscription;

  final _logbookEntriesOfProjectsSubscriptions = <String, StreamSubscription>{};

  late final CollectionReference<UserModel> _users =
      _firestore.collection("users").withConverter<UserModel>(
            fromFirestore: (snapshot, options) => UserModel.fromJson(
              snapshot.data()!,
            ),
            toFirestore: (user, options) => user.toJson(),
          );

  late final CollectionReference<StatsModel> _stats =
      _firestore.collection("stats").withConverter<StatsModel>(
            fromFirestore: (snapshot, options) => StatsModel.fromJson(
              snapshot.data()!,
            ),
            toFirestore: (user, options) =>
                throw UnimplementedError("Users cannot modify stats"),
          );

  late CollectionReference<LogbookEntryModel> _logbookEntries;
  late CollectionReference<GoalModel> _goals;
  late CollectionReference<ProjectModel> _projects;
  late CollectionReference<HangboardRoutineModel> _hangboardRoutines;
  late CollectionReference<HangboardEntryModel> _hangboardEntries;
  late CollectionReference<TrainingNotesModel> _trainingNotes;

  DocumentService(
    this._firestore,
    this._uidProvider,
  );

  /// Returns the user model of an existing user. Returns null for
  /// a brand new user. Only existing users should see the "whats new"
  /// screen, not upon first log in ever
  Future<UserModel?> init() async {
    final userDoc = await _users.doc(uid).get();
    final userExisted = userDoc.exists;

    if (!userDoc.exists) {
      await _users.doc(uid).set(UserModel.newUser());
    }

    _logbookEntries = userDoc.reference
        .collection("logbook")
        .withConverter<LogbookEntryModel>(
          fromFirestore: (snapshot, options) => LogbookEntryModel.fromJson(
            snapshot.data()!,
          ),
          toFirestore: (logbookEntry, options) => logbookEntry.toJson(),
        );

    _goals = userDoc.reference.collection("goals").withConverter<GoalModel>(
          fromFirestore: (snapshot, options) => GoalModel.fromJson(
            snapshot.data()!,
          ),
          toFirestore: (goal, options) => goal.toJson(),
        );

    _projects =
        userDoc.reference.collection("projects").withConverter<ProjectModel>(
              fromFirestore: (snapshot, options) => ProjectModel.fromJson(
                snapshot.data()!,
              ),
              toFirestore: (project, options) => project.toJson(),
            );

    _hangboardRoutines = userDoc.reference
        .collection("hangboardRoutines")
        .withConverter<HangboardRoutineModel>(
          fromFirestore: (snapshot, options) => HangboardRoutineModel.fromJson(
            snapshot.data()!,
          ),
          toFirestore: (routine, options) => routine.toJson(),
        );

    _hangboardEntries = userDoc.reference
        .collection("hangboardEntries")
        .withConverter<HangboardEntryModel>(
          fromFirestore: (snapshot, options) => HangboardEntryModel.fromJson(
            snapshot.data()!,
          ),
          toFirestore: (entry, options) => entry.toJson(),
        );

    _trainingNotes = userDoc.reference
        .collection("trainingNotes")
        .withConverter<TrainingNotesModel>(
          fromFirestore: (snapshot, options) => TrainingNotesModel.fromJson(
            snapshot.data()!,
          ),
          toFirestore: (trainingNotes, options) => trainingNotes.toJson(),
        );

    _loadInitialLogbooks();

    _goalsSubscription = _goals.snapshots().listen((querySnapshot) {
      for (final doc in querySnapshot.docs) {
        _controller.add(doc);
      }
    });

    _projectsSubscription = _projects.snapshots().listen((querySnapshot) {
      for (final doc in querySnapshot.docs) {
        _controller.add(doc);
        _subscribeToProjectLogbooks(doc.data().relatedLogbookEntryIds);
      }
    });

    _hangboardRoutinesSubscription =
        _hangboardRoutines.snapshots().listen((querySnapshot) {
      for (final doc in querySnapshot.docs) {
        _controller.add(doc);
      }
    });

    _hangboardEntriesSubscription =
        _hangboardEntries.snapshots().listen((querySnapshot) {
      for (final doc in querySnapshot.docs) {
        _controller.add(doc);
      }
    });

    _trainingNotesSubscription =
        _trainingNotes.snapshots().listen((querySnapshot) {
      for (final doc in querySnapshot.docs) {
        _controller.add(doc);
      }
    });

    _userSubscription = userDoc.reference
        .snapshots()
        .listen((userDocument) => _controller.add(userDocument));

    return userExisted ? userDoc.data()! : null;
  }

  Future<void> cancelSubscriptions() async {
    await Future.wait([
      if (_userSubscription != null) _userSubscription!.cancel(),
      if (_goalsSubscription != null) _goalsSubscription!.cancel(),
      if (_logbookSubscription != null) _logbookSubscription!.cancel(),
      if (_projectsSubscription != null) _projectsSubscription!.cancel(),
      if (_statsSubscription != null) _statsSubscription!.cancel(),
      if (_trainingNotesSubscription != null)
        _trainingNotesSubscription!.cancel(),
      if (_hangboardEntriesSubscription != null)
        _hangboardEntriesSubscription!.cancel(),
      if (_hangboardRoutinesSubscription != null)
        _hangboardRoutinesSubscription!.cancel(),
      ..._logbookEntriesOfProjectsSubscriptions.values.map((e) => e.cancel()),
    ]);

    _userSubscription = null;
    _goalsSubscription = null;
    _logbookSubscription = null;
    _statsSubscription = null;
    _projectsSubscription = null;
    _hangboardRoutinesSubscription = null;
    _hangboardEntriesSubscription = null;
    _trainingNotesSubscription = null;
    _logbookEntriesOfProjectsSubscriptions.removeWhere((key, value) => true);

    _allLogbooksLoaded = false;
  }

  Future<void> _loadInitialLogbooks() async {
    var query = _logbookEntries
        .orderBy(LogbookEntryModel.keyTimestamp, descending: true)
        .limit(paginationSize);

    final firstLoadCompleter = Completer<void>();

    _logbookSubscription = query.snapshots().listen((querySnapshot) {
      for (final doc in querySnapshot.docs) {
        _controller.add(doc);
      }

      if (!firstLoadCompleter.isCompleted) {
        firstLoadCompleter.complete();
      }
    });

    await firstLoadCompleter.future;
  }

  void _subscribeToProjectLogbooks(List<String> ids) async {
    for (String id in ids) {
      _logbookEntriesOfProjectsSubscriptions[id]?.cancel();

      _logbookEntriesOfProjectsSubscriptions[id] =
          _logbookEntries.doc(id).snapshots().listen((doc) {
        _controller.add(doc);
      });
    }
  }

  Future<void> _unsubscribeToProjectLogbooks(List<String> ids) async {
    for (String id in ids) {
      await _logbookEntriesOfProjectsSubscriptions[id]?.cancel();
      _logbookEntriesOfProjectsSubscriptions.remove(id);
    }
  }

  void loadAllLogbooks() {
    if (_allLogbooksLoaded) {
      return;
    }

    _allLogbooksLoaded = true;

    var query = _logbookEntries.orderBy(
      LogbookEntryModel.keyTimestamp,
      descending: true,
    );

    _logbookSubscription = query.snapshots().listen((querySnapshot) {
      for (final doc in querySnapshot.docs) {
        _controller.add(doc);
      }
    });
  }

  Future<void> deleteLogbookEntry(
    DocumentSnapshot<LogbookEntryModel> logbookDocument,
    IncompleteGoalsProvider incompleteGoalsProvider,
  ) async {
    final logbookEntry = logbookDocument.data()!;
    for (final doc in incompleteGoalsProvider()) {
      final updatedGoal = doc.data()!.updateAfterAscentDeletion(logbookEntry);
      if (updatedGoal != doc.data()) {
        await _goals.doc(doc.id).set(updatedGoal);
      }
    }

    _logbookEntries.doc(logbookDocument.id).delete();
  }

  /// Does NOT update goals
  Stream<int> bulkInsertLogbookEntry(List<LogbookEntryModel> entries) async* {
    int i = 1;
    for (final logbookEntry in entries) {
      await _logbookEntries.add(logbookEntry);
      yield i++;
    }
  }

  Future<void> insertProjectsLogbookEntry(
    DocumentSnapshot<ProjectModel> projectDoc,
    LogbookEntryModel logbookEntry,
    IncompleteGoalsProvider incompleteGoalsProvider,
  ) async {
    final project = projectDoc.data()!;
    final newEntryId =
        await insertLogbookEntry(logbookEntry, incompleteGoalsProvider);
    final ids = [...project.relatedLogbookEntryIds, newEntryId];
    final updatedProject = project.copyWith(relatedLogbookEntryIds: ids);
    await _projects.doc(projectDoc.id).set(updatedProject);
  }

  /// Returns the id of the new entry, or the id provided.
  /// If an id is provided this will call set instead of add,
  /// using the given id as the document id
  Future<String> insertLogbookEntry(
    LogbookEntryModel logbookEntry,
    IncompleteGoalsProvider incompleteGoalsProvider, {
    String? documentId,
  }) async {
    Future<DocumentReference<LogbookEntryModel>>? addFuture;

    if (documentId == null) {
      addFuture = _logbookEntries.add(logbookEntry);
    } else {
      _logbookEntries.doc(documentId).set(logbookEntry);
    }

    for (final doc in incompleteGoalsProvider()) {
      final updatedGoal = doc.data()!.updateAfterAscent(logbookEntry);
      if (updatedGoal != doc.data()) {
        await _goals.doc(doc.id).set(updatedGoal);

        if (updatedGoal.isCompleted) {
          _completedGoalController.add(updatedGoal);
        }
      }
    }

    assert(documentId != null || addFuture != null);

    if (documentId != null) {
      return documentId;
    } else {
      final ref = await addFuture;
      return ref!.id;
    }
  }

  void insertGoal(GoalModel goal) => _goals.add(goal);

  void upsertTrainingNotes(TrainingNotesModel trainingNotes) =>
      _trainingNotes.doc(trainingNotes.documentId).set(trainingNotes);

  void insertHangboardEntry(HangboardEntryModel hangboardEntry) =>
      _hangboardEntries.add(hangboardEntry);

  void deleteGoal(String id) => _goals.doc(id).delete();

  void insertProject(ProjectModel p) => _projects.add(p);

  void insertHangboardRoutine(HangboardRoutineModel hangboardRoutine) =>
      _hangboardRoutines.add(hangboardRoutine);

  void editHangboardRoutine(
          HangboardRoutineModel hangboardRoutine, String id) =>
      _hangboardRoutines.doc(id).set(hangboardRoutine);

  Future<void> deleteProject(String id) => _projects.doc(id).delete();

  Future<void> deleteHangboardRoutine(String id) =>
      _hangboardRoutines.doc(id).delete();

  Future<void> deleteHangboardEntry(String id) =>
      _hangboardEntries.doc(id).delete();

  /// Logbook entries also need to be updated to match the new data
  Future<void> editProject(ProjectModel project, String id) =>
      _projects.doc(id).set(project);

  Future<void> deleteProjectAndAllEntries(
    ProjectViewModel viewModel,
    IncompleteGoalsProvider goalsProvider,
  ) async {
    await _unsubscribeToProjectLogbooks(
        viewModel.relatedEntryDocuments.map((doc) => doc.id).toList());

    await Future.wait([
      ...viewModel.relatedEntryDocuments
          .map((doc) => deleteLogbookEntry(doc, goalsProvider)),
      _projects.doc(viewModel.projectDocument.id).delete(),
    ]);
  }

  /// Deletes a logbook entry and re-inserts it with new data at the same id
  Future<void> editLogbookEntry(
    DocumentSnapshot<LogbookEntryModel> logbookDocument,
    LogbookEntryModel logbookEntry,
    IncompleteGoalsProvider incompleteGoalsProvider,
  ) async {
    await deleteLogbookEntry(logbookDocument, incompleteGoalsProvider);
    await insertLogbookEntry(
      logbookEntry,
      incompleteGoalsProvider,
      documentId: logbookDocument.id,
    );
  }

  void editGoal(String id, GoalModel goal) => _goals.doc(id).set(goal);

  void editCurrentUser(UserModel user) => _users.doc(uid).set(user);

  Future<void> setCurrentUserAsPaid(String uid) =>
      _users.doc(uid).update({UserModel.paidUserKey: true});

  void editTrainingNotes(DateTime dateTime, String notes) {
    final key =
        "${UserModel.trainingNotesKey}.${dateTime.millisecondsSinceEpoch}";
    _users.doc(uid).update({key: notes});
  }

  void startStatsSubscription() {
    _statsSubscription = _stats.doc(statsDocumentId).snapshots().listen((doc) {
      _controller.add(doc);
    });
  }

  void stopStatsSubscription() async {
    await _statsSubscription?.cancel();
    _statsSubscription = null;
  }
}
