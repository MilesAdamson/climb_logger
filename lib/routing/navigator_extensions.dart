import 'package:climb_logger/models/beta_model.dart';
import 'package:climb_logger/models/chart_settings_model.dart';
import 'package:climb_logger/models/goal_model.dart';
import 'package:climb_logger/models/hangboard_chart_settings_model.dart';
import 'package:climb_logger/models/hangboard_entry_model.dart';
import 'package:climb_logger/models/hangboard_item_model.dart';
import 'package:climb_logger/models/hangboard_routine_model.dart';
import 'package:climb_logger/models/logbook_entry_model.dart';
import 'package:climb_logger/models/project_model.dart';
import 'package:climb_logger/routing/app_navigator.dart';
import 'package:climb_logger/screens/charts/chart_screen.dart';
import 'package:climb_logger/screens/charts/hangboard_chart_screen.dart';
import 'package:climb_logger/screens/projects/create_logbook_for_project_screen.dart';
import 'package:climb_logger/util/ascent_type.dart';
import 'package:climb_logger/util/chart_type.dart';
import 'package:climb_logger/util/date_time_extensions.dart';
import 'package:climb_logger/util/hangboard_chart_type.dart';
import 'package:flutter/material.dart';

extension NavigatorExtensions on NavigatorState {
  Future<void> splash() => pushNamed(AppNavigator.splash);

  Future<void> home() =>
      pushNamedAndRemoveUntil(AppNavigator.home, (route) => false);

  Future<void> login() =>
      pushNamedAndRemoveUntil(AppNavigator.login, (route) => false);

  Future<void> logbookEntry(String logbookEntryId) =>
      pushNamed(AppNavigator.logbookEntry, arguments: logbookEntryId);

  Future<void> whatsNewInVersion(String version) =>
      pushNamed(AppNavigator.newVersionRoute, arguments: version);

  Future<void> hangboardRoutine(String hangboardRoutineId) =>
      pushNamed(AppNavigator.hangboardRoutine, arguments: hangboardRoutineId);

  Future<void> hangboardEntry(String hangboardEntryId) =>
      pushNamed(AppNavigator.hangboardEntry, arguments: hangboardEntryId);

  Future<void> project(String projectId) =>
      pushNamed(AppNavigator.project, arguments: projectId);

  Future<void> csvImportPreview(List<LogbookEntryModel> entries) =>
      pushNamed(AppNavigator.csvPreview, arguments: entries);

  Future<void> moodCalendar() => pushNamed(AppNavigator.moodCalendarRoute);

  Future<void> trainingNotes(DateTime dateTime) => pushNamed(
        AppNavigator.daySummaryRoute,
        arguments: dateTime.truncate(),
      );

  Future<void> goal(String goalId) =>
      pushNamed(AppNavigator.goal, arguments: goalId);

  Future<List<BetaModel>?> projectBeta(List<BetaModel> beta) =>
      pushNamed<List<BetaModel>>(AppNavigator.projectBeta, arguments: beta);

  Future<void> buildChart() => pushNamed(AppNavigator.selectChart);

  Future<void> moodHistory() => pushNamed(AppNavigator.historyRoute);

  Future<void> csvImport() => pushNamed(AppNavigator.csvImport);

  Future<void> hangboardRoutines() => pushNamed(AppNavigator.hangboardRoutines);

  Future<void> csvExample() => pushNamed(AppNavigator.csvExample);

  Future<void> settings() => pushNamed(AppNavigator.settings);

  Future<void> stats() => pushNamed(AppNavigator.stats);

  Future<void> tags() => pushNamed(AppNavigator.tags);

  Future<void> hangboardTemplates() =>
      pushNamed(AppNavigator.hangboardTemplateSelect);

  Future<void> scoringSystemInfo() => pushNamed(AppNavigator.scoringInfo);

  Future<void> chart(
    ChartType chartType,
    ChartSettingsModel? chartSettings, {
    List<LogbookEntryModel>? entries,
  }) =>
      pushNamed(AppNavigator.chart,
          arguments: ChartScreenArgs(
            chartType,
            chartSettings,
            entries,
          ));

  Future<void> hangboardChart(
    HangboardChartType hangboardChartType,
    HangboardChartSettingsModel? hangboardChartSettings, {
    List<HangboardEntryModel>? entries,
  }) =>
      pushNamed(AppNavigator.hangboardChart,
          arguments: HangboardChartScreenArgs(
            hangboardChartType,
            hangboardChartSettings,
            entries,
          ));

  Future<LogbookEntryModel?> logbookCreation(
          {LogbookEntryModel? initialData}) =>
      pushNamed<LogbookEntryModel>(
        AppNavigator.logbookCreation,
        arguments: initialData,
      );

  Future<HangboardItemModel?> hangboardItemCreation(
          {HangboardItemModel? initialData}) =>
      pushNamed<HangboardItemModel>(
        AppNavigator.hangboardItemCreation,
        arguments: initialData,
      );

  Future<HangboardRoutineModel?> hangboardRoutineCreation(
          {HangboardRoutineModel? initialData}) =>
      pushNamed<HangboardRoutineModel>(
        AppNavigator.hangboardRoutineCreation,
        arguments: initialData,
      );

  Future<void> hangboardTimer(HangboardRoutineModel hangboardRoutine) =>
      pushNamed(
        AppNavigator.hangboardTimer,
        arguments: hangboardRoutine,
      );

  Future<LogbookEntryModel?> logbookCreationForProject(
    ProjectModel project,
    AscentType initialAscentTypeSelection, {
    LogbookEntryModel? initialData,
  }) =>
      pushNamed<LogbookEntryModel>(
        AppNavigator.logbookForProjectCreation,
        arguments: LogbookForProjectArgs(
          project,
          initialData,
          initialAscentTypeSelection,
        ),
      );

  Future<ProjectModel?> projectCreation({ProjectModel? initialData}) =>
      pushNamed<ProjectModel>(
        AppNavigator.projectCreation,
        arguments: initialData,
      );

  Future<GoalModel?> goalCreation({GoalModel? initialData}) =>
      pushNamed<GoalModel>(
        AppNavigator.goalCreation,
        arguments: initialData,
      );
}
