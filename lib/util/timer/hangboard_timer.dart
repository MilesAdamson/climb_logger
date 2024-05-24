import 'dart:async';

import 'package:climb_logger/models/hangboard_item_model.dart';
import 'package:climb_logger/models/hangboard_routine_model.dart';
import 'package:climb_logger/services/sound_service.dart';
import 'package:climb_logger/util/timer/timer_state.dart';

class HangboardTimer {
  final SoundService _soundService;
  final StreamController<TimerState> _controller = StreamController.broadcast();
  final HangboardRoutineModel _hangboardRoutine;
  late final List<HangboardItemModel> workout =
      _hangboardRoutine.completeWorkout;

  Stream<TimerState> get stream => _controller.stream;

  final _totalTimer = Stopwatch();
  final _taskTimer = Stopwatch();
  late final StreamSubscription outputSubscription;

  int _index = 0;
  TimerStatus _status = TimerStatus.initial;

  HangboardItemModel get _item => workout[_index];

  bool _taskIsFinished(int ms) => ms > _item.duration.inMilliseconds;

  HangboardTimer(this._hangboardRoutine, this._soundService) {
    outputSubscription =
        Stream.periodic(const Duration(milliseconds: 10), (int i) {
      if (_taskIsFinished(_taskTimer.elapsedMilliseconds)) {
        _toNextItem();
      }
      _addState();
    }).listen((event) {});
  }

  void start() {
    _totalTimer.start();
    _taskTimer.start();
    _status = TimerStatus.active;
  }

  void pause() {
    _totalTimer.stop();
    _taskTimer.stop();
    _status = TimerStatus.paused;
  }

  void stop() {
    _totalTimer.stop();
    _totalTimer.reset();
    _taskTimer.stop();
    _taskTimer.reset();
    _index = 0;
    _status = TimerStatus.initial;
  }

  void _toNextItem() {
    if (_index < workout.length - 1) {
      _index++;
      _taskTimer.reset();

      _soundService.hangboardDing();
    } else {
      _status = TimerStatus.done;
      _addState();
      stop();
    }
  }

  void dispose() {
    outputSubscription.cancel();
    _taskTimer.stop();
    _totalTimer.stop();
    _controller.close();
  }

  TimerState? currentState;

  void _addState() {
    final nextState = TimerState(
      _totalTimer.elapsedMilliseconds,
      _taskTimer.elapsedMilliseconds,
      _index,
      _item,
      _status,
      _totalTimer.elapsedMilliseconds /
          _hangboardRoutine.totalDuration.inMilliseconds,
    );

    if (nextState != currentState) {
      _controller.add(nextState);
      currentState = nextState;
    }
  }
}
