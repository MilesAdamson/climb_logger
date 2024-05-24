import 'package:climb_logger/services/document_service.dart';
import 'package:climb_logger/state/app_state.dart';
import 'package:climb_logger/state/bloc.dart';
import 'package:climb_logger/state/events.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

onAddLogbookToProjectEvent(
  AddLogbookToProjectEvent event,
  StateGetter state,
  IncompleteGoalsProvider goalsProvider,
  Emitter<AppState> emit,
  DocumentService documentService,
) async {
  final projectDocument = state().projectMap[event.projectId]!;

  documentService.insertProjectsLogbookEntry(
    projectDocument,
    event.logbookEntry,
    goalsProvider,
  );
}
