import 'package:climb_logger/services/document_service.dart';
import 'package:climb_logger/state/app_state.dart';
import 'package:climb_logger/state/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

onLoadAllLogbooksEvent(
  StateGetter state,
  Emitter<AppState> emit,
  DocumentService documentService,
) async {
  documentService.loadAllLogbooks();
  emit(state().copyWith(hasLoadedAllLogbooks: true));
}
