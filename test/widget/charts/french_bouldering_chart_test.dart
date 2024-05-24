import 'package:climb_logger/models/chart_settings_model.dart';
import 'package:climb_logger/models/logbook_entry_model.dart';
import 'package:climb_logger/screens/charts/chart_screen.dart';
import 'package:climb_logger/state/app_state.dart';
import 'package:climb_logger/state/bloc.dart';
import 'package:climb_logger/util/ascent_type.dart';
import 'package:climb_logger/util/chart_type.dart';
import 'package:climb_logger/util/chart_y_axis_type.dart';
import 'package:climb_logger/util/climb_type.dart';
import 'package:climb_logger/util/grading_system.dart';
import 'package:climb_logger/util/wall_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../mocks.mocks.dart';

void main() {
  const gradingSystem = FrenchBoulderingSystem();

  final entries = gradingSystem.labels
      .map((gradeLabel) => LogbookEntryModel(
            DateTime(2020, 2, gradingSystem.labels.indexOf(gradeLabel)),
            "details",
            "climbName",
            gradeLabel,
            ClimbType.boulder,
            AscentType.values.elementAt(
                gradingSystem.labels.indexOf(gradeLabel) %
                    AscentType.values.length),
            [],
            WallType.values.elementAt(gradingSystem.labels.indexOf(gradeLabel) %
                WallType.values.length),
            null,
          ))
      .toList();

  final chartTypes = ChartType.values.where(
      (type) => type.availableYAxisTypes.contains(ChartYAxisType.bouldering));

  group("French Bouldering Charts", () {
    for (final chartType in chartTypes) {
      testWidgets(chartType.label, (tester) async {
        final bloc = MockBloc();
        when(bloc.state).thenReturn(AppState.initial());
        when(bloc.stream).thenAnswer((_) => const Stream.empty());

        final screen = MaterialApp(
          home: BlocProvider<AppStateBloc>(
            create: (context) => bloc,
            child: ChartScreen(
              args: ChartScreenArgs(
                chartType,
                ChartSettingsModel(true, true, true, true,
                    ChartYAxisType.bouldering, gradingSystem),
                entries,
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
