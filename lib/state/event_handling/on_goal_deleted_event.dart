import 'package:climb_logger/services/document_service.dart';
import 'package:climb_logger/state/app_state.dart';
import 'package:climb_logger/state/bloc.dart';
import 'package:climb_logger/state/events.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

onGoalDeletedEvent(
  DeleteGoalEvent event,
  StateGetter state,
  Emitter<AppState> emit,
  DocumentService documentService,
) {
  final goals = Map.of(state().goalMap);
  goals.remove(event.id);
  emit(state().copyWith(goalMap: goals));
  documentService.deleteGoal(event.id);
}
