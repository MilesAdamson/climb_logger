import 'package:climb_logger/components/dialogs/add_tag_dialog.dart';
import 'package:climb_logger/components/dialogs/confirm_dialog.dart';
import 'package:climb_logger/state/events.dart';
import 'package:climb_logger/theme/ui_constants.dart';
import 'package:climb_logger/util/build_context_extensions.dart';
import 'package:flutter/material.dart';

class TagsScreen extends StatefulWidget {
  const TagsScreen({Key? key}) : super(key: key);

  @override
  State<TagsScreen> createState() => TagsScreenState();
}

class TagsScreenState extends State<TagsScreen> {
  final listKey = GlobalKey<AnimatedListState>();
  late final settings = context.bloc.state.settings;
  late var tags = List.of(settings.tags);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tags"),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final tag = await showAddTagDialog(context);
          if (tag != null) {
            addTag(tag);
          }
        },
        label: const Text("New tag"),
        icon: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: ListTile(
              title: Text("Tags"),
              subtitle: Text(
                  "You can tag your logbook entries for filtering and charts. "
                  "You can modify your list of tags here."),
            ),
          ),
          const Divider(height: 1),
          if (tags.isEmpty)
            Padding(
              padding:
                  const EdgeInsets.only(top: 64.0, left: 16.0, right: 16.0),
              child: Text(
                "Tap \"Add\" to create tags here. Logbook entries can optionally "
                "be tagged for filtering and charts.",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.subtitle1!,
              ),
            ),
          Expanded(
            child: AnimatedList(
              key: listKey,
              padding: kListViewPadding,
              initialItemCount: tags.length,
              itemBuilder: (context, i, animation) =>
                  buildTagListTile(tags[i], animation, true),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTagListTile(
    String tag,
    Animation<double> animation,
    bool enabled,
  ) {
    return SizeTransition(
      sizeFactor: animation,
      child: ListTile(
        key: UniqueKey(),
        title: Text(tag),
        contentPadding: const EdgeInsets.only(left: 16.0, right: 2.0),
        trailing: IconButton(
          padding: EdgeInsets.zero,
          icon: const Icon(Icons.delete),
          onPressed: enabled
              ? () async {
                  final confirm = await showConfirmationDialog(context,
                      title: 'Delete "$tag" Tag',
                      message: "If you delete this tag, and logbook entries "
                          "which used it will no longer display it.");

                  if (confirm) {
                    removeTag(tag);
                  }
                }
              : null,
        ),
      ),
    );
  }

  void addTag(String tag) {
    final settings = context.bloc.state.settings;
    context.bloc.add(
      ChangeSettingsEvent(
        settings.copyWith(
          tags: [tag, ...settings.tags],
        ),
      ),
    );

    setState(() {
      tags = [tag, ...tags];
    });

    listKey.currentState!.insertItem(0);
  }

  void removeTag(String tag) {
    final settings = context.bloc.state.settings;
    context.bloc.add(
      ChangeSettingsEvent(
        settings.copyWith(
          tags: List.of(settings.tags)..remove(tag),
        ),
      ),
    );

    listKey.currentState!.removeItem(
      settings.tags.indexOf(tag),
      (context, animation) => buildTagListTile(
        tag,
        animation,
        false,
      ),
    );

    setState(() {
      tags.remove(tag);
    });
  }
}
