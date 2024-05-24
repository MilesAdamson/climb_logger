import 'package:climb_logger/components/dialogs/ad_dialog.dart';
import 'package:climb_logger/routing/navigator_extensions.dart';
import 'package:climb_logger/util/build_context_extensions.dart';
import 'package:climb_logger/util/icons.dart';
import 'package:flutter/material.dart';

class NewProjectListTile extends StatelessWidget {
  const NewProjectListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(kProjectIcon),
      title: const Text("New Project"),
      subtitle: const Text(
        "Log attempts and beta for a specific climb",
      ),
      onTap: () async {
        final canContinue = await showInterstitialAd(
            context, "Creating a project requires watching an ad");

        if (!canContinue) return;

        final project = await Navigator.of(context).projectCreation();
        if (project != null) {
          Navigator.pop(context);
          final id = await context.createProject(project);
          Navigator.of(context).project(id);
        }
      },
    );
  }
}
