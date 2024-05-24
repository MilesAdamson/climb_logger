import 'package:climb_logger/components/state_builder.dart';
import 'package:climb_logger/components/tag_chip.dart';
import 'package:climb_logger/util/ascent_type.dart';
import 'package:flutter/material.dart';

class TagSelect extends StatelessWidget {
  final String? selected;
  final void Function(String? tag) onChanged;
  final AscentType? ascentType;

  const TagSelect({
    Key? key,
    required this.selected,
    required this.onChanged,
    this.ascentType,
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
                color: selected == tag
                    ? (ascentType?.color(context) ?? Colors.blue)
                    : Colors.white,
                onPressed: () {
                  if (selected == tag) {
                    onChanged(null);
                  } else {
                    onChanged(tag);
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
