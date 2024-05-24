import 'package:climb_logger/util/climb_type.dart';
import 'package:flutter/material.dart';

class ClimbTypeRadio extends StatelessWidget {
  final ClimbType climbType;
  final void Function(ClimbType climbType) onChanged;
  final bool hasPluralLabels;

  const ClimbTypeRadio({
    Key? key,
    required this.climbType,
    required this.onChanged,
    this.hasPluralLabels = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...ClimbType.values.map(
          (type) => Flexible(
            flex: 1,
            child: RadioListTile<ClimbType>(
              title: Text(hasPluralLabels ? type.pluralLabel : type.label),
              value: type,
              groupValue: climbType,
              onChanged: (value) {
                if (value != null) {
                  onChanged(value);
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
