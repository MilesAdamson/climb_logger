enum HangboardPlotType { holdName, holdSize }

extension HangboardPlotTypeExtensions on HangboardPlotType {
  String get xAxisLabel {
    switch (this) {
      case HangboardPlotType.holdName:
        return "Hold";
      case HangboardPlotType.holdSize:
        return "Hold Size";
    }
  }
}
