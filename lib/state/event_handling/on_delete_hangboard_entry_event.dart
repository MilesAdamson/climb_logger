import 'package:climb_logger/services/document_service.dart';
import 'package:climb_logger/state/app_state.dart';
import 'package:climb_logger/state/bloc.dart';
import 'package:climb_logger/state/events.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

onDeleteHangboardEntryEvent(
  DeleteHangboardEntryEvent event,
  StateGetter state,
  Emitter<AppState> emit,
  DocumentService documentService,
) async {
  final hangboardEntries = Map.of(state().hangboardEntryMap);
  hangboardEntries.remove(event.id);

  documentService.deleteHangboardEntry(event.id);
  emit(state().copyWith(hangboardEntryMap: hangboardEntries));
}
