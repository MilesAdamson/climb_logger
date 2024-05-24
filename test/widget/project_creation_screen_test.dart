import 'package:climb_logger/components/user_input/grade_select.dart';
import 'package:climb_logger/components/user_input/tags_multi_select.dart';
import 'package:climb_logger/components/user_input/wall_type_radio.dart';
import 'package:climb_logger/models/project_model.dart';
import 'package:climb_logger/models/settings_model.dart';
import 'package:climb_logger/models/user_model.dart';
import 'package:climb_logger/screens/projects/project_creation_screen.dart';
import 'package:climb_logger/state/app_state.dart';
import 'package:climb_logger/util/climb_type.dart';
import 'package:climb_logger/util/wall_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../mocks.mocks.dart';
import '../test_util.dart';
import 'wrap_widget.dart';

void main() {
  group("$ProjectCreationScreen tests", () {
    group("Initial values from settings", () {
      for (final type in ClimbType.values) {
        testWidgets("Uses climb type of ${type.label} from settings",
            (tester) async {
          final bloc = MockBloc();
          final userDoc = MockUserDoc();
          final settings =
              SettingsModel.defaultValues().copyWith(climbType: type);
          final state = AppState.initial().copyWith(
            userDocument: userDoc,
          );

          when(userDoc.data()).thenReturn(UserModel.newUser().copyWith(
            settingsModel: settings,
          ));
          when(bloc.state).thenReturn(state);
          when(bloc.stream).thenAnswer((_) => const Stream.empty());

          final screen = wrapWidget(
            const ProjectCreationScreen(initialData: null),
            bloc: bloc,
          );

          await tester.pumpWidget(screen);
          final finder = find.byKey(const Key("GradeSelect"));
          expect(finder, findsOneWidget);
          final gradeSelect = tester.widget(finder) as GradeSelect;
          expect(gradeSelect.climbType, settings.climbType);
        });
      }

      for (final type in WallType.values) {
        testWidgets("Uses wall type of ${type.label} from settings",
            (tester) async {
          final bloc = MockBloc();
          final userDoc = MockUserDoc();
          final settings =
              SettingsModel.defaultValues().copyWith(wallType: type);
          final state = AppState.initial().copyWith(
            userDocument: userDoc,
          );

          when(userDoc.data()).thenReturn(UserModel.newUser().copyWith(
            settingsModel: settings,
          ));
          when(bloc.state).thenReturn(state);
          when(bloc.stream).thenAnswer((_) => const Stream.empty());

          final screen = wrapWidget(
            const ProjectCreationScreen(initialData: null),
            bloc: bloc,
          );

          await tester.pumpWidget(screen);
          final finder = find.byKey(const Key("WallTypeRadio"));
          expect(finder, findsOneWidget);
          final widget = tester.widget(finder) as WallTypeRadio;
          expect(widget.wallType, settings.wallType);
        });
      }
    });

    testWidgets("Populates from initial data", (tester) async {
      final bloc = MockBloc();

      when(bloc.state).thenReturn(AppState.initial());
      when(bloc.stream).thenAnswer((_) => const Stream.empty());

      final entry = ProjectModel(
        "V4",
        "name",
        ClimbType.boulder,
        WallType.roof,
        DateTime(2022),
        [],
        [SettingsModel.defaultTags.first],
        [],
      );

      final screen = wrapWidget(
        ProjectCreationScreen(initialData: entry),
        bloc: bloc,
      );

      await tester.pumpWidget(screen);

      final findGradeSelect = find.byKey(const Key("GradeSelect"));
      expect(findGradeSelect, findsOneWidget);
      final gradeSelect = tester.widget(findGradeSelect) as GradeSelect;
      expect(gradeSelect.selected, entry.gradeLabel);
      expect(gradeSelect.climbType, entry.climbType);

      final findWallTypeRadio = find.byKey(const Key("WallTypeRadio"));
      expect(findWallTypeRadio, findsOneWidget);
      final wallTypeRadio = tester.widget(findWallTypeRadio) as WallTypeRadio;
      expect(wallTypeRadio.wallType, entry.wallType);

      final tagsSelectFinder = find.byKey(const Key("TagsMultiSelect"));

      await scrollUntilFound(
        tester,
        tagsSelectFinder,
      );

      expect(tagsSelectFinder, findsOneWidget);
      final tagsSelector = tester.widget(tagsSelectFinder) as TagsMultiSelect;
      expect(tagsSelector.selected, entry.tags);
    });
  });
}
