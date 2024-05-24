import 'package:climb_logger/services/auth_service.dart';
import 'package:climb_logger/services/logger.dart';
import 'package:climb_logger/state/app_state.dart';
import 'package:climb_logger/state/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

onLoginWithAppleEvent(
  StateGetter state,
  Emitter<AppState> emit,
  AuthService _authService,
) async {
  try {
    await _authService.loginInWithApple();
    emit(state().copyWith(
      loginError: null,
      isLoggedIn: _authService.isLoggedIn,
    ));
  } catch (e, s) {
    if (e is SignInWithAppleAuthorizationException &&
        e.code == AuthorizationErrorCode.canceled) {
      return;
    }

    Logger.captureException(e, s);

    emit(state().copyWith(
      loginError: "Login failed",
      isLoggedIn: _authService.isLoggedIn,
    ));
  }
}
