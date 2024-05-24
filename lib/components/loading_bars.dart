import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class LoadingBars extends StatelessWidget {
  final double size;

  const LoadingBars({
    Key? key,
    this.size = 100.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: const LoadingIndicator(
        indicatorType: Indicator.lineScale,
        colors: [
          Colors.red,
          Colors.orange,
          Colors.yellow,
          Colors.green,
          Colors.blue,
        ],
      ),
    );
  }
}
