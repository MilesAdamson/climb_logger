import 'package:climb_logger/util/chart_y_axis_type.dart';
import 'package:flutter/material.dart';

class ChartYAxisTypeRadio extends StatelessWidget {
  final ChartYAxisType chartYAxisType;
  final void Function(ChartYAxisType climbType) onChanged;
  final List<ChartYAxisType> selectable;

  const ChartYAxisTypeRadio({
    Key? key,
    required this.chartYAxisType,
    required this.onChanged,
    required this.selectable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ...selectable.map(
          (type) => RadioListTile<ChartYAxisType>(
            title: Text(type.label),
            subtitle: type.subtitle != null ? Text(type.subtitle!) : null,
            value: type,
            groupValue: chartYAxisType,
            onChanged: (value) {
              if (value != null) {
                onChanged(value);
              }
            },
          ),
        ),
      ],
    );
  }
}
