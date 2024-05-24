import 'package:climb_logger/services/document_service.dart';
import 'package:climb_logger/state/app_state.dart';
import 'package:climb_logger/state/bloc.dart';
import 'package:climb_logger/state/events.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

onLogbookEntryDeletedEvent(
  DeleteLogbookEntryEvent event,
  StateGetter state,
  IncompleteGoalsProvider incompleteGoalsProvider,
  Emitter<AppState> emit,
  DocumentService documentService,
) {
  final entry = state().logbookEntryMap[event.id]!;
  final entries = Map.of(state().logbookEntryMap);
  entries.remove(event.id);
  emit(state().copyWith(logbookEntryMap: entries));

  documentService.deleteLogbookEntry(entry, incompleteGoalsProvider);
}
