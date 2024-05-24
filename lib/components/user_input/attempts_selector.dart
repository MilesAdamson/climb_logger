import 'package:climb_logger/util/ascent_type.dart';
import 'package:flutter/material.dart';

class AttemptsSelector extends StatelessWidget {
  static const selectableItemCount = 49;

  final int? attempts;
  final void Function(int selected) onChanged;
  final AscentType ascentType;

  const AttemptsSelector({
    Key? key,
    required this.attempts,
    required this.onChanged,
    required this.ascentType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool canChangeAttempts = ascentType.allowsAttempts;
    return ListTile(
      title: const Text("Attempts"),
      subtitle: Text(ascentType.attemptSelectionSubtitle),
      trailing: DropdownButton<int>(
        value: canChangeAttempts ? attempts : 1,
        items: [
          ...List.generate(
            selectableItemCount,
            (i) => DropdownMenuItem<int>(
              value: i + 1,
              child: Text("${i + 1}"),
            ),
          ),
        ],
        onChanged: canChangeAttempts
            ? (i) {
                if (i != null) {
                  onChanged(i);
                }
              }
            : null,
      ),
    );
  }
}
