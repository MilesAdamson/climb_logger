import 'package:flutter/material.dart';

Future<void> showIapFailedDialog(BuildContext context, String message) {
  return showDialog(
    context: context,
    builder: (context) {
      return IapFailedDialog(message: message);
    },
  );
}

class IapFailedDialog extends StatelessWidget {
  final String message;

  const IapFailedDialog({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Product Failed to Load"),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text("DISMISS"),
        ),
      ],
    );
  }
}
