import 'package:flutter/material.dart';

Future<bool> showConfirmationDialog(
  BuildContext context, {
  String? message,
  required String title,
  bool showCancelButton = true,
}) async {
  final result = await showDialog(
    context: context,
    builder: (context) => ConfirmDialog(
      title: title,
      message: message,
      showCancelButton: showCancelButton,
    ),
  );

  return result != null;
}

class ConfirmDialog extends StatelessWidget {
  final String? message;
  final String title;
  final bool showCancelButton;

  const ConfirmDialog({
    Key? key,
    required this.title,
    required this.message,
    required this.showCancelButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: message != null ? Text(message!) : null,
      actions: [
        if (showCancelButton)
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("CANCEL"),
          ),
        TextButton(
          onPressed: () {
            Navigator.pop(context, 1);
          },
          child: const Text("OK"),
        ),
      ],
    );
  }
}
