import 'package:climb_logger/models/objective_model.dart';
import 'package:climb_logger/util/ascent_type.dart';
import 'package:flutter/material.dart';

class ObjectiveListTile extends StatelessWidget {
  final ObjectiveModel objective;

  const ObjectiveListTile({Key? key, required this.objective})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        objective.title,
        style: TextStyle(
          decoration: objective.isCompleted ? TextDecoration.lineThrough : null,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (objective.subtitle != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: Text(objective.subtitle!),
            ),
          LinearProgressIndicator(
            value: objective.progress,
            valueColor: AlwaysStoppedAnimation<Color>(
                objective.ascentType.color(context)),
          ),
        ],
      ),
      trailing: Text("${objective.countCompleted} / ${objective.targetCount}"),
    );
  }
}
