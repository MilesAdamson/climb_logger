import 'package:flutter/material.dart';

Future<String?> showAddTagDialog(BuildContext context) async {
  final result = await showDialog<String?>(
    context: context,
    builder: (_) => const AddTagDialog(),
  );

  if (result != null && result.isNotEmpty) {
    return result;
  }

  return null;
}

class AddTagDialog extends StatefulWidget {
  const AddTagDialog({Key? key}) : super(key: key);

  @override
  State<AddTagDialog> createState() => _AddTagDialogState();
}

class _AddTagDialogState extends State<AddTagDialog> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("New Tag"),
      content: TextField(
        autofocus: true,
        controller: controller,
        textCapitalization: TextCapitalization.words,
        onSubmitted: (s) {
          Navigator.pop(context, s.trim());
        },
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("CANCEL"),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context, controller.text.trim());
          },
          child: const Text("OK"),
        ),
      ],
    );
  }
}
