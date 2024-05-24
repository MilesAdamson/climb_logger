import 'package:climb_logger/components/state_builder.dart';
import 'package:climb_logger/components/tag_chip.dart';
import 'package:climb_logger/util/ascent_type.dart';
import 'package:flutter/material.dart';

class TagsMultiSelect extends StatelessWidget {
  final List<String> selected;
  final void Function(List<String> tags) onChanged;
  final AscentType? ascentType;

  const TagsMultiSelect({
    Key? key,
    required this.selected,
    required this.onChanged,
    required this.ascentType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StateBuilder(builder: (context, state) {
      final tags = List.of(state.settings.tags);
      return Center(
        child: Wrap(alignment: WrapAlignment.start, children: [
          ...tags.map(
            (tag) => Padding(
              padding: const EdgeInsets.all(4.0),
              child: TagChip(
                tag: tag,
                color: selected.contains(tag)
                    ? (ascentType?.color(context) ?? Colors.blue)
                    : Colors.white,
                onPressed: () {
                  final copy = List.of(selected);
                  if (selected.contains(tag)) {
                    onChanged(copy..remove(tag));
                  } else {
                    onChanged(copy..add(tag));
                  }
                },
              ),
            ),
          ),
        ]),
      );
    });
  }
}
