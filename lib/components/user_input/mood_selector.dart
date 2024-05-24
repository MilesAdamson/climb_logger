import 'package:climb_logger/util/sentiment.dart';
import 'package:flutter/material.dart';

class SentimentSelector extends StatelessWidget {
  final Sentiment? sentiment;
  final String title;
  final void Function(Sentiment? selected) onChanged;

  const SentimentSelector({
    Key? key,
    required this.sentiment,
    required this.onChanged,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 2.0,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: Sentiment.values
                .map(
                  (s) => IconButton(
                    iconSize: 35.0,
                    onPressed: () => onChanged(sentiment == s ? null : s),
                    icon: Icon(
                      s.icon,
                      color: sentiment == s ? s.color : null,
                    ),
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}
