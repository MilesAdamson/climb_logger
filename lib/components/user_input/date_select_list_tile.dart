import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateSelectListTile extends StatelessWidget {
  final DateTime? selectedDate;
  final void Function(DateTime dateTime) onSelected;
  final String subtitle;
  final String? title;

  String get listTileTitle =>
      selectedDate != null ? DateFormat.MMMd().format(selectedDate!) : title!;

  DateSelectListTile({
    Key? key,
    required this.selectedDate,
    required this.onSelected,
    required this.subtitle,
    this.title,
  }) : super(key: key) {
    assert(title != null || selectedDate != null,
        "Provider either a selectedDate or a title");
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(listTileTitle),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.date_range),
      onTap: () async {
        final selected = await showDatePicker(
          firstDate: DateTime(1900),
          initialDate: selectedDate ?? DateTime.now(),
          lastDate: DateTime(2200),
          context: context,
        );

        if (selected != null) {
          onSelected(selected);
        }
      },
    );
  }
}
