import 'package:climb_logger/util/chart_y_axis_type.dart';

enum ChartType {
  scoreDaily,
  scoreCumulative,
  scatter,
  barAllTime,
  hardestOverTime,
  pieChartWallType,
  barChartWallType,
  barChartTags,
}

extension ChartTypeExtensions on ChartType {
  String get description {
    switch (this) {
      case ChartType.scoreDaily:
        return "Groups climbs and tallies their scores (from bouldering, sport and hangboarding).";
      case ChartType.scoreCumulative:
        return "Plots your score accumulating over time (from bouldering, sport and hangboarding).";
      case ChartType.scatter:
        return "View your ascents over time.";
      case ChartType.barAllTime:
        return "Plot how many climbs you redpointed, flashed and onsighted.";
      case ChartType.hardestOverTime:
        return "Gives a line chart showing your hardest ascents of each type over time.";
      case ChartType.pieChartWallType:
        return "A pie chart based on what wall types you climb.";
      case ChartType.barChartWallType:
        return "A bar chart of your best ascents on each wall type";
      case ChartType.barChartTags:
        return "A bar chart of your best ascents for each tag";
    }
  }

  String get label {
    switch (this) {
      case ChartType.scoreDaily:
        return "Score: Daily";
      case ChartType.scoreCumulative:
        return "Score: Cumulative";
      case ChartType.scatter:
        return "Scatter Plot";
      case ChartType.barAllTime:
        return "Bar Graph: All Time";
      case ChartType.hardestOverTime:
        return "Best Ascents";
      case ChartType.pieChartWallType:
        return "Pie Chart: Wall Type";
      case ChartType.barChartWallType:
        return "Bar Chart: Wall Type";
      case ChartType.barChartTags:
        return "Bar Chart: Tags";
    }
  }

  bool get shouldPromptForSettings {
    switch (this) {
      case ChartType.scatter:
      case ChartType.barAllTime:
      case ChartType.hardestOverTime:
      case ChartType.barChartWallType:
      case ChartType.barChartTags:
        return true;

      default:
        return false;
    }
  }

  List<ChartYAxisType> get availableYAxisTypes {
    switch (this) {
      case ChartType.scoreDaily:
      case ChartType.scoreCumulative:
        return [ChartYAxisType.score];

      case ChartType.scatter:
        return ChartYAxisType.values;

      case ChartType.barAllTime:
      case ChartType.hardestOverTime:
      case ChartType.barChartWallType:
      case ChartType.barChartTags:
        return [ChartYAxisType.bouldering, ChartYAxisType.sport];

      default:
        return [];
    }
  }
}
