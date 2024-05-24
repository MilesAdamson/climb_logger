import 'package:climb_logger/util/wall_type.dart';
import 'package:flutter/material.dart';

class WallTypeRadio extends StatelessWidget {
  final WallType wallType;
  final void Function(WallType wallType) onChanged;

  const WallTypeRadio({
    Key? key,
    required this.wallType,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...WallType.values.map(
          (type) => RadioListTile<WallType>(
            title: Text(type.label),
            value: type,
            activeColor: type.color(context),
            groupValue: wallType,
            onChanged: (value) {
              if (value != null) {
                onChanged(value);
              }
            },
          ),
        ),
      ],
    );
  }
}
