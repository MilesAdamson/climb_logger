import 'package:climb_logger/components/dialogs/select_hangboard_routine_dialog.dart';
import 'package:climb_logger/models/hangboard_routine_model.dart';
import 'package:climb_logger/routing/navigator_extensions.dart';
import 'package:climb_logger/util/build_context_extensions.dart';
import 'package:climb_logger/util/icons.dart';
import 'package:flutter/material.dart';

class StartHangboardRoutineListTile extends StatelessWidget {
  const StartHangboardRoutineListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(kTimerIcon),
      title: const Text("Start Hangboard Routine"),
      subtitle: const Text(
        "Train on a hangboard with the timer",
      ),
      onTap: () async {
        final selected = await selectHangboardRoutineDialog(
          context,
          context.bloc.state.hangboardRoutineDocList
              .map((doc) => doc.data())
              .whereType<HangboardRoutineModel>()
              .toList(),
        );

        if (selected != null) {
          Navigator.of(context).hangboardTimer(selected);
        }
      },
    );
  }
}
