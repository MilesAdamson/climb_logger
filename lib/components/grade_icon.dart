import 'package:flutter/material.dart';

class GradeIcon extends StatelessWidget {
  static const defaultSize = 40.0;
  static const defaultBorderSize = 3.0;

  final String gradeLabel;
  final Color color;
  final VoidCallback? onPressed;
  final double size;
  final double borderSize;

  const GradeIcon({
    Key? key,
    required this.gradeLabel,
    required this.color,
    this.onPressed,
    this.size = defaultSize,
    this.borderSize = defaultBorderSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: Padding(
        padding: EdgeInsets.all(borderSize),
        child: Material(
          shape: const CircleBorder(),
          child: Ink(
            decoration: const BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
            height: size,
            width: size,
            child: InkWell(
              borderRadius: const BorderRadius.all(Radius.circular(100)),
              onTap: onPressed,
              child: Center(
                child: Text(
                  gradeLabel,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
