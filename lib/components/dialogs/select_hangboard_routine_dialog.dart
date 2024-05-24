import 'package:climb_logger/models/hangboard_routine_model.dart';
import 'package:flutter/material.dart';

Future<HangboardRoutineModel?> selectHangboardRoutineDialog(
  BuildContext context,
  List<HangboardRoutineModel> hangboardRoutines,
) async {
  assert(hangboardRoutines.isNotEmpty);

  if (hangboardRoutines.length == 1) {
    return hangboardRoutines.single;
  }

  return await showDialog<HangboardRoutineModel>(
    context: context,
    builder: (context) => SelectHangboardRoutineDialog(
      hangboardRoutines: hangboardRoutines,
    ),
  );
}

class SelectHangboardRoutineDialog extends StatefulWidget {
  final List<HangboardRoutineModel> hangboardRoutines;

  const SelectHangboardRoutineDialog({
    Key? key,
    required this.hangboardRoutines,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => SelectHangboardRoutineDialogState();
}

class SelectHangboardRoutineDialogState
    extends State<SelectHangboardRoutineDialog> {
  late HangboardRoutineModel selected;

  @override
  void initState() {
    selected = widget.hangboardRoutines.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Select Hangboard Routine"),
      content: DropdownButton<HangboardRoutineModel>(
        value: selected,
        onChanged: (p) {
          if (p != null) {
            setState(() => selected = p);
          }
        },
        items: widget.hangboardRoutines
            .map(
              (routine) => DropdownMenuItem<HangboardRoutineModel>(
                child: Text(
                  routine.name,
                ),
                value: routine,
              ),
            )
            .toList(),
      ),
      actions: [
        TextButton(
          onPressed: Navigator.of(context).pop,
          child: const Text("CANCEL"),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(selected),
          child: const Text("OK"),
        ),
      ],
    );
  }
}
