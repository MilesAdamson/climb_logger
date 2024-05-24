import 'package:climb_logger/util/ascent_type.dart';
import 'package:flutter/material.dart';

class AscentTypeRadio extends StatelessWidget {
  final AscentType ascentType;
  final List<AscentType> selectableOptions;
  final void Function(AscentType ascentType) onChanged;

  const AscentTypeRadio({
    Key? key,
    required this.ascentType,
    required this.onChanged,
    required this.selectableOptions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ...selectableOptions.map(
          (type) => RadioListTile<AscentType>(
            title: Text(type.label),
            value: type,
            activeColor: type.color(context),
            groupValue: ascentType,
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
