// ignore_for_file: invalid_annotation_target

import 'package:climb_logger/models/hangboard_entry_model.dart';
import 'package:climb_logger/models/logbook_entry_model.dart';
import 'package:climb_logger/util/ascent_type.dart';
import 'package:climb_logger/util/climb_type.dart';
import 'package:climb_logger/util/wall_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'filters_model.freezed.dart';

@freezed
class FiltersModel with _$FiltersModel {
  FiltersModel._();

  factory FiltersModel(
    bool showRedpoints,
    bool showFlashes,
    bool showOnsights,
    bool showProjects,
    bool showSportRoutes,
    bool showBoulders,
    List<String> tags,
    bool showSlab,
    bool showVert,
    bool showOverhang,
    bool showRoof,
    bool showHangboardEntries,
  ) = _FiltersModel;

  factory FiltersModel.showAll() {
    return FiltersModel(
      true,
      true,
      true,
      true,
      true,
      true,
      [],
      true,
      true,
      true,
      true,
      true,
    );
  }

  bool showHangboardEntry(HangboardEntryModel? hangboardEntry) {
    if (hangboardEntry == null) {
      return false;
    }

    if (!showHangboardEntries) {
      return false;
    }

    return true;
  }

  bool showLogbookEntry(LogbookEntryModel? logbookEntry) {
    if (logbookEntry == null) {
      return false;
    }

    if (!showRedpoints && logbookEntry.ascentType == AscentType.redpoint) {
      return false;
    }

    if (!showFlashes && logbookEntry.ascentType == AscentType.flash) {
      return false;
    }

    if (!showOnsights && logbookEntry.ascentType == AscentType.onsight) {
      return false;
    }

    if (!showProjects && logbookEntry.ascentType == AscentType.project) {
      return false;
    }

    if (!showSportRoutes && logbookEntry.climbType == ClimbType.sport) {
      return false;
    }

    if (!showBoulders && logbookEntry.climbType == ClimbType.boulder) {
      return false;
    }

    if (!showSlab && logbookEntry.wallType == WallType.slab) {
      return false;
    }

    if (!showVert && logbookEntry.wallType == WallType.vert) {
      return false;
    }

    if (!showOverhang && logbookEntry.wallType == WallType.overhang) {
      return false;
    }

    if (!showRoof && logbookEntry.wallType == WallType.roof) {
      return false;
    }

    if (tags.isNotEmpty) {
      return tags.every((tag) => logbookEntry.tags.contains(tag));
    }

    return true;
  }
}
