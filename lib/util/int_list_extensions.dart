import 'dart:math';

extension IntListExtension on Iterable<int> {
  int maxOrDefault(int defaultValue) {
    if (isEmpty) {
      return defaultValue;
    }

    return reduce(max);
  }
}

extension DoubleListExtension on Iterable<double> {
  double maxOrDefault(double defaultValue) {
    if (isEmpty) {
      return defaultValue;
    }

    return reduce(max);
  }
}
