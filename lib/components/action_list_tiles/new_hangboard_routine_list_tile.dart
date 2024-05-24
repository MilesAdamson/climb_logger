import 'package:climb_logger/components/dialogs/ad_dialog.dart';
import 'package:climb_logger/routing/navigator_extensions.dart';
import 'package:climb_logger/util/build_context_extensions.dart';
import 'package:climb_logger/util/icons.dart';
import 'package:flutter/material.dart';

class NewHangboardRoutineListTile extends StatelessWidget {
  const NewHangboardRoutineListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(kHangboardIcon),
      title: const Text("New Hangboard Routine"),
      subtitle: const Text(
        "Design a new hangboard routine",
      ),
      onTap: () async {
        final canContinue = await showInterstitialAd(
          context,
          "Creating a hangboard routine requires watching an ad. "
          "But don't worry - starting a workout does not",
        );

        if (!canContinue) {
          return;
        }

        final routine = await Navigator.of(context).hangboardRoutineCreation();

        if (routine != null) {
          Navigator.of(context).pop();
          final id = await context.createHangboardRoutine(routine);
          Navigator.of(context).hangboardRoutine(id);
        }
      },
    );
  }
}
