import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

Future<Color?> showColorPicker(
  BuildContext context, {
  required Color initialValue,
  required Color resetValue,
}) async {
  return showDialog<Color?>(
    context: context,
    builder: (context) => ChooseColorDialog(
      initialValue: initialValue,
      resetValue: resetValue,
    ),
  );
}

class ChooseColorDialog extends StatefulWidget {
  final Color initialValue;
  final Color resetValue;

  const ChooseColorDialog({
    Key? key,
    required this.initialValue,
    required this.resetValue,
  }) : super(key: key);

  @override
  State<ChooseColorDialog> createState() => ChooseColorDialogState();
}

class ChooseColorDialogState extends State<ChooseColorDialog> {
  late Color color;

  @override
  void initState() {
    color = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SingleChildScrollView(
        child: ColorPicker(
          labelTypes: const [],
          displayThumbColor: true,
          enableAlpha: false,
          pickerColor: color,
          onColorChanged: (selected) {
            setState(() {
              color = selected;
            });
          },
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('CANCEL'),
          onPressed: Navigator.of(context).pop,
        ),
        TextButton(
            child: const Text('DEFAULT'),
            onPressed: () {
              setState(() {
                color = widget.resetValue;
              });
            }),
        TextButton(
          child: const Text('OK'),
          onPressed: () => Navigator.of(context).pop(color),
        ),
      ],
    );
  }
}
