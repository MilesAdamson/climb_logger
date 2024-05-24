import 'package:climb_logger/state/bloc.dart';
import 'package:flutter_beep/flutter_beep.dart';

class SoundService {
  final AppStateBloc _bloc;

  SoundService(this._bloc);

  void hangboardDing() {
    if (_bloc.state.settings.playTimerSounds) {
      FlutterBeep.beep();
    }
  }
}
