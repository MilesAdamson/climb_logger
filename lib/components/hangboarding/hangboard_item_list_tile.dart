import 'package:climb_logger/components/grade_icon.dart';
import 'package:climb_logger/components/state_builder.dart';
import 'package:climb_logger/models/hangboard_item_model.dart';
import 'package:flutter/material.dart';

class HangboardItemListTile extends StatelessWidget {
  final List<HangboardItemModel> workout;
  final HangboardItemModel item;

  const HangboardItemListTile({
    Key? key,
    required this.item,
    required this.workout,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StateBuilder(builder: (context, state) {
      return Column(
        children: [
          if (item.isRestBetweenSets) const Divider(),
          ListTile(
            leading: GradeIcon(
              gradeLabel: "${workout.indexOf(item) + 1}",
              color: item.itemColor(state),
              size: 30,
            ),
            title: Text(
              item.fullName(),
            ),
            subtitle: Text(
              item.durationLabel,
            ),
          ),
          if (item.isRestBetweenSets) const Divider(),
        ],
      );
    });
  }
}
