import 'package:climb_logger/services/auth_service.dart';
import 'package:climb_logger/services/logger.dart';
import 'package:climb_logger/state/app_state.dart';
import 'package:climb_logger/state/bloc.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

onLoginWithGoogleEvent(
  StateGetter state,
  Emitter<AppState> emit,
  AuthService _authService,
) async {
  try {
    await _authService.loginWithGoogle();
    emit(state().copyWith(
      loginError: null,
      isLoggedIn: _authService.isLoggedIn,
    ));
  } catch (e, s) {
    Logger.captureException(e, s);

    String message = "Login failed";

    if (e is PlatformException && e.code == "network_error") {
      message = "Login failed: network error";
    }

    emit(state().copyWith(
      loginError: message,
      isLoggedIn: _authService.isLoggedIn,
    ));
  }
}
