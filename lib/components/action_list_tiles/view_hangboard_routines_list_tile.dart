import 'package:climb_logger/routing/navigator_extensions.dart';
import 'package:flutter/material.dart';

class ViewHangboardRoutinesListTile extends StatelessWidget {
  const ViewHangboardRoutinesListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.list),
      title: const Text("View Hangboard Routines"),
      subtitle: const Text(
        "Manage your hangboard routines",
      ),
      onTap: Navigator.of(context).hangboardRoutines,
    );
  }
}
