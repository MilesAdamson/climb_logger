import 'package:climb_logger/components/grade_icon.dart';
import 'package:climb_logger/models/hangboard_entry_model.dart';
import 'package:climb_logger/util/build_context_extensions.dart';
import 'package:climb_logger/util/icons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HangboardEntryListTile extends StatelessWidget {
  final DocumentSnapshot<HangboardEntryModel> document;
  final VoidCallback? onPressed;

  const HangboardEntryListTile({
    Key? key,
    required this.document,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hangboardEntry = document.data();

    if (hangboardEntry == null) {
      return const SizedBox.shrink();
    }

    return Hero(
      tag: document.id,
      child: Material(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: ListTile(
          trailing: hangboardEntry.score > 0
              ? Text(hangboardEntry.score.toString())
              : null,
          onTap: onPressed,
          title: Text(hangboardEntry.title),
          subtitle: Text(hangboardEntry.dateSubtitle),
          leading: Stack(
            children: [
              GradeIcon(
                color: context.bloc.state.settings.colorFive,
                gradeLabel: "",
              ),
              const Positioned(
                top: 10.0,
                left: 10.0,
                child: Icon(kHangboardIcon),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
