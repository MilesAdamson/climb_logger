import 'package:flutter/material.dart';

class WidgetWithDate implements Comparable {
  final DateTime dateTime;
  final Widget widget;

  WidgetWithDate(this.dateTime, this.widget);

  @override
  int compareTo(other) {
    if (other is WidgetWithDate) {
      return other.dateTime.compareTo(dateTime);
    }

    return 0;
  }
}
