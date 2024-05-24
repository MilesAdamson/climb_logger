import 'package:climb_logger/components/bottom_banner_ad.dart';
import 'package:climb_logger/components/confirm_back.dart';
import 'package:climb_logger/components/dialogs/confirm_hangboard_routine_dialog.dart';
import 'package:climb_logger/components/draggable_list_view/draggable_list_view.dart';
import 'package:climb_logger/components/user_input/duration_selector.dart';
import 'package:climb_logger/components/user_input/int_selector.dart';
import 'package:climb_logger/models/hangboard_item_model.dart';
import 'package:climb_logger/models/hangboard_routine_model.dart';
import 'package:climb_logger/routing/navigator_extensions.dart';
import 'package:climb_logger/theme/ui_constants.dart';
import 'package:climb_logger/util/format_minutes_and_seconds.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HangboardRoutineCreationScreen extends StatefulWidget {
  final HangboardRoutineModel? initialData;

  const HangboardRoutineCreationScreen({
    Key? key,
    required this.initialData,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => HangboardRoutineCreationScreenState();
}

class HangboardRoutineCreationScreenState
    extends State<HangboardRoutineCreationScreen>
    with SingleTickerProviderStateMixin {
  static const delete = "Delete";
  static const edit = "Edit";
  static const cloneBelow = "Clone below";
  static const cloneBottom = "Clone at bottom";

  static const scoreStepSize = 100;

  final nameController = TextEditingController();
  late final tabController = TabController(length: 2, vsync: this);
  final formKey = GlobalKey<FormState>();

  late final String initialName;
  bool get isEditing => widget.initialData != null;
  int sets = 2;
  int score = scoreStepSize * 5;
  bool userHasChangedForm = false;

  var items = <HangboardItemModel>[];
  late final List<HangboardItemModel> initialItems;

  int restBetweenSetsSeconds = 0;
  int restBetweenSetsMinutes = 1;

  bool get shouldPromptForBack =>
      userHasChangedForm ||
      initialName != nameController.text ||
      !listEquals(initialItems, items);

  @override
  void initState() {
    final initialData = widget.initialData;

    if (initialData != null) {
      sets = initialData.sets;
      restBetweenSetsSeconds = initialData.restBetweenSetsSeconds;
      restBetweenSetsMinutes = initialData.restBetweenSetsMinutes;
      score = initialData.score;
      items =
          initialData.items.map((item) => item.copyWithNewUniqueId()).toList();
    }

    nameController.text = initialData?.name ?? "";
    initialName = nameController.text;
    initialItems = items;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ConfirmBack(
      shouldPrompt: shouldPromptForBack,
      dialogTitle: 'Discard ${isEditing ? "Changes" : "Hangboard Routine?"}',
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          floatingActionButton: FloatingActionButton.extended(
            heroTag: null,
            onPressed: onSubmit,
            label: Text("${isEditing ? "Save" : "Create"} hangboard routine"),
            icon: Icon(isEditing ? Icons.edit : Icons.save),
          ),
          appBar: buildAppBar(context),
          bottomNavigationBar: const BottomBannerAd(),
          body: Form(
            key: formKey,
            child: TabBarView(
              controller: tabController,
              children: [
                buildSettings(context),
                buildWorkoutItems(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column buildWorkoutItems(BuildContext context) {
    return Column(
      children: [
        buildHeader(context),
        const Divider(height: 1),
        Expanded(
          child: DraggableListView(
            padding: kListViewPadding,
            children:
                items.map((item) => buildListTile(item, context)).toList(),
            onReorder: onReorder,
          ),
        ),
      ],
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      actions: [
        IconButton(
          onPressed: Navigator.of(context).settings,
          icon: const Icon(Icons.settings),
        ),
      ],
      bottom: TabBar(
        controller: tabController,
        tabs: const [
          Tab(icon: Text("Settings")),
          Tab(icon: Text("Workout Items")),
        ],
      ),
      title: Text(
        isEditing ? "Edit ${widget.initialData!.name}" : "Create Routine",
      ),
    );
  }

  Padding buildHeader(BuildContext context) {
    final restMessage = "(with ${formatMinutesAndSeconds(
      restBetweenSetsMinutes,
      restBetweenSetsSeconds,
    )} rest in between)";

    final trailing = "$sets times ${sets == 1 ? "" : restMessage}";
    final setsLabel = "$sets set${sets == 1 ? "" : "s"}";

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: ListTile(
        subtitle: Text(
          "Design the contents of a set below. "
          "Since you have selected $setsLabel,"
          " the list of workout items will repeated"
          " ${sets == 1 ? "once" : trailing}.",
        ),
        trailing: TextButton(
          onPressed: () async {
            final item = await Navigator.of(context).hangboardItemCreation();
            if (item != null) {
              setState(() {
                items.add(item);
              });
            }
          },
          child: const Text("ADD ITEM"),
        ),
      ),
    );
  }

  void onReorder(int oldIndex, int newIndex) {
    setState(() {
      userHasChangedForm = true;
      if (oldIndex < newIndex) {
        newIndex -= 1;
      }
      final item = items.removeAt(oldIndex);
      items.insert(newIndex, item);
    });
  }

  ListTile buildListTile(HangboardItemModel item, BuildContext context) {
    return ListTile(
      leading: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: buildPopupMenuButton(item, context),
      ),
      key: UniqueKey(),
      title: Text(item.fullName()),
      subtitle: Text(item.durationLabel),
    );
  }

  PopupMenuButton<String> buildPopupMenuButton(
    HangboardItemModel item,
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
          final edited = await Navigator.of(context)
              .hangboardItemCreation(initialData: item);
          if (edited != null) {
            setState(() => items[items.indexOf(item)] = edited);
          }
        }

        if (s == delete) {
          setState(() => items.remove(item));
        }

        if (s == cloneBelow) {
          int i = items.indexOf(item);
          setState(
            () => items.insert(
              i,
              item.copyWithNewUniqueId(),
            ),
          );
        }

        if (s == cloneBottom) {
          setState(() => items.add(item.copyWithNewUniqueId()));
        }
      },
      child: const Icon(Icons.more_vert),
    );
  }

  Widget buildSettings(BuildContext context) {
    return ListView(
      padding: kListViewPadding,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextFormField(
            key: const Key("ClimbNameEntry"),
            textCapitalization: TextCapitalization.words,
            autofocus: false,
            decoration: const InputDecoration(
              label: Text("Routine Name"),
            ),
            controller: nameController,
            validator: (s) {
              final input = s?.trim() ?? "";
              if (input.isEmpty) {
                return "Name is required";
              }

              return null;
            },
          ),
        ),
        IntSelector(
          onChanged: (selected) => setState(() {
            sets = selected;
            userHasChangedForm = true;
          }),
          selected: sets,
          title: "Sets",
          subtitle: "Your workout items will be repeated in order once per set",
        ),
        if (sets > 1) const Divider(),
        if (sets > 1)
          DurationSelector(
            selectedMinutes: restBetweenSetsMinutes,
            selectedSeconds: restBetweenSetsSeconds,
            onMinutesChanged: (selected) => setState(() {
              restBetweenSetsMinutes = selected;
              userHasChangedForm = true;
            }),
            onSecondsChanged: (selected) => setState(() {
              restBetweenSetsSeconds = selected;
              userHasChangedForm = true;
            }),
            subtitle: "Rest can be added in between each set",
            title: "Rest Between Sets",
          ),
        const Divider(),
        IntSelector(
          onChanged: (selected) => setState(() {
            score = selected;
            userHasChangedForm = true;
          }),
          selected: score,
          title: "Score",
          subtitle:
              "Give your hangboard routine a difficulty score. This is used on charts.",
          stepCount: 15,
          stepSize: scoreStepSize,
        ),
        ListTile(
          title: const Text("Scoring System info"),
          trailing: TextButton(
            onPressed: Navigator.of(context).scoringSystemInfo,
            child: const Text("VIEW"),
          ),
        ),
      ],
    );
  }

  void onSubmit() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text("Name is required"),
        ),
      );
      return;
    }

    if (items.isEmpty) {
      tabController.animateTo(1);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text("Workout items cannot be empty"),
        ),
      );
      return;
    }

    final routine = HangboardRoutineModel(
      nameController.text.trim(),
      DateTime.now(),
      score,
      sets,
      restBetweenSetsMinutes,
      restBetweenSetsSeconds,
      items,
    );

    final confirm = await showHangboardRoutineDialog(
      context,
      hangboardRoutine: routine,
    );

    if (!confirm) {
      return;
    }

    Navigator.pop(context, routine);
  }
}
