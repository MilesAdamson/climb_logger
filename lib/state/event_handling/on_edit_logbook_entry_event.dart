import 'package:climb_logger/services/document_service.dart';
import 'package:climb_logger/services/logger.dart';
import 'package:climb_logger/state/app_state.dart';
import 'package:climb_logger/state/bloc.dart';
import 'package:climb_logger/state/events.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

onEditLogbookEntryEvent(
  EditLogbookEntryEvent event,
  StateGetter state,
  IncompleteGoalsProvider goals,
  Emitter<AppState> emit,
  DocumentService documentService,
) async {
  try {
    final logbookDocument = state().logbookEntryMap[event.id]!;
    await documentService.editLogbookEntry(
      logbookDocument,
      event.logbookEntry,
      goals,
    );
  } catch (e, s) {
    Logger.captureException(e, s);
  }
}
