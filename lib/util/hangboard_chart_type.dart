enum HangboardChartType {
  pieChartHangboardHoldType,
  barChartHoldName,
  barChartHoldSize,
  bestHangHoldSize,
}

extension HangboardChartTypeExtensions on HangboardChartType {
  String get description {
    switch (this) {
      case HangboardChartType.pieChartHangboardHoldType:
        return "A pie chart from the total hang duration on each hangboard hold type";
      case HangboardChartType.barChartHoldName:
        return "A bar chart from the total hang duration on each hangboard hold type";
      case HangboardChartType.barChartHoldSize:
        return "A bar chart from the total hang duration on each hangboard hold size";
      case HangboardChartType.bestHangHoldSize:
        return "Charts your longest hang on a selected hold size";
    }
  }

  String get label {
    switch (this) {
      case HangboardChartType.pieChartHangboardHoldType:
        return "Pie Chart: Hangboard Hold Type";
      case HangboardChartType.barChartHoldName:
        return "Bar Chart: Hangboard Hold Type";
      case HangboardChartType.barChartHoldSize:
        return "Bar Chart: Hangboard Hold Size";
      case HangboardChartType.bestHangHoldSize:
        return "Best Hang: Hangboard Hold Size";
    }
  }

  bool get shouldPromptForHoldSizes {
    switch (this) {
      case HangboardChartType.bestHangHoldSize:
        return true;

      default:
        return false;
    }
  }
}
