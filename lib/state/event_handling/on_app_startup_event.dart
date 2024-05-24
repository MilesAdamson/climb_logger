import 'package:climb_logger/services/ad_service.dart';
import 'package:climb_logger/services/auth_service.dart';
import 'package:climb_logger/services/iap_service.dart';
import 'package:climb_logger/services/logger.dart';
import 'package:climb_logger/state/app_state.dart';
import 'package:climb_logger/state/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

onAppStartupEvent(
  StateGetter state,
  Emitter<AppState> emit,
  AuthService authService,
  AdService adService,
  IapService iapService,
) async {
  try {
    await Future.wait([
      Future.delayed(AppStateBloc.minimumSplashDuration),
      adService.init(),
      iapService.init(),
    ]);
  } catch (e, s) {
    Logger.captureException(e, s);
  } finally {
    emit(state().copyWith(
      appStartupHasRan: true,
      isLoggedIn: authService.isLoggedIn,
    ));
  }
}
