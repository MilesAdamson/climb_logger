import 'package:climb_logger/util/build_context_extensions.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

enum WallType { slab, vert, overhang, roof }

extension WallTypeExtensions on WallType {
  Color color(BuildContext context) {
    switch (this) {
      case WallType.slab:
        return context.bloc.state.settings.colorOne;
      case WallType.vert:
        return context.bloc.state.settings.colorTwo;
      case WallType.overhang:
        return context.bloc.state.settings.colorThree;
      case WallType.roof:
        return context.bloc.state.settings.colorFour;
    }
  }

  String get label {
    switch (this) {
      case WallType.slab:
        return "Slab";
      case WallType.vert:
        return "Vert";
      case WallType.overhang:
        return "Overhang";
      case WallType.roof:
        return "Roof";
    }
  }

  static WallType? tryParse(input) {
    final trimmed = "$input".toString().toLowerCase().trim();
    return WallType.values
        .firstWhereOrNull((type) => trimmed.contains(type.label.toLowerCase()));
  }
}
