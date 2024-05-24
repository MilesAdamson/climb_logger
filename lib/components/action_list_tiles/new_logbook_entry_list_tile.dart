import 'package:climb_logger/routing/navigator_extensions.dart';
import 'package:climb_logger/state/events.dart';
import 'package:climb_logger/util/build_context_extensions.dart';
import 'package:climb_logger/util/icons.dart';
import 'package:flutter/material.dart';

class NewLogbookEntryListTile extends StatelessWidget {
  const NewLogbookEntryListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(kLogbookIcon),
      title: const Text("New Logbook Entry"),
      subtitle: const Text("Add a climb to your logbook"),
      onTap: () async {
        final entry = await Navigator.of(context).logbookCreation();
        if (entry != null) {
          Navigator.pop(context);
          context.bloc.add(CreateLogbookEntryEvent(entry));
        }
      },
    );
  }
}
