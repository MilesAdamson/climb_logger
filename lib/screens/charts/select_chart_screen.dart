import 'package:climb_logger/charts/climbing_charts_tab.dart';
import 'package:climb_logger/charts/hangboard_charts_tab.dart';
import 'package:climb_logger/routing/navigator_extensions.dart';
import 'package:climb_logger/state/events.dart';
import 'package:climb_logger/util/build_context_extensions.dart';
import 'package:flutter/material.dart';

class SelectChartScreen extends StatefulWidget {
  const SelectChartScreen({Key? key}) : super(key: key);

  @override
  State<SelectChartScreen> createState() => _SelectChartScreenState();
}

class _SelectChartScreenState extends State<SelectChartScreen> {
  @override
  void initState() {
    context.bloc.add(LoadAllLogbooksEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Select Chart"),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Text("Climbing")),
              Tab(icon: Text("Hangboarding")),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: Navigator.of(context).settings,
            ),
          ],
        ),
        body: const TabBarView(
          children: [
            ClimbingChartsTab(),
            HangboardChartsTab(),
          ],
        ),
      ),
    );
  }
}
