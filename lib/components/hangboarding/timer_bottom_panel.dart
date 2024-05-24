import 'package:climb_logger/components/hangboarding/timer_actions.dart';
import 'package:climb_logger/util/timer/hangboard_timer.dart';
import 'package:climb_logger/util/timer/timer_state.dart';
import 'package:flutter/material.dart';

class TimerBottomPanel extends StatelessWidget {
  static const progressBarHeight = 10.0;

  final bool isLandscape;
  final HangboardTimer timer;
  final TimerState timerState;
  final Color restColor;
  final Color hangColor;

  const TimerBottomPanel({
    Key? key,
    required this.timer,
    required this.isLandscape,
    required this.timerState,
    required this.restColor,
    required this.hangColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        mainAxisSize: isLandscape ? MainAxisSize.max : MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LinearProgressIndicator(
            value: timerState.taskPercentComplete,
            valueColor: AlwaysStoppedAnimation(
              timerState.item.isRest ? restColor : hangColor,
            ),
            minHeight: progressBarHeight,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("${timerState.index + 1} / ${timer.workout.length}"),
              Text(
                timerState.taskTimeString,
                style: Theme.of(context).textTheme.headline1,
              ),
              Text(timerState.totalTimeString),
            ],
          ),
          LinearProgressIndicator(
            value: timerState.workoutPercentComplete,
            minHeight: progressBarHeight,
            valueColor: AlwaysStoppedAnimation(
              timerState.item.isRest ? restColor : hangColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 40.0, top: 20.0),
            child: TimerActions(
              start: timer.start,
              stop: timer.stop,
              status: timerState.status,
              pause: timer.pause,
            ),
          ),
        ],
      ),
    );
  }
}
