import 'package:climb_logger/hangboard_templates/hangboard_difficulty.dart';
import 'package:flutter/material.dart';

class HangboardDifficultySelector extends StatelessWidget {
  final HangboardDifficulty difficulty;
  final void Function(HangboardDifficulty selected) onChanged;

  const HangboardDifficultySelector({
    Key? key,
    required this.difficulty,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: const Text("Select Difficulty"),
          trailing: DropdownButton<HangboardDifficulty>(
            value: difficulty,
            onChanged: (selected) {
              if (selected != null) {
                onChanged(selected);
              }
            },
            items: HangboardDifficulty.values
                .map(
                  (difficulty) => DropdownMenuItem<HangboardDifficulty>(
                    value: difficulty,
                    child: Text(difficulty.title),
                  ),
                )
                .toList(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 50),
            child: Text(
              difficulty.subtitle,
              style: Theme.of(context).textTheme.caption,
            ),
          ),
        ),
      ],
    );
  }
}
