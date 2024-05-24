import 'package:climb_logger/components/state_builder.dart';
import 'package:climb_logger/components/tag_chip.dart';
import 'package:climb_logger/util/ascent_type.dart';
import 'package:flutter/material.dart';

class TagsDisplay extends StatelessWidget {
  final List<String> tags;
  final AscentType ascentType;

  const TagsDisplay({
    Key? key,
    required this.tags,
    required this.ascentType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StateBuilder(builder: (context, state) {
      final filteredTags =
          tags.where((tag) => state.settings.tags.contains(tag));

      if (filteredTags.isEmpty) return const SizedBox.shrink();

      return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: Wrap(alignment: WrapAlignment.start, children: [
          ...filteredTags.map(
            (tag) => Padding(
              padding: const EdgeInsets.all(4.0),
              child: TagChip(
                tag: tag,
                color: ascentType.color(context),
              ),
            ),
          ),
        ]),
      );
    });
  }
}
