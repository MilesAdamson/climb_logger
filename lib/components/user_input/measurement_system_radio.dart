import 'package:climb_logger/components/dialogs/confirm_dialog.dart';
import 'package:climb_logger/util/build_context_extensions.dart';
import 'package:climb_logger/util/measurement_system.dart';
import 'package:flutter/material.dart';

class MeasurementSystemRadio extends StatelessWidget {
  final MeasurementSystem measurementSystem;
  final void Function(MeasurementSystem climbType) onChanged;

  const MeasurementSystemRadio({
    Key? key,
    required this.measurementSystem,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...MeasurementSystem.values.map(
          (type) => Flexible(
            flex: 1,
            child: RadioListTile<MeasurementSystem>(
              title: Text(type.label),
              value: type,
              groupValue: measurementSystem,
              onChanged: (value) async {
                final anyHangboardEntries =
                    context.bloc.state.hangboardEntryDocList.isNotEmpty;

                if (anyHangboardEntries) {
                  final confirm = await showConfirmationDialog(
                    context,
                    title: 'Change measurement system?',
                    message: 'Hangboard charts only show data from entries '
                        'with the same measurement system. '
                        'It is best to use only one'
                        ' measurement system at a time.',
                  );

                  if (!confirm) {
                    return;
                  }
                }

                if (value != null) {
                  onChanged(value);
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
