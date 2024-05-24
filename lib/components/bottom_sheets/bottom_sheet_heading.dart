import 'package:flutter/material.dart';

class BottomSheetHeading extends StatelessWidget {
  static const sheetShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(
      top: Radius.circular(16.0),
    ),
  );

  final VoidCallback? onAccept;
  final String title;

  const BottomSheetHeading({
    Key? key,
    required this.title,
    this.onAccept,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(title),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          if (onAccept != null)
            IconButton(
              onPressed: onAccept,
              icon: const Icon(Icons.check),
            ),
        ],
      ),
    );
  }
}
