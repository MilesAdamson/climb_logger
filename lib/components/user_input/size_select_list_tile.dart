import 'package:climb_logger/components/state_builder.dart';
import 'package:climb_logger/models/hangboard_item_model.dart';
import 'package:flutter/material.dart';

class SizeSelectListTile extends StatelessWidget {
  final String? size;
  final void Function(String? selected) onChanged;

  const SizeSelectListTile({
    Key? key,
    required this.size,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StateBuilder(builder: (context, state) {
      final metricItems = HangboardItemModel.holdSizesMetric.map(
        (s) => DropdownMenuItem<String?>(
          value: s,
          child: Text(s),
        ),
      );

      final imperialItems = HangboardItemModel.holdSizesImperial.map(
        (s) => DropdownMenuItem<String?>(
          value: s,
          child: Text(s),
        ),
      );

      String? selectedValue = size;

      if (state.useMetricSystem &&
          !HangboardItemModel.holdSizesMetric.contains(selectedValue)) {
        selectedValue = null;
      } else if (!state.useMetricSystem &&
          !HangboardItemModel.holdSizesImperial.contains(selectedValue)) {
        selectedValue = null;
      }

      return ListTile(
        title: const Text("Size"),
        subtitle: const Text(
          "Change between metric and imperial in the settings.",
        ),
        trailing: DropdownButton<String?>(
          onChanged: onChanged,
          value: selectedValue,
          items: [
            const DropdownMenuItem<String?>(
              value: null,
              child: Text("Unspecified"),
            ),
            if (state.useMetricSystem) ...metricItems else ...imperialItems,
          ],
        ),
      );
    });
  }
}
