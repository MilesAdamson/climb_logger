import 'package:climb_logger/util/timer/timer_state.dart';
import 'package:flutter/material.dart';

class TimerActions extends StatelessWidget {
  static const buttonSize = 50.0;

  final TimerStatus status;
  final VoidCallback pause;
  final VoidCallback start;
  final VoidCallback stop;

  const TimerActions({
    Key? key,
    required this.status,
    required this.pause,
    required this.start,
    required this.stop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          padding: EdgeInsets.zero,
          onPressed: status.canStart ? start : null,
          icon: Icon(
            Icons.play_arrow_sharp,
            color: status.canStart ? Colors.green : Colors.grey,
            size: buttonSize,
          ),
        ),
        IconButton(
          padding: EdgeInsets.zero,
          onPressed: status.canPause ? pause : null,
          icon: Icon(
            Icons.pause,
            color: status.canPause ? Colors.orange : Colors.grey,
            size: buttonSize,
          ),
        ),
        IconButton(
          padding: EdgeInsets.zero,
          onPressed: status.canStop ? stop : null,
          icon: Icon(
            Icons.stop,
            color: status.canStop ? Colors.red : Colors.grey,
            size: buttonSize,
          ),
        ),
      ],
    );
  }
}
