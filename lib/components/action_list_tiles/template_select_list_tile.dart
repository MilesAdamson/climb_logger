import 'package:climb_logger/routing/navigator_extensions.dart';
import 'package:flutter/material.dart';

class TemplateSelectListTile extends StatelessWidget {
  const TemplateSelectListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.build),
      title: const Text("Hangboard Routine Templates"),
      subtitle: const Text(
        "Select a hangboard routines from prebuilt templates, with difficulty options",
      ),
      onTap: Navigator.of(context).hangboardTemplates,
    );
  }
}
