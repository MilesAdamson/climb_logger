import 'package:flutter/material.dart';

class TagChip extends StatelessWidget {
  static const size = 40.0;

  final String tag;
  final Color color;
  final VoidCallback? onPressed;

  const TagChip({
    Key? key,
    required this.tag,
    required this.color,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: Text(tag),
      style: OutlinedButton.styleFrom(
        side: BorderSide(
          color: color,
          width: 2.0,
          style: BorderStyle.solid,
        ),
      ),
    );
  }
}
