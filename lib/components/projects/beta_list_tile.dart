import 'package:climb_logger/components/grade_icon.dart';
import 'package:climb_logger/components/state_builder.dart';
import 'package:climb_logger/models/beta_model.dart';
import 'package:flutter/material.dart';

class BetaListTile extends StatelessWidget {
  final List<BetaModel> beta;
  final BetaModel item;

  const BetaListTile({
    Key? key,
    required this.item,
    required this.beta,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StateBuilder(
      builder: (context, state) {
        return ListTile(
          leading: GradeIcon(
            gradeLabel: "${beta.indexOf(item) + 1}",
            color: state.settings.colorFour,
            size: 30,
          ),
          title: Text(
            item.beta,
          ),
        );
      },
    );
  }
}
