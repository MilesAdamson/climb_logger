import 'package:climb_logger/components/bottom_sheets/bottom_sheet_heading.dart';
import 'package:climb_logger/theme/ui_constants.dart';
import 'package:flutter/material.dart';

Future<String?> showEditNotesBottomSheet(
  BuildContext context,
  String? existingNotes, {
  String title = "Add notes",
}) {
  return showModalBottomSheet<String?>(
    isDismissible: true,
    isScrollControlled: true,
    clipBehavior: Clip.antiAlias,
    shape: BottomSheetHeading.sheetShape,
    context: context,
    builder: (context) => AddNotesBottomSheet(
      initialNotes: existingNotes,
      title: title,
    ),
  );
}

class AddNotesBottomSheet extends StatefulWidget {
  final String? initialNotes;
  final String title;

  const AddNotesBottomSheet({
    Key? key,
    required this.initialNotes,
    required this.title,
  }) : super(key: key);

  @override
  State<AddNotesBottomSheet> createState() => AddNotesBottomSheetState();
}

class AddNotesBottomSheetState extends State<AddNotesBottomSheet> {
  late final controller =
      TextEditingController(text: widget.initialNotes ?? "");

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: bottomSheetHeight(context),
      child: DraggableScrollableSheet(
        maxChildSize: 1,
        minChildSize: 1,
        initialChildSize: 1,
        expand: true,
        builder: (context, _) {
          return Material(
            color: Colors.grey[900],
            child: Column(
              children: [
                BottomSheetHeading(
                  title: widget.title,
                  onAccept: () {
                    final notes = controller.text.trim();
                    if (notes.isNotEmpty) {
                      Navigator.pop<String>(context, controller.text.trim());
                    } else {
                      Navigator.pop<String>(context, null);
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    autofocus: true,
                    textCapitalization: TextCapitalization.sentences,
                    controller: controller,
                    maxLines: 10,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
