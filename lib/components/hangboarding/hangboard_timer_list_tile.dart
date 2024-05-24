import 'package:climb_logger/components/state_builder.dart';
import 'package:climb_logger/models/hangboard_item_model.dart';
import 'package:climb_logger/theme/ui_constants.dart';
import 'package:flutter/material.dart';

class HangboardTimerListTile extends StatelessWidget {
  final HangboardItemModel item;
  final bool isBig;
  final bool isColored;

  const HangboardTimerListTile({
    Key? key,
    required this.item,
    required this.isBig,
    required this.isColored,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StateBuilder(builder: (context, state) {
      final color = item.itemColor(state);
      final textStyle = isBig
          ? Theme.of(context).textTheme.headline2!
          : Theme.of(context).textTheme.headline6!;

      final colored = textStyle.copyWith(
        color: isColored ? color : null,
      );

      return Column(
        children: [
          if (item.isRestBetweenSets) const Divider(),
          Container(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: AnimatedDefaultTextStyle(
                duration: kTimerAnimationDuration,
                style: colored,
                child: Text(
                  item.fullName(useNewline: true),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          if (item.isRestBetweenSets) const Divider(),
        ],
      );
    });
  }
}
