enum ChartYAxisType { bouldering, sport, score }

extension ChartYAxisTypeExtensions on ChartYAxisType {
  String get label {
    switch (this) {
      case ChartYAxisType.bouldering:
        return "Bouldering grades";
      case ChartYAxisType.sport:
        return "Sport grades";
      case ChartYAxisType.score:
        return "Score";
    }
  }

  String? get subtitle {
    if (this == ChartYAxisType.score) {
      return "Plots both routes and boulders";
    }

    return null;
  }
}
