import 'package:climb_logger/models/hangboard_routine_model.dart';
import 'package:climb_logger/theme/ui_constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HangboardRoutineCard extends StatelessWidget {
  final DocumentSnapshot<HangboardRoutineModel> document;
  final VoidCallback? onPressed;

  const HangboardRoutineCard({
    Key? key,
    required this.document,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routine = document.data();

    if (routine == null) return const SizedBox.shrink();

    return Hero(
      tag: document.id,
      child: Padding(
        padding: kCardOutsidePadding,
        child: Card(
          child: InkWell(
            onTap: onPressed,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ListTile(
                  title: Text(
                    routine.name,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  trailing: Text(routine.trailingLabel),
                  subtitle: Text(routine.totalDurationLabel),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0, left: 16.0),
                  child: Text(
                    routine.subtitle,
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          color: Theme.of(context).textTheme.caption?.color,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
