import 'package:climb_logger/util/sentiment.dart';
import 'package:flutter/material.dart';

class MoodScoreIcon extends StatelessWidget {
  final double? score;

  Sentiment get sentiment => score != null
      ? Sentiment.values.elementAt((score! - 1).round())
      : Sentiment.good;

  const MoodScoreIcon({
    Key? key,
    required this.score,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          sentiment.icon,
          color: sentiment.color,
        ),
        Text(score?.toStringAsFixed(2) ?? "No data"),
      ],
    );
  }
}
