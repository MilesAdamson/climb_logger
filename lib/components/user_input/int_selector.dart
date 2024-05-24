import 'package:flutter/material.dart';

class IntSelector extends StatelessWidget {
  final int selected;
  final int stepCount;
  final int stepSize;
  final String title;
  final String? subtitle;
  final void Function(int i) onChanged;
  final bool zeroIsSelectable;

  const IntSelector({
    Key? key,
    required this.selected,
    required this.onChanged,
    required this.title,
    this.subtitle,
    this.zeroIsSelectable = false,
    this.stepCount = 30,
    this.stepSize = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectableValues = List.generate(stepCount, (i) {
      final intValue = (i + (zeroIsSelectable ? 0 : 1)) * stepSize;
      return DropdownMenuItem<int>(
        value: intValue,
        child: Text("$intValue"),
      );
    });

    return ListTile(
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle!) : null,
      trailing: DropdownButton<int>(
        value: selected,
        items: selectableValues,
        onChanged: (i) {
          if (i != null) {
            onChanged(i);
          }
        },
      ),
    );
  }
}
