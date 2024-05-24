import 'dart:async';

import 'package:climb_logger/components/user_input/duration_selector.dart';
import 'package:climb_logger/components/user_input/size_select_list_tile.dart';
import 'package:climb_logger/models/hangboard_item_model.dart';
import 'package:climb_logger/routing/navigator_extensions.dart';
import 'package:climb_logger/theme/ui_constants.dart';
import 'package:climb_logger/util/build_context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

enum ItemType { rest, hang }

class HangboardItemCreationScreen extends StatefulWidget {
  final HangboardItemModel? initialData;

  const HangboardItemCreationScreen({
    Key? key,
    required this.initialData,
  }) : super(key: key);

  @override
  State<HangboardItemCreationScreen> createState() =>
      HangboardItemCreationScreenState();
}

class HangboardItemCreationScreenState
    extends State<HangboardItemCreationScreen> {
  late final StreamSubscription onMeasurementSystemChanged;

  String? modifier;
  String? size;
  late ItemType itemType = widget.initialData != null
      ? (widget.initialData!.isRest ? ItemType.rest : ItemType.hang)
      : ItemType.hang;
  String name = HangboardItemModel.itemNames[1];
  int selectedMinutes = 0;
  int selectedSeconds = 10;

  String get verb => widget.initialData != null ? "Edit" : "Add";

  HangboardItemModel get item => HangboardItemModel(
        itemType == ItemType.hang ? name : HangboardItemModel.restItemName,
        modifier,
        size,
        selectedSeconds,
        selectedMinutes,
        const Uuid().v4(),
        false,
      );

  @override
  void initState() {
    onMeasurementSystemChanged = context.bloc.stream
        .map((state) => state.useMetricSystem)
        .listen((useMetricSystem) {
      setState(() {
        size = null;
      });
    });

    final data = widget.initialData;
    if (data != null) {
      modifier = data.modifier;
      size = data.holdSize;
      name = data.name;
      selectedSeconds = data.seconds;
      selectedMinutes = data.minutes;
    }
    super.initState();
  }

  @override
  void dispose() {
    onMeasurementSystemChanged.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pop(context, item);
        },
        label: Text("$verb ${itemType == ItemType.hang ? "hang" : "rest"}"),
        icon: const Icon(Icons.check),
      ),
      appBar: AppBar(
        title: Text("$verb Hangboard Item"),
        actions: [
          IconButton(
            onPressed: Navigator.of(context).settings,
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: ListView(
        padding: kListViewPadding,
        children: [
          const ListTile(
            title: Text("Item Type"),
            subtitle: Text(
              "Items can either be a hang or a rest. "
              "For hangs, you will select what hold you are using."
              "\n\n"
              "Rest between sets will be added automatically.",
            ),
          ),
          RadioListTile<ItemType>(
            title: const Text("Hang"),
            value: ItemType.hang,
            groupValue: itemType,
            onChanged: (t) {
              if (t != null) {
                if (name == HangboardItemModel.restItemName) {
                  setState(() => name = HangboardItemModel.itemNames.first);
                }
                setState(() => itemType = t);
              }
            },
          ),
          RadioListTile<ItemType>(
            title: const Text("Rest"),
            subtitle: const Text(
              "Add a short rest in between hangs",
            ),
            value: ItemType.rest,
            groupValue: itemType,
            onChanged: (t) {
              if (t != null) {
                setState(() => itemType = t);
              }
            },
          ),
          const Divider(),
          DurationSelector(
            selectedMinutes: selectedMinutes,
            selectedSeconds: selectedSeconds,
            onMinutesChanged: (m) => setState(() => selectedMinutes = m),
            onSecondsChanged: (s) => setState(() => selectedSeconds = s),
            subtitle:
                "How long your ${itemType == ItemType.hang ? "hang" : "rest"} will last",
            title: "Duration",
          ),
          if (itemType == ItemType.hang) ...[
            const Divider(),
            SizeSelectListTile(
              size: size,
              onChanged: (s) => setState(() => size = s),
            ),
            ListTile(
              title: const Text("Hold Name"),
              trailing: DropdownButton<String>(
                onChanged: (s) => setState(() => name = s!),
                value: name,
                items: [
                  ...HangboardItemModel.itemNames.map(
                    (s) => DropdownMenuItem<String>(
                      value: s,
                      child: Text(s),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: const Text("Modifier"),
              trailing: DropdownButton<String?>(
                onChanged: (s) => setState(() => modifier = s),
                value: modifier,
                items: [
                  const DropdownMenuItem<String?>(
                    value: null,
                    child: Text("No Modifier"),
                  ),
                  ...HangboardItemModel.modifiers.map(
                    (s) => DropdownMenuItem<String?>(
                      value: s,
                      child: Text(s),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: const Text("Preview:"),
              trailing: Text(item.fullName()),
            ),
          ],
        ],
      ),
    );
  }
}
