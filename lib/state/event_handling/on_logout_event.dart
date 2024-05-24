import 'package:climb_logger/services/auth_service.dart';
import 'package:climb_logger/services/document_service.dart';
import 'package:climb_logger/services/logger.dart';
import 'package:climb_logger/state/app_state.dart';
import 'package:climb_logger/state/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

onLogoutEvent(
  StateGetter state,
  Emitter<AppState> emit,
  AuthService authService,
  DocumentService documentService,
) async {
  try {
    await documentService.cancelSubscriptions();
    await authService.logout();
  } catch (e, s) {
    Logger.captureException(e, s);
  } finally {
    emit(AppState.initial());
  }
}
