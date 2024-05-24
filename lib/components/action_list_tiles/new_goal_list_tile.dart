import 'package:climb_logger/components/dialogs/ad_dialog.dart';
import 'package:climb_logger/routing/navigator_extensions.dart';
import 'package:climb_logger/util/build_context_extensions.dart';
import 'package:climb_logger/util/icons.dart';
import 'package:flutter/material.dart';

class NewGoalListTile extends StatelessWidget {
  const NewGoalListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(kGoalIcon),
      title: const Text("New Goal"),
      subtitle: const Text(
        "Set a goal to climb a particular grade and style",
      ),
      onTap: () async {
        final canContinue = await showInterstitialAd(
            context, "Creating a goal requires watching an interstitial ad.");
        if (!canContinue) return;

        final goal = await Navigator.of(context).goalCreation();
        if (goal != null) {
          Navigator.pop(context);
          final goalId = await context.createGoal(goal);
          Navigator.of(context).goal(goalId);
        }
      },
    );
  }
}
