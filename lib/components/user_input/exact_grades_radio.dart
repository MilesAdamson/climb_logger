import 'package:flutter/material.dart';

class ExactGradesRadio extends StatelessWidget {
  final bool exactGradesOnly;
  final void Function(bool selected) onChanged;
  const ExactGradesRadio({
    Key? key,
    required this.exactGradesOnly,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        RadioListTile<bool>(
          title: const Text("Exactly Grades Only"),
          subtitle:
              const Text("The grade must match the goal exactly. Redpointing a"
                  " V5 would not count towards a goal of redpointing a V4."),
          value: true,
          groupValue: exactGradesOnly,
          onChanged: (value) {
            if (value != null) {
              onChanged(true);
            }
          },
        ),
        RadioListTile<bool>(
          title: const Text("Equal to or Harder"),
          subtitle: const Text(
              "Redpointing a V5 would count towards a goal of redpointing a V4. "
              "Flashing a V5 would count towards flashing a V4."),
          value: false,
          groupValue: exactGradesOnly,
          onChanged: (value) {
            if (value != null) {
              onChanged(false);
            }
          },
        ),
      ],
    );
  }
}
