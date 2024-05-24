import 'package:climb_logger/components/dialogs/confirm_dialog.dart';
import 'package:flutter/material.dart';

class ConfirmBack extends StatelessWidget {
  final Widget child;
  final String dialogTitle;
  final bool shouldPrompt;

  const ConfirmBack({
    Key? key,
    required this.child,
    required this.shouldPrompt,
    required this.dialogTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: child,
      onWillPop: () async {
        if (!shouldPrompt) {
          return true;
        }

        final confirm = await showConfirmationDialog(
          context,
          message:
              "Are you sure you want to go back? Your changes will not be saved",
          title: dialogTitle,
        );

        return confirm;
      },
    );
  }
}
