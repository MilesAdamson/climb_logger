import 'package:climb_logger/util/build_context_extensions.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

enum AscentType { redpoint, flash, onsight, project }

final completeAscentTypes =
    AscentType.values.where((a) => a.isCompleteAscent).toList();

extension AscentTypeExtensions on AscentType {
  Color color(BuildContext context) {
    switch (this) {
      case AscentType.redpoint:
        return context.bloc.state.settings.colorOne;
      case AscentType.flash:
        return context.bloc.state.settings.colorTwo;
      case AscentType.onsight:
        return context.bloc.state.settings.colorThree;
      case AscentType.project:
        return context.bloc.state.settings.colorFour;
    }
  }

  String get label {
    switch (this) {
      case AscentType.redpoint:
        return "Redpoint";
      case AscentType.flash:
        return "Flash";
      case AscentType.onsight:
        return "Onsight";
      case AscentType.project:
        return "Project";
    }
  }

  String get pluralLabel {
    switch (this) {
      case AscentType.redpoint:
        return "Redpoints";
      case AscentType.flash:
        return "Flashes";
      case AscentType.onsight:
        return "Onsights";
      case AscentType.project:
        return "Projects";
    }
  }

  String get pastTenseLabel {
    switch (this) {
      case AscentType.redpoint:
        return "Redpointed";
      case AscentType.flash:
        return "Flashed";
      case AscentType.onsight:
        return "Onsighted";
      case AscentType.project:
        return "Projected";
    }
  }

  String get attemptSelectionSubtitle {
    switch (this) {
      case AscentType.redpoint:
        return "Redpoint: sent after multiple attempts";
      case AscentType.flash:
        return "Flash: first try with beta";
      case AscentType.onsight:
        return "Onsight: first try with no beta";
      case AscentType.project:
        return "Project: haven't sent yet";
    }
  }

  bool get allowsAttempts {
    switch (this) {
      case AscentType.redpoint:
      case AscentType.project:
        return true;
      default:
        return false;
    }
  }

  static AscentType? tryParse(input) {
    final trimmed = "$input".toString().toLowerCase().trim();
    return AscentType.values
        .firstWhereOrNull((type) => trimmed.contains(type.label.toLowerCase()));
  }

  bool get isCompleteAscent {
    switch (this) {
      case AscentType.redpoint:
      case AscentType.flash:
      case AscentType.onsight:
        return true;
      default:
        return false;
    }
  }
}
