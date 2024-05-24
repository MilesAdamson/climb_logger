import 'package:climb_logger/components/bottom_sheets/bottom_sheet_heading.dart';
import 'package:climb_logger/components/state_builder.dart';
import 'package:climb_logger/components/user_input/tags_multi_select.dart';
import 'package:climb_logger/models/filters_model.dart';
import 'package:climb_logger/state/events.dart';
import 'package:climb_logger/theme/ui_constants.dart';
import 'package:climb_logger/util/build_context_extensions.dart';
import 'package:flutter/material.dart';

void showFiltersBottomSheet(BuildContext context) async {
  showModalBottomSheet(
    isDismissible: true,
    isScrollControlled: true,
    clipBehavior: Clip.antiAlias,
    shape: BottomSheetHeading.sheetShape,
    context: context,
    builder: (context) => const FiltersBottomSheet(),
  );
}

class FiltersBottomSheet extends StatefulWidget {
  const FiltersBottomSheet({Key? key}) : super(key: key);

  @override
  State<FiltersBottomSheet> createState() => FiltersBottomSheetState();
}

class FiltersBottomSheetState extends State<FiltersBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return StateBuilder(builder: (context, state) {
      final filters = state.filters;
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
                  BottomSheetHeading(
                    title: "Filter (${state.filteredLogbookLength} results)",
                  ),
                  Expanded(
                    child: ListView(
                      padding: kListViewPadding,
                      children: [
                        ListTile(
                          title: const Text("Reset filters"),
                          subtitle:
                              const Text("Tap to show all logbook entries"),
                          onTap: () {
                            context.bloc.add(
                                ModifyFiltersEvent(FiltersModel.showAll()));
                          },
                          trailing: const Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: Icon(Icons.refresh),
                          ),
                        ),
                        const Divider(),
                        CheckboxListTile(
                          title: const Text("Show boulders"),
                          value: filters.showBoulders,
                          onChanged: (isChecked) {
                            context.bloc.add(ModifyFiltersEvent(
                                filters.copyWith(showBoulders: isChecked!)));
                          },
                        ),
                        CheckboxListTile(
                          title: const Text("Show sport climbs"),
                          value: filters.showSportRoutes,
                          onChanged: (isChecked) {
                            context.bloc.add(ModifyFiltersEvent(
                                filters.copyWith(showSportRoutes: isChecked!)));
                          },
                        ),
                        CheckboxListTile(
                          title: const Text("Show hangboard workouts"),
                          value: filters.showHangboardEntries,
                          onChanged: (isChecked) {
                            context.bloc.add(ModifyFiltersEvent(filters
                                .copyWith(showHangboardEntries: isChecked!)));
                          },
                        ),
                        const Divider(),
                        CheckboxListTile(
                          title: const Text("Show redpoints"),
                          value: filters.showRedpoints,
                          onChanged: (isChecked) {
                            context.bloc.add(ModifyFiltersEvent(
                                filters.copyWith(showRedpoints: isChecked!)));
                          },
                        ),
                        CheckboxListTile(
                          title: const Text("Show flashes"),
                          value: filters.showFlashes,
                          onChanged: (isChecked) {
                            context.bloc.add(ModifyFiltersEvent(
                                filters.copyWith(showFlashes: isChecked!)));
                          },
                        ),
                        CheckboxListTile(
                          title: const Text("Show onsights"),
                          value: filters.showOnsights,
                          onChanged: (isChecked) {
                            context.bloc.add(ModifyFiltersEvent(
                                filters.copyWith(showOnsights: isChecked!)));
                          },
                        ),
                        CheckboxListTile(
                          title: const Text("Show projects"),
                          value: filters.showOnsights,
                          onChanged: (isChecked) {
                            context.bloc.add(ModifyFiltersEvent(
                                filters.copyWith(showProjects: isChecked!)));
                          },
                        ),
                        const Divider(),
                        CheckboxListTile(
                          title: const Text("Show slabs"),
                          value: filters.showSlab,
                          onChanged: (isChecked) {
                            context.bloc.add(ModifyFiltersEvent(
                                filters.copyWith(showSlab: isChecked!)));
                          },
                        ),
                        CheckboxListTile(
                          title: const Text("Show vert climbs"),
                          value: filters.showVert,
                          onChanged: (isChecked) {
                            context.bloc.add(ModifyFiltersEvent(
                                filters.copyWith(showVert: isChecked!)));
                          },
                        ),
                        CheckboxListTile(
                          title: const Text("Show overhangs"),
                          value: filters.showOverhang,
                          onChanged: (isChecked) {
                            context.bloc.add(ModifyFiltersEvent(
                                filters.copyWith(showOverhang: isChecked!)));
                          },
                        ),
                        CheckboxListTile(
                          title: const Text("Show roofs"),
                          value: filters.showRoof,
                          onChanged: (isChecked) {
                            context.bloc.add(ModifyFiltersEvent(
                                filters.copyWith(showRoof: isChecked!)));
                          },
                        ),
                        const Divider(),
                        const ListTile(
                          title: Text("Tags"),
                          subtitle: Text("If you select any tags, the logbook "
                              "entries displayed will match all of them."),
                        ),
                        TagsMultiSelect(
                          ascentType: null,
                          selected: filters.tags,
                          onChanged: (tags) {
                            context.bloc.add(ModifyFiltersEvent(
                                filters.copyWith(tags: tags)));
                          },
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
