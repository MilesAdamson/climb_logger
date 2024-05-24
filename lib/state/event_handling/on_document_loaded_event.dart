import 'package:climb_logger/models/goal_model.dart';
import 'package:climb_logger/models/hangboard_entry_model.dart';
import 'package:climb_logger/models/hangboard_routine_model.dart';
import 'package:climb_logger/models/logbook_entry_model.dart';
import 'package:climb_logger/models/project_model.dart';
import 'package:climb_logger/models/stats_model.dart';
import 'package:climb_logger/models/training_notes_model.dart';
import 'package:climb_logger/models/user_model.dart';
import 'package:climb_logger/state/app_state.dart';
import 'package:climb_logger/state/bloc.dart';
import 'package:climb_logger/state/events.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

onDocumentLoadedEvent(
  DocumentLoadedEvent event,
  StateGetter state,
  Emitter<AppState> emit,
) async {
  final document = event.document;

  if (document is DocumentSnapshot<UserModel>) {
    emit(state().copyWith(userDocument: document));
  }

  if (document is DocumentSnapshot<LogbookEntryModel>) {
    final entries = Map.of(state().logbookEntryMap);
    entries[document.id] = document;
    emit(state().copyWith(logbookEntryMap: entries));
  }

  if (document is DocumentSnapshot<GoalModel>) {
    final goals = Map.of(state().goalMap);
    goals[document.id] = document;
    emit(state().copyWith(goalMap: goals));
  }

  if (document is DocumentSnapshot<ProjectModel>) {
    final projects = Map.of(state().projectMap);
    projects[document.id] = document;
    emit(state().copyWith(projectMap: projects));
  }

  if (document is DocumentSnapshot<StatsModel>) {
    emit(state().copyWith(statsModel: document.data()!));
  }

  if (document is DocumentSnapshot<HangboardRoutineModel>) {
    final hangboardRoutines = Map.of(state().hangboardRoutineMap);
    hangboardRoutines[document.id] = document;
    emit(state().copyWith(hangboardRoutineMap: hangboardRoutines));
  }

  if (document is DocumentSnapshot<HangboardEntryModel>) {
    final hangboardEntries = Map.of(state().hangboardEntryMap);
    hangboardEntries[document.id] = document;
    emit(state().copyWith(hangboardEntryMap: hangboardEntries));
  }

  if (document is DocumentSnapshot<TrainingNotesModel>) {
    final date = document.data()?.dateTime;

    if (date == null) {
      return;
    }

    final trainingNotesMap = Map.of(state().trainingNotesMap);
    trainingNotesMap[date] = document;
    emit(state().copyWith(trainingNotesMap: trainingNotesMap));
  }
}
