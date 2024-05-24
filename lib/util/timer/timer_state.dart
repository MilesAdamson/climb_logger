import 'package:climb_logger/models/hangboard_item_model.dart';
import 'package:intl/intl.dart';

enum TimerStatus { initial, active, paused, done }

extension TimerStatusExtension on TimerStatus {
  bool get canStart {
    switch (this) {
      case TimerStatus.paused:
      case TimerStatus.initial:
        return true;
      case TimerStatus.active:
      case TimerStatus.done:
        return false;
    }
  }

  bool get canPause {
    switch (this) {
      case TimerStatus.paused:
      case TimerStatus.initial:
      case TimerStatus.done:
        return false;
      case TimerStatus.active:
        return true;
    }
  }

  bool get canStop {
    switch (this) {
      case TimerStatus.paused:
      case TimerStatus.active:
      case TimerStatus.done:
        return true;
      case TimerStatus.initial:
        return false;
    }
  }
}

class TimerState {
  final int _totalElapsedMs;
  final int _taskElapsedMs;
  final int index;
  final HangboardItemModel item;
  final TimerStatus status;
  final double workoutPercentComplete;

  TimerState(
    this._totalElapsedMs,
    this._taskElapsedMs,
    this.index,
    this.item,
    this.status,
    this.workoutPercentComplete,
  );

  factory TimerState.initial(List<HangboardItemModel> items) {
    return TimerState(
      0,
      0,
      0,
      items[0],
      TimerStatus.initial,
      0.0,
    );
  }

  double get taskPercentComplete {
    final duration = item.duration.inSeconds;
    return duration > 0 ? _taskElapsedMs / (duration * 1000) : 0.0;
  }

  String get totalTimeString =>
      DateFormat.ms().format(DateTime(0, 0, 0, 0, 0, 0, _totalElapsedMs));

  String get taskTimeString =>
      formatDurationAsCountdown(item.duration, _taskElapsedMs);

  String formatDurationAsCountdown(Duration duration, int elapsedMs) {
    final secondsRemaining =
        Duration(milliseconds: duration.inMilliseconds - elapsedMs).inSeconds;

    final format =
        secondsRemaining >= 60 ? DateFormat("mm:ss.S") : DateFormat("ss.S");

    final label = format.format(
        DateTime(0, 0, 0, 0, 0, 0, duration.inMilliseconds - elapsedMs));

    return label.substring(0, label.length - 2);
  }

  @override
  int get hashCode => Object.hash(
        _totalElapsedMs,
        _taskElapsedMs,
        index,
        item,
        status,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is TimerState &&
            _totalElapsedMs == other._totalElapsedMs &&
            _taskElapsedMs == other._taskElapsedMs &&
            index == other.index &&
            status == other.status);
  }
}
