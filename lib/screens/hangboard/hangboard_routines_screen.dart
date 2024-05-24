import 'package:climb_logger/components/bottom_banner_ad.dart';
import 'package:climb_logger/components/dialogs/ad_dialog.dart';
import 'package:climb_logger/components/empty_state.dart';
import 'package:climb_logger/components/hangboarding/hangboard_routine_card.dart';
import 'package:climb_logger/components/state_builder.dart';
import 'package:climb_logger/routing/navigator_extensions.dart';
import 'package:climb_logger/theme/ui_constants.dart';
import 'package:climb_logger/util/build_context_extensions.dart';
import 'package:climb_logger/util/icons.dart';
import 'package:flutter/material.dart';

class HangboardRoutinesScreen extends StatelessWidget {
  const HangboardRoutinesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StateBuilder(
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: const BottomBannerAd(),
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              buildTemplatesButton(context),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: buildNewRoutineButton(context),
              ),
            ],
          ),
          appBar: AppBar(
            title: const Text("Hangboard Routines"),
          ),
          body: Builder(
            builder: (context) {
              final routines = state.sortedHangboardRoutineDocuments;

              if (routines.isEmpty) {
                return const Center(
                  child: EmptyState(
                    icon: kHangboardIcon,
                    title: "No Hangboard Routines",
                    description: "You don't have any hangboard routines yet. "
                        "Once you create one, you can use the workout timer to do it.\n\n"
                        "After completing the routine, a logbook entry will be added automatically. "
                        "You can also manually log hangboard routines as completed whenever you want.",
                  ),
                );
              }

              return ListView(
                padding: kListViewPadding,
                children: routines
                    .map((doc) => HangboardRoutineCard(
                          document: doc,
                          onPressed: () =>
                              Navigator.of(context).hangboardRoutine(doc.id),
                        ))
                    .toList(),
              );
            },
          ),
        );
      },
    );
  }

  FloatingActionButton buildTemplatesButton(BuildContext context) {
    return FloatingActionButton.extended(
      heroTag: null,
      onPressed: Navigator.of(context).hangboardTemplates,
      label: const Text("Templates"),
      icon: const Icon(Icons.build),
    );
  }

  FloatingActionButton buildNewRoutineButton(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () async {
        final canContinue = await showInterstitialAd(
          context,
          "Creating a hangboard routine requires watching an ad. "
          "But don't worry - starting a workout does not",
        );

        if (!canContinue) {
          return;
        }

        final routine = await Navigator.of(context).hangboardRoutineCreation();

        if (routine != null) {
          final id = await context.createHangboardRoutine(routine);
          Navigator.of(context).hangboardRoutine(id);
        }
      },
      label: const Text("New routine"),
      icon: const Icon(Icons.add),
    );
  }
}
