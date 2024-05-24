import 'package:climb_logger/components/hangboarding/hangboard_item_list_tile.dart';
import 'package:climb_logger/models/hangboard_routine_model.dart';
import 'package:flutter/material.dart';

Future<bool> showHangboardRoutineDialog(
  BuildContext context, {
  required HangboardRoutineModel hangboardRoutine,
  bool previewMode = false,
}) async {
  final result = await showDialog(
    context: context,
    builder: (context) => ConfirmHangboardRoutineDialog(
      hangboardRoutine: hangboardRoutine,
      previewMode: previewMode,
    ),
  );

  return result != null;
}

class ConfirmHangboardRoutineDialog extends StatelessWidget {
  final HangboardRoutineModel hangboardRoutine;
  final bool previewMode;

  late final completeWorkout = hangboardRoutine.completeWorkout;

  ConfirmHangboardRoutineDialog({
    Key? key,
    required this.hangboardRoutine,
    required this.previewMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Preview Hangboard Routine"),
      content: Material(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.55,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            itemCount: completeWorkout.length,
            itemBuilder: (context, i) {
              return HangboardItemListTile(
                item: completeWorkout[i],
                workout: completeWorkout,
              );
            },
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: Navigator.of(context).pop,
          child: Text(previewMode ? "OK" : "CANCEL"),
        ),
        if (!previewMode)
          TextButton(
            onPressed: () {
              Navigator.pop(context, 1);
            },
            child: const Text("SAVE"),
          ),
      ],
    );
  }
}
