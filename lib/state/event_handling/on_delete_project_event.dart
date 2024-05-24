import 'package:climb_logger/components/dialogs/delete_project_dialog.dart';
import 'package:climb_logger/services/document_service.dart';
import 'package:climb_logger/state/app_state.dart';
import 'package:climb_logger/state/bloc.dart';
import 'package:climb_logger/state/events.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

onDeleteProjectEvent(
  DeleteProjectEvent event,
  StateGetter state,
  Emitter<AppState> emit,
  DocumentService documentService,
  IncompleteGoalsProvider goalsProvider,
) async {
  if (event.option == DeleteProjectOption.projectOnly) {
    final projects = Map.of(state().projectMap);
    projects.remove(event.viewModel.projectDocument.id);

    documentService.deleteProject(event.viewModel.projectDocument.id);
    emit(state().copyWith(projectMap: projects));
  } else if (event.option == DeleteProjectOption.projectAndEntries) {
    final projects = Map.of(state().projectMap);
    projects.remove(event.viewModel.projectDocument.id);
    final entries = Map.of(state().logbookEntryMap);
    for (final doc in event.viewModel.relatedEntryDocuments) {
      entries.remove(doc.id);
    }

    documentService.deleteProjectAndAllEntries(event.viewModel, goalsProvider);
    emit(state().copyWith(projectMap: projects, logbookEntryMap: entries));
  }
}
