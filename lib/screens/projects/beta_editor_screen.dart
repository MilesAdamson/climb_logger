import 'package:climb_logger/components/bottom_sheets/add_notes_bottom_sheet.dart';
import 'package:climb_logger/components/confirm_back.dart';
import 'package:climb_logger/components/draggable_list_view/draggable_list_view.dart';
import 'package:climb_logger/models/beta_model.dart';
import 'package:climb_logger/theme/ui_constants.dart';
import 'package:flutter/material.dart';

class BetaEditorScreen extends StatefulWidget {
  final List<BetaModel> initialBeta;

  const BetaEditorScreen({
    Key? key,
    required this.initialBeta,
  }) : super(key: key);

  @override
  State<BetaEditorScreen> createState() => BetaEditorScreenState();
}

class BetaEditorScreenState extends State<BetaEditorScreen> {
  static const delete = "Delete";
  static const edit = "Edit";
  static const cloneBelow = "Clone below";
  static const cloneBottom = "Clone at bottom";

  late List<BetaModel> beta = List.of(widget.initialBeta);
  bool userHasChangedForm = false;

  @override
  Widget build(BuildContext context) {
    return ConfirmBack(
      shouldPrompt: userHasChangedForm,
      dialogTitle: 'Discard beta?',
      child: Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => Navigator.of(context).pop(beta),
          label: const Text("Save beta"),
          icon: const Icon(Icons.edit),
        ),
        appBar: AppBar(
          title: const Text("Beta Editor"),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ListTile(
                subtitle: const Text(
                  "Record the beta of this project below. For example, "
                  "\"Left hand crimp, middle finger must hit divot\"",
                ),
                trailing: TextButton(
                  child: const Text("ADD BETA"),
                  onPressed: () => addBeta(context),
                ),
              ),
            ),
            const Divider(height: 1),
            Expanded(
              child: DraggableListView(
                padding: kListViewPadding,
                onReorder: onReorder,
                children:
                    beta.map((item) => buildListTile(item, context)).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> addBeta(BuildContext context) async {
    final newItem = await showEditNotesBottomSheet(
      context,
      null,
      title: "Add beta",
    );

    if (newItem != null) {
      setState(() {
        userHasChangedForm = true;
        beta.add(BetaModel.newItem(newItem));
      });
    }
  }

  void onReorder(int oldIndex, int newIndex) {
    setState(() {
      userHasChangedForm = true;
      if (oldIndex < newIndex) {
        newIndex -= 1;
      }
      final item = beta.removeAt(oldIndex);
      beta.insert(newIndex, item);
    });
  }

  ListTile buildListTile(BetaModel item, BuildContext context) {
    return ListTile(
      leading: buildPopupMenuButton(item, context),
      key: UniqueKey(),
      title: Text(item.beta),
    );
  }

  PopupMenuButton<String> buildPopupMenuButton(
    BetaModel item,
    BuildContext context,
  ) {
    return PopupMenuButton<String>(
      itemBuilder: (context) {
        return [
          const PopupMenuItem(
            value: edit,
            child: Text(edit),
          ),
          const PopupMenuItem(
            value: cloneBelow,
            child: Text(cloneBelow),
          ),
          const PopupMenuItem(
            value: cloneBottom,
            child: Text(cloneBottom),
          ),
          const PopupMenuItem(
            value: delete,
            child: Text(delete),
          ),
        ];
      },
      onSelected: (s) async {
        setState(() {
          userHasChangedForm = true;
        });

        if (s == edit) {
          final edited = await showEditNotesBottomSheet(context, item.beta);
          if (edited != null) {
            setState(
                () => beta[beta.indexOf(item)] = BetaModel.newItem(edited));
          }
        }

        if (s == delete) {
          setState(() => beta.remove(item));
        }

        if (s == cloneBelow) {
          int i = beta.indexOf(item);
          setState(
            () => beta.insert(
              i,
              item.copyWithNewUniqueId(),
            ),
          );
        }

        if (s == cloneBottom) {
          setState(() => beta.add(item.copyWithNewUniqueId()));
        }
      },
      child: const Icon(Icons.more_vert),
    );
  }
}
