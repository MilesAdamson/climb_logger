import 'package:climb_logger/routing/routes/chart_route.dart';
import 'package:climb_logger/routing/routes/create_logbook_for_project_route.dart';
import 'package:climb_logger/routing/routes/csv_example_route.dart';
import 'package:climb_logger/routing/routes/csv_import_preview_route.dart';
import 'package:climb_logger/routing/routes/csv_import_route.dart';
import 'package:climb_logger/routing/routes/goal_creation_route.dart';
import 'package:climb_logger/routing/routes/goal_route.dart';
import 'package:climb_logger/routing/routes/hangboard_chart_route.dart';
import 'package:climb_logger/routing/routes/hangboard_entry_route.dart';
import 'package:climb_logger/routing/routes/hangboard_item_creation_route.dart';
import 'package:climb_logger/routing/routes/hangboard_routine_creation_route.dart';
import 'package:climb_logger/routing/routes/hangboard_routine_route.dart';
import 'package:climb_logger/routing/routes/hangboard_routines_route.dart';
import 'package:climb_logger/routing/routes/hangboard_timer_route.dart';
import 'package:climb_logger/routing/routes/home_route.dart';
import 'package:climb_logger/routing/routes/logbook_creation_route.dart';
import 'package:climb_logger/routing/routes/logbook_entry_route.dart';
import 'package:climb_logger/routing/routes/login_route.dart';
import 'package:climb_logger/routing/routes/mood_calendar_route.dart';
import 'package:climb_logger/routing/routes/mood_history_route.dart';
import 'package:climb_logger/routing/routes/new_version_route.dart';
import 'package:climb_logger/routing/routes/project_beta_route.dart';
import 'package:climb_logger/routing/routes/project_creation_route.dart';
import 'package:climb_logger/routing/routes/project_route.dart';
import 'package:climb_logger/routing/routes/scoring_info_route.dart';
import 'package:climb_logger/routing/routes/select_chart_route.dart';
import 'package:climb_logger/routing/routes/settings_route.dart';
import 'package:climb_logger/routing/routes/splash_route.dart';
import 'package:climb_logger/routing/routes/stats_route.dart';
import 'package:climb_logger/routing/routes/tags_route.dart';
import 'package:climb_logger/routing/routes/template_route.dart';
import 'package:climb_logger/routing/routes/training_notes_route.dart';
import 'package:flutter/material.dart';

class AppNavigator {
  static const splash = "/";
  static const login = "login";
  static const home = "home";
  static const logbookEntry = "logbookEntry";
  static const settings = "settings";
  static const stats = "stats";
  static const logbookCreation = "logbookCreation";
  static const goal = "goal";
  static const goalCreation = "goalCreation";
  static const scoringInfo = "scoringInfo";
  static const selectChart = "selectChart";
  static const chart = "chart";
  static const hangboardChart = "hangboardChart";
  static const tags = "tags";
  static const csvImport = "csvImport";
  static const csvExample = "csvExample";
  static const csvPreview = "csvPreview";
  static const project = "project";
  static const projectCreation = "projectCreation";
  static const projectBeta = "projectBeta";
  static const logbookForProjectCreation = "logbookForProjectCreation";
  static const hangboardRoutines = "hangboardRoutines";
  static const hangboardRoutineCreation = "hangboardRoutineCreation";
  static const hangboardItemCreation = "hangboardItemCreation";
  static const hangboardRoutine = "hangboardRoutine";
  static const hangboardTimer = "hangboardTimer";
  static const hangboardEntry = "hangboardEntry";
  static const hangboardTemplateSelect = "hangboardTemplateSelect";
  static const newVersionRoute = "newVersionRoute";
  static const daySummaryRoute = "daySummaryRoute";
  static const historyRoute = "historyRoute";
  static const moodCalendarRoute = "moodChartRoute";

  static const _routes = {
    splash: SplashRoute(),
    home: HomeRoute(),
    login: LoginRoute(),
    logbookEntry: LogbookEntryRoute(),
    settings: SettingsRoute(),
    logbookCreation: LogbookCreationRoute(),
    goal: GoalRoute(),
    goalCreation: GoalCreationRoute(),
    scoringInfo: ScoringInfoRoute(),
    selectChart: SelectChartRoute(),
    chart: ChartRoute(),
    tags: TagsRoute(),
    csvImport: CsvImportRoute(),
    csvExample: CsvExampleRoute(),
    csvPreview: CsvImportPreviewRoute(),
    project: ProjectRoute(),
    projectCreation: ProjectCreationRoute(),
    logbookForProjectCreation: CreateLogbookForProjectRoute(),
    stats: StatsRoute(),
    hangboardRoutineCreation: HangboardRoutineCreationRoute(),
    hangboardRoutines: HangboardRoutinesRoute(),
    hangboardItemCreation: HangboardItemCreationRoute(),
    hangboardRoutine: HangboardRoutineRoute(),
    hangboardTimer: HangboardTimerRoute(),
    hangboardEntry: HangboardEntryRoute(),
    newVersionRoute: NewVersionRoute(),
    hangboardChart: HangboardChartRoute(),
    hangboardTemplateSelect: TemplateRoute(),
    daySummaryRoute: TrainingNotesRoute(),
    historyRoute: MoodHistoryRoute(),
    moodCalendarRoute: MoodCalendarRoute(),
    projectBeta: ProjectBetaRoute(),
  };

  Route<dynamic>? onGenerateRoute(RouteSettings settings) =>
      _routes[settings.name]!.pageRoute(settings);
}
