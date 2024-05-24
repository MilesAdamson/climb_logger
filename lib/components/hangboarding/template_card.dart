import 'package:climb_logger/components/dialogs/ad_dialog.dart';
import 'package:climb_logger/components/dialogs/confirm_hangboard_routine_dialog.dart';
import 'package:climb_logger/hangboard_templates/hangboard_templates.dart';
import 'package:climb_logger/models/hangboard_routine_model.dart';
import 'package:climb_logger/routing/navigator_extensions.dart';
import 'package:climb_logger/state/events.dart';
import 'package:climb_logger/theme/ui_constants.dart';
import 'package:climb_logger/util/build_context_extensions.dart';
import 'package:flutter/material.dart';

class TemplateCard extends StatefulWidget {
  final HangboardTemplate template;

  const TemplateCard({
    Key? key,
    required this.template,
  }) : super(key: key);

  @override
  State<TemplateCard> createState() => TemplateCardState();
}

class TemplateCardState extends State<TemplateCard> {
  HangboardRoutineModel get routine => widget.template.build();

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        unselectedWidgetColor: Colors.blue,
        dividerColor: Colors.transparent,
      ),
      child: Padding(
        padding: kCardOutsidePadding,
        child: Card(
          child: InkWell(
            onTap: () async {
              final canContinue = await showInterstitialAd(
                context,
                "Creating a hangboard routine requires watching an ad. "
                "But don't worry - starting a workout does not",
              );

              if (!canContinue) {
                return;
              }

              final routine = await Navigator.of(context)
                  .hangboardRoutineCreation(
                      initialData: widget.template.build());

              if (routine != null) {
                context.bloc.add(CreateHangboardRoutineEvent(routine));
                Navigator.of(context).hangboardRoutines();
              }
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Text(
                      widget.template.templateName,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(widget.template.goalStatement),
                  ),
                  ListTile(
                    title: Text(
                      "${routine.sets} set${routine.sets == 1 ? "" : "s"}. ${routine.totalDurationLabel}",
                    ),
                    trailing: TextButton(
                      child: const Text("PREVIEW"),
                      onPressed: () {
                        showHangboardRoutineDialog(
                          context,
                          hangboardRoutine: routine,
                          previewMode: true,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
