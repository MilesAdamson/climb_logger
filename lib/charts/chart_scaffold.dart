import 'package:flutter/material.dart';

class ChartScaffold extends StatefulWidget {
  final PreferredSizeWidget appBar;
  final Widget body;

  const ChartScaffold({
    Key? key,
    required this.appBar,
    required this.body,
  }) : super(key: key);

  @override
  State<ChartScaffold> createState() => ChartScaffoldState();
}

class ChartScaffoldState extends State<ChartScaffold> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: OrientationBuilder(
        builder: (context, orientation) {
          return Scaffold(
            appBar: orientation == Orientation.portrait ? widget.appBar : null,
            body: Padding(
              padding: orientation == Orientation.portrait
                  ? EdgeInsets.zero
                  : const EdgeInsets.only(
                      right: 16.0,
                      top: 32.0,
                    ),
              child: widget.body,
            ),
          );
        },
      ),
    );
  }
}
