import 'package:climb_logger/services/document_service.dart';
import 'package:climb_logger/state/app_state.dart';
import 'package:climb_logger/state/bloc.dart';
import 'package:climb_logger/state/events.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

onEditProjectEvent(
  EditProjectEvent event,
  StateGetter state,
  IncompleteGoalsProvider goalsProvider,
  Emitter<AppState> emit,
  DocumentService documentService,
) async {
  await documentService.editProject(event.project, event.projectId);
  for (final id in event.project.relatedLogbookEntryIds) {
    final doc = state().logbookEntryMap[id]!;
    await documentService.editLogbookEntry(
      doc,
      doc.data()!.copyWith(
            gradeLabel: event.project.gradeLabel,
            climbName: event.project.name,
            climbType: event.project.climbType,
            tags: event.project.tags,
            wallType: event.project.wallType,
          ),
      goalsProvider,
    );
  }
}
