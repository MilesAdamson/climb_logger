import 'package:climb_logger/components/user_input/int_selector.dart';
import 'package:flutter/material.dart';

class DurationSelector extends StatelessWidget {
  final int selectedMinutes;
  final int selectedSeconds;
  final void Function(int selected) onMinutesChanged;
  final void Function(int selected) onSecondsChanged;
  final String title;
  final String subtitle;

  const DurationSelector({
    Key? key,
    required this.selectedMinutes,
    required this.selectedSeconds,
    required this.onMinutesChanged,
    required this.onSecondsChanged,
    required this.subtitle,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: Text(title),
          subtitle: Text(subtitle),
        ),
        IntSelector(
          zeroIsSelectable: true,
          title: "Minutes",
          selected: selectedMinutes,
          onChanged: onMinutesChanged,
          stepSize: 1,
          stepCount: 11,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 40.0),
          child: Text("+"),
        ),
        IntSelector(
          zeroIsSelectable: true,
          title: "Seconds",
          selected: selectedSeconds,
          onChanged: onSecondsChanged,
          stepSize: 1,
          stepCount: 60,
        ),
      ],
    );
  }
}
