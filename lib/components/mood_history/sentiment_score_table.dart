import 'package:climb_logger/theme/ui_constants.dart';
import 'package:climb_logger/util/sentiment.dart';
import 'package:climb_logger/util/sentiment_calculator.dart';
import 'package:flutter/material.dart';

class SentimentScoreTable extends StatelessWidget {
  final String title;
  final SentimentMapper mapper;
  final SentimentCalculator calculator;

  const SentimentScoreTable({
    Key? key,
    required this.title,
    required this.mapper,
    required this.calculator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: Text(
            title,
            style: Theme.of(context).textTheme.headline6,
          ),
          subtitle: Text(
            "The average score of all logbook entries, "
            "grouped by your rating for ${title.toLowerCase()} that day",
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Table(
            border: kTableBorder,
            children: Sentiment.values.reversed
                .map(
                  (s) => TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          s.icon,
                          color: s.color,
                        ),
                      ),
                      buildText(s)
                    ],
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }

  Widget buildText(Sentiment s) {
    final value =
        calculator.averageScoreFromSentiment(mapper)[s]?.round().toString();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        value ?? "No data",
      ),
    );
  }
}
