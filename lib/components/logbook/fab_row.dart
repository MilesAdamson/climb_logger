import 'package:climb_logger/components/bottom_sheets/home_screen_bottom_sheet.dart';
import 'package:climb_logger/routing/navigator_extensions.dart';
import 'package:climb_logger/state/events.dart';
import 'package:climb_logger/util/build_context_extensions.dart';
import 'package:flutter/material.dart';

class FabRow extends StatelessWidget {
  const FabRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: FloatingActionButton.extended(
              heroTag: null,
              onPressed: () => showHomeScreenBottomSheet(context),
              label: const Text("Menu"),
              icon: const Icon(Icons.menu_open),
            ),
          ),
          SizedBox(
            height: 48.0,
            child: FloatingActionButton(
              onPressed: () async {
                final entry = await Navigator.of(context).logbookCreation();
                if (entry != null) {
                  context.bloc.add(CreateLogbookEntryEvent(entry));
                }
              },
              child: const Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
