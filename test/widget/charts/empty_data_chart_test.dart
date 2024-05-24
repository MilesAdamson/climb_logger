import 'package:climb_logger/models/chart_settings_model.dart';
import 'package:climb_logger/screens/charts/chart_screen.dart';
import 'package:climb_logger/state/app_state.dart';
import 'package:climb_logger/state/bloc.dart';
import 'package:climb_logger/util/chart_type.dart';
import 'package:climb_logger/util/chart_y_axis_type.dart';
import 'package:climb_logger/util/grading_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../mocks.mocks.dart';

void main() {
  for (final chartType in ChartType.values) {
    group("${chartType.label} with empty list of entries", () {
      for (final chartYAxisType in chartType.availableYAxisTypes) {
        testWidgets(chartYAxisType.label, (tester) async {
          final bloc = MockBloc();
          when(bloc.state).thenReturn(AppState.initial());
          when(bloc.stream).thenAnswer((_) => const Stream.empty());

          final screen = MaterialApp(
            home: BlocProvider<AppStateBloc>(
              create: (context) => bloc,
              child: ChartScreen(
                args: ChartScreenArgs(
                  chartType,
                  ChartSettingsModel(true, true, true, true, chartYAxisType,
                      const YosemiteSystem()),
                  [],
                ),
              ),
            ),
          );

          await tester.pumpWidget(screen);
          expect(find.byKey(Key(chartType.toString())), findsOneWidget);
        });
      }
    });
  }
}
