import 'package:climb_logger/charts/chart_scaffold.dart';
import 'package:climb_logger/theme/ui_constants.dart';
import 'package:climb_logger/util/example_csv_data.dart';
import 'package:flutter/material.dart';

class CsvExampleScreen extends StatefulWidget {
  const CsvExampleScreen({Key? key}) : super(key: key);

  @override
  State<CsvExampleScreen> createState() => CsvExampleScreenState();
}

class CsvExampleScreenState extends State<CsvExampleScreen> {
  @override
  Widget build(BuildContext context) {
    return ChartScaffold(
      appBar: AppBar(
        title: const Text("CSV Example"),
      ),
      body: buildExampleTable(),
    );
  }

  Widget buildExampleTable() {
    return Table(
      border: kTableBorder,
      children: [
        ...exampleCsv.map(
          (csvRow) => TableRow(
            children: csvRow
                .map((cell) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("$cell"),
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}
