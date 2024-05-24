import 'package:climb_logger/components/action_list_tiles/new_goal_list_tile.dart';
import 'package:climb_logger/components/action_list_tiles/new_hangboard_routine_list_tile.dart';
import 'package:climb_logger/components/action_list_tiles/new_logbook_entry_list_tile.dart';
import 'package:climb_logger/components/action_list_tiles/new_project_list_tile.dart';
import 'package:climb_logger/components/action_list_tiles/project_attempt_list_tile.dart';
import 'package:climb_logger/components/action_list_tiles/project_sent_list_tile.dart';
import 'package:climb_logger/components/action_list_tiles/start_hangboard_routine_list_tile.dart';
import 'package:climb_logger/components/action_list_tiles/template_select_list_tile.dart';
import 'package:climb_logger/components/action_list_tiles/view_hangboard_routines_list_tile.dart';
import 'package:climb_logger/components/bottom_sheets/bottom_sheet_heading.dart';
import 'package:climb_logger/components/state_builder.dart';
import 'package:climb_logger/theme/ui_constants.dart';
import 'package:climb_logger/util/project_view_model.dart';
import 'package:flutter/material.dart';

Future<void> showHomeScreenBottomSheet(BuildContext context) async {
  return showModalBottomSheet(
    isDismissible: true,
    isScrollControlled: true,
    clipBehavior: Clip.antiAlias,
    shape: BottomSheetHeading.sheetShape,
    context: context,
    builder: (context) => const HomeScreenBottomSheet(),
  );
}

class HomeScreenBottomSheet extends StatelessWidget {
  const HomeScreenBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StateBuilder(builder: (context, state) {
      final projectViewModels = state.projectDocList
          .map((doc) => ProjectViewModel.fromState(doc.id, state));

      final incompleteProjects =
          projectViewModels.where((vm) => !vm.projectIsCompleted).toList();

      final showProjectListTiles = incompleteProjects.isNotEmpty;

      final showStartHangboard = state.hangboardRoutineDocList.isNotEmpty;

      return SizedBox(
        height: bottomSheetHeight(context),
        child: DraggableScrollableSheet(
          maxChildSize: 1,
          minChildSize: 1,
          initialChildSize: 1,
          expand: true,
          builder: (context, _) {
            return Material(
              color: Colors.grey[900],
              child: Column(
                children: [
                  const BottomSheetHeading(
                    title: "Menu",
                  ),
                  Expanded(
                    child: ListView(
                      padding: kListViewPadding,
                      children: [
                        const NewLogbookEntryListTile(),
                        const NewGoalListTile(),
                        const Divider(),
                        const NewHangboardRoutineListTile(),
                        const TemplateSelectListTile(),
                        if (showStartHangboard)
                          const StartHangboardRoutineListTile(),
                        const ViewHangboardRoutinesListTile(),
                        const Divider(),
                        const NewProjectListTile(),
                        if (showProjectListTiles)
                          ProjectAttemptListTile(
                            incompleteProjects: incompleteProjects,
                          ),
                        if (showProjectListTiles)
                          ProjectSentListTile(
                            incompleteProjects: incompleteProjects,
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
    });
  }
}
