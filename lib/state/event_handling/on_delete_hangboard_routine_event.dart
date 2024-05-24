import 'package:climb_logger/services/document_service.dart';
import 'package:climb_logger/state/app_state.dart';
import 'package:climb_logger/state/bloc.dart';
import 'package:climb_logger/state/events.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

onDeleteHangboardRoutineEvent(
  DeleteHangboardRoutineEvent event,
  StateGetter state,
  Emitter<AppState> emit,
  DocumentService documentService,
) async {
  final hangboardRoutines = Map.of(state().hangboardRoutineMap);
  hangboardRoutines.remove(event.id);

  documentService.deleteHangboardRoutine(event.id);
  emit(state().copyWith(hangboardRoutineMap: hangboardRoutines));
}
