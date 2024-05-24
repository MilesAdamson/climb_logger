// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'app_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AppStateTearOff {
  const _$AppStateTearOff();

  _AppState call(
      bool appStartupHasRan,
      bool isLoggedIn,
      DocumentSnapshot<UserModel>? userDocument,
      String? loginError,
      Map<String, DocumentSnapshot<LogbookEntryModel>> logbookEntryMap,
      Map<String, DocumentSnapshot<GoalModel>> goalMap,
      Map<String, DocumentSnapshot<ProjectModel>> projectMap,
      Map<String, DocumentSnapshot<HangboardRoutineModel>> hangboardRoutineMap,
      Map<String, DocumentSnapshot<HangboardEntryModel>> hangboardEntryMap,
      Map<DateTime, DocumentSnapshot<TrainingNotesModel>> trainingNotesMap,
      GoalModel? recentlyCompletedGoal,
      String? fatalError,
      bool hasLoadedAllLogbooks,
      FiltersModel filters,
      int bulkInsertProgress,
      bool bulkInsertComplete,
      StatsModel statsModel,
      String? newVersionNumber) {
    return _AppState(
      appStartupHasRan,
      isLoggedIn,
      userDocument,
      loginError,
      logbookEntryMap,
      goalMap,
      projectMap,
      hangboardRoutineMap,
      hangboardEntryMap,
      trainingNotesMap,
      recentlyCompletedGoal,
      fatalError,
      hasLoadedAllLogbooks,
      filters,
      bulkInsertProgress,
      bulkInsertComplete,
      statsModel,
      newVersionNumber,
    );
  }
}

/// @nodoc
const $AppState = _$AppStateTearOff();

/// @nodoc
mixin _$AppState {
  bool get appStartupHasRan => throw _privateConstructorUsedError;
  bool get isLoggedIn => throw _privateConstructorUsedError;
  DocumentSnapshot<UserModel>? get userDocument =>
      throw _privateConstructorUsedError;
  String? get loginError => throw _privateConstructorUsedError;
  Map<String, DocumentSnapshot<LogbookEntryModel>> get logbookEntryMap =>
      throw _privateConstructorUsedError;
  Map<String, DocumentSnapshot<GoalModel>> get goalMap =>
      throw _privateConstructorUsedError;
  Map<String, DocumentSnapshot<ProjectModel>> get projectMap =>
      throw _privateConstructorUsedError;
  Map<String, DocumentSnapshot<HangboardRoutineModel>>
      get hangboardRoutineMap => throw _privateConstructorUsedError;
  Map<String, DocumentSnapshot<HangboardEntryModel>> get hangboardEntryMap =>
      throw _privateConstructorUsedError;
  Map<DateTime, DocumentSnapshot<TrainingNotesModel>> get trainingNotesMap =>
      throw _privateConstructorUsedError;
  GoalModel? get recentlyCompletedGoal => throw _privateConstructorUsedError;
  String? get fatalError => throw _privateConstructorUsedError;
  bool get hasLoadedAllLogbooks => throw _privateConstructorUsedError;
  FiltersModel get filters => throw _privateConstructorUsedError;
  int get bulkInsertProgress => throw _privateConstructorUsedError;
  bool get bulkInsertComplete => throw _privateConstructorUsedError;
  StatsModel get statsModel => throw _privateConstructorUsedError;
  String? get newVersionNumber => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppStateCopyWith<AppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) then) =
      _$AppStateCopyWithImpl<$Res>;
  $Res call(
      {bool appStartupHasRan,
      bool isLoggedIn,
      DocumentSnapshot<UserModel>? userDocument,
      String? loginError,
      Map<String, DocumentSnapshot<LogbookEntryModel>> logbookEntryMap,
      Map<String, DocumentSnapshot<GoalModel>> goalMap,
      Map<String, DocumentSnapshot<ProjectModel>> projectMap,
      Map<String, DocumentSnapshot<HangboardRoutineModel>> hangboardRoutineMap,
      Map<String, DocumentSnapshot<HangboardEntryModel>> hangboardEntryMap,
      Map<DateTime, DocumentSnapshot<TrainingNotesModel>> trainingNotesMap,
      GoalModel? recentlyCompletedGoal,
      String? fatalError,
      bool hasLoadedAllLogbooks,
      FiltersModel filters,
      int bulkInsertProgress,
      bool bulkInsertComplete,
      StatsModel statsModel,
      String? newVersionNumber});

  $GoalModelCopyWith<$Res>? get recentlyCompletedGoal;
  $FiltersModelCopyWith<$Res> get filters;
  $StatsModelCopyWith<$Res> get statsModel;
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res> implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  final AppState _value;
  // ignore: unused_field
  final $Res Function(AppState) _then;

  @override
  $Res call({
    Object? appStartupHasRan = freezed,
    Object? isLoggedIn = freezed,
    Object? userDocument = freezed,
    Object? loginError = freezed,
    Object? logbookEntryMap = freezed,
    Object? goalMap = freezed,
    Object? projectMap = freezed,
    Object? hangboardRoutineMap = freezed,
    Object? hangboardEntryMap = freezed,
    Object? trainingNotesMap = freezed,
    Object? recentlyCompletedGoal = freezed,
    Object? fatalError = freezed,
    Object? hasLoadedAllLogbooks = freezed,
    Object? filters = freezed,
    Object? bulkInsertProgress = freezed,
    Object? bulkInsertComplete = freezed,
    Object? statsModel = freezed,
    Object? newVersionNumber = freezed,
  }) {
    return _then(_value.copyWith(
      appStartupHasRan: appStartupHasRan == freezed
          ? _value.appStartupHasRan
          : appStartupHasRan // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoggedIn: isLoggedIn == freezed
          ? _value.isLoggedIn
          : isLoggedIn // ignore: cast_nullable_to_non_nullable
              as bool,
      userDocument: userDocument == freezed
          ? _value.userDocument
          : userDocument // ignore: cast_nullable_to_non_nullable
              as DocumentSnapshot<UserModel>?,
      loginError: loginError == freezed
          ? _value.loginError
          : loginError // ignore: cast_nullable_to_non_nullable
              as String?,
      logbookEntryMap: logbookEntryMap == freezed
          ? _value.logbookEntryMap
          : logbookEntryMap // ignore: cast_nullable_to_non_nullable
              as Map<String, DocumentSnapshot<LogbookEntryModel>>,
      goalMap: goalMap == freezed
          ? _value.goalMap
          : goalMap // ignore: cast_nullable_to_non_nullable
              as Map<String, DocumentSnapshot<GoalModel>>,
      projectMap: projectMap == freezed
          ? _value.projectMap
          : projectMap // ignore: cast_nullable_to_non_nullable
              as Map<String, DocumentSnapshot<ProjectModel>>,
      hangboardRoutineMap: hangboardRoutineMap == freezed
          ? _value.hangboardRoutineMap
          : hangboardRoutineMap // ignore: cast_nullable_to_non_nullable
              as Map<String, DocumentSnapshot<HangboardRoutineModel>>,
      hangboardEntryMap: hangboardEntryMap == freezed
          ? _value.hangboardEntryMap
          : hangboardEntryMap // ignore: cast_nullable_to_non_nullable
              as Map<String, DocumentSnapshot<HangboardEntryModel>>,
      trainingNotesMap: trainingNotesMap == freezed
          ? _value.trainingNotesMap
          : trainingNotesMap // ignore: cast_nullable_to_non_nullable
              as Map<DateTime, DocumentSnapshot<TrainingNotesModel>>,
      recentlyCompletedGoal: recentlyCompletedGoal == freezed
          ? _value.recentlyCompletedGoal
          : recentlyCompletedGoal // ignore: cast_nullable_to_non_nullable
              as GoalModel?,
      fatalError: fatalError == freezed
          ? _value.fatalError
          : fatalError // ignore: cast_nullable_to_non_nullable
              as String?,
      hasLoadedAllLogbooks: hasLoadedAllLogbooks == freezed
          ? _value.hasLoadedAllLogbooks
          : hasLoadedAllLogbooks // ignore: cast_nullable_to_non_nullable
              as bool,
      filters: filters == freezed
          ? _value.filters
          : filters // ignore: cast_nullable_to_non_nullable
              as FiltersModel,
      bulkInsertProgress: bulkInsertProgress == freezed
          ? _value.bulkInsertProgress
          : bulkInsertProgress // ignore: cast_nullable_to_non_nullable
              as int,
      bulkInsertComplete: bulkInsertComplete == freezed
          ? _value.bulkInsertComplete
          : bulkInsertComplete // ignore: cast_nullable_to_non_nullable
              as bool,
      statsModel: statsModel == freezed
          ? _value.statsModel
          : statsModel // ignore: cast_nullable_to_non_nullable
              as StatsModel,
      newVersionNumber: newVersionNumber == freezed
          ? _value.newVersionNumber
          : newVersionNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $GoalModelCopyWith<$Res>? get recentlyCompletedGoal {
    if (_value.recentlyCompletedGoal == null) {
      return null;
    }

    return $GoalModelCopyWith<$Res>(_value.recentlyCompletedGoal!, (value) {
      return _then(_value.copyWith(recentlyCompletedGoal: value));
    });
  }

  @override
  $FiltersModelCopyWith<$Res> get filters {
    return $FiltersModelCopyWith<$Res>(_value.filters, (value) {
      return _then(_value.copyWith(filters: value));
    });
  }

  @override
  $StatsModelCopyWith<$Res> get statsModel {
    return $StatsModelCopyWith<$Res>(_value.statsModel, (value) {
      return _then(_value.copyWith(statsModel: value));
    });
  }
}

/// @nodoc
abstract class _$AppStateCopyWith<$Res> implements $AppStateCopyWith<$Res> {
  factory _$AppStateCopyWith(_AppState value, $Res Function(_AppState) then) =
      __$AppStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool appStartupHasRan,
      bool isLoggedIn,
      DocumentSnapshot<UserModel>? userDocument,
      String? loginError,
      Map<String, DocumentSnapshot<LogbookEntryModel>> logbookEntryMap,
      Map<String, DocumentSnapshot<GoalModel>> goalMap,
      Map<String, DocumentSnapshot<ProjectModel>> projectMap,
      Map<String, DocumentSnapshot<HangboardRoutineModel>> hangboardRoutineMap,
      Map<String, DocumentSnapshot<HangboardEntryModel>> hangboardEntryMap,
      Map<DateTime, DocumentSnapshot<TrainingNotesModel>> trainingNotesMap,
      GoalModel? recentlyCompletedGoal,
      String? fatalError,
      bool hasLoadedAllLogbooks,
      FiltersModel filters,
      int bulkInsertProgress,
      bool bulkInsertComplete,
      StatsModel statsModel,
      String? newVersionNumber});

  @override
  $GoalModelCopyWith<$Res>? get recentlyCompletedGoal;
  @override
  $FiltersModelCopyWith<$Res> get filters;
  @override
  $StatsModelCopyWith<$Res> get statsModel;
}

/// @nodoc
class __$AppStateCopyWithImpl<$Res> extends _$AppStateCopyWithImpl<$Res>
    implements _$AppStateCopyWith<$Res> {
  __$AppStateCopyWithImpl(_AppState _value, $Res Function(_AppState) _then)
      : super(_value, (v) => _then(v as _AppState));

  @override
  _AppState get _value => super._value as _AppState;

  @override
  $Res call({
    Object? appStartupHasRan = freezed,
    Object? isLoggedIn = freezed,
    Object? userDocument = freezed,
    Object? loginError = freezed,
    Object? logbookEntryMap = freezed,
    Object? goalMap = freezed,
    Object? projectMap = freezed,
    Object? hangboardRoutineMap = freezed,
    Object? hangboardEntryMap = freezed,
    Object? trainingNotesMap = freezed,
    Object? recentlyCompletedGoal = freezed,
    Object? fatalError = freezed,
    Object? hasLoadedAllLogbooks = freezed,
    Object? filters = freezed,
    Object? bulkInsertProgress = freezed,
    Object? bulkInsertComplete = freezed,
    Object? statsModel = freezed,
    Object? newVersionNumber = freezed,
  }) {
    return _then(_AppState(
      appStartupHasRan == freezed
          ? _value.appStartupHasRan
          : appStartupHasRan // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoggedIn == freezed
          ? _value.isLoggedIn
          : isLoggedIn // ignore: cast_nullable_to_non_nullable
              as bool,
      userDocument == freezed
          ? _value.userDocument
          : userDocument // ignore: cast_nullable_to_non_nullable
              as DocumentSnapshot<UserModel>?,
      loginError == freezed
          ? _value.loginError
          : loginError // ignore: cast_nullable_to_non_nullable
              as String?,
      logbookEntryMap == freezed
          ? _value.logbookEntryMap
          : logbookEntryMap // ignore: cast_nullable_to_non_nullable
              as Map<String, DocumentSnapshot<LogbookEntryModel>>,
      goalMap == freezed
          ? _value.goalMap
          : goalMap // ignore: cast_nullable_to_non_nullable
              as Map<String, DocumentSnapshot<GoalModel>>,
      projectMap == freezed
          ? _value.projectMap
          : projectMap // ignore: cast_nullable_to_non_nullable
              as Map<String, DocumentSnapshot<ProjectModel>>,
      hangboardRoutineMap == freezed
          ? _value.hangboardRoutineMap
          : hangboardRoutineMap // ignore: cast_nullable_to_non_nullable
              as Map<String, DocumentSnapshot<HangboardRoutineModel>>,
      hangboardEntryMap == freezed
          ? _value.hangboardEntryMap
          : hangboardEntryMap // ignore: cast_nullable_to_non_nullable
              as Map<String, DocumentSnapshot<HangboardEntryModel>>,
      trainingNotesMap == freezed
          ? _value.trainingNotesMap
          : trainingNotesMap // ignore: cast_nullable_to_non_nullable
              as Map<DateTime, DocumentSnapshot<TrainingNotesModel>>,
      recentlyCompletedGoal == freezed
          ? _value.recentlyCompletedGoal
          : recentlyCompletedGoal // ignore: cast_nullable_to_non_nullable
              as GoalModel?,
      fatalError == freezed
          ? _value.fatalError
          : fatalError // ignore: cast_nullable_to_non_nullable
              as String?,
      hasLoadedAllLogbooks == freezed
          ? _value.hasLoadedAllLogbooks
          : hasLoadedAllLogbooks // ignore: cast_nullable_to_non_nullable
              as bool,
      filters == freezed
          ? _value.filters
          : filters // ignore: cast_nullable_to_non_nullable
              as FiltersModel,
      bulkInsertProgress == freezed
          ? _value.bulkInsertProgress
          : bulkInsertProgress // ignore: cast_nullable_to_non_nullable
              as int,
      bulkInsertComplete == freezed
          ? _value.bulkInsertComplete
          : bulkInsertComplete // ignore: cast_nullable_to_non_nullable
              as bool,
      statsModel == freezed
          ? _value.statsModel
          : statsModel // ignore: cast_nullable_to_non_nullable
              as StatsModel,
      newVersionNumber == freezed
          ? _value.newVersionNumber
          : newVersionNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_AppState extends _AppState {
  _$_AppState(
      this.appStartupHasRan,
      this.isLoggedIn,
      this.userDocument,
      this.loginError,
      this.logbookEntryMap,
      this.goalMap,
      this.projectMap,
      this.hangboardRoutineMap,
      this.hangboardEntryMap,
      this.trainingNotesMap,
      this.recentlyCompletedGoal,
      this.fatalError,
      this.hasLoadedAllLogbooks,
      this.filters,
      this.bulkInsertProgress,
      this.bulkInsertComplete,
      this.statsModel,
      this.newVersionNumber)
      : super._();

  @override
  final bool appStartupHasRan;
  @override
  final bool isLoggedIn;
  @override
  final DocumentSnapshot<UserModel>? userDocument;
  @override
  final String? loginError;
  @override
  final Map<String, DocumentSnapshot<LogbookEntryModel>> logbookEntryMap;
  @override
  final Map<String, DocumentSnapshot<GoalModel>> goalMap;
  @override
  final Map<String, DocumentSnapshot<ProjectModel>> projectMap;
  @override
  final Map<String, DocumentSnapshot<HangboardRoutineModel>>
      hangboardRoutineMap;
  @override
  final Map<String, DocumentSnapshot<HangboardEntryModel>> hangboardEntryMap;
  @override
  final Map<DateTime, DocumentSnapshot<TrainingNotesModel>> trainingNotesMap;
  @override
  final GoalModel? recentlyCompletedGoal;
  @override
  final String? fatalError;
  @override
  final bool hasLoadedAllLogbooks;
  @override
  final FiltersModel filters;
  @override
  final int bulkInsertProgress;
  @override
  final bool bulkInsertComplete;
  @override
  final StatsModel statsModel;
  @override
  final String? newVersionNumber;

  @override
  String toString() {
    return 'AppState(appStartupHasRan: $appStartupHasRan, isLoggedIn: $isLoggedIn, userDocument: $userDocument, loginError: $loginError, logbookEntryMap: $logbookEntryMap, goalMap: $goalMap, projectMap: $projectMap, hangboardRoutineMap: $hangboardRoutineMap, hangboardEntryMap: $hangboardEntryMap, trainingNotesMap: $trainingNotesMap, recentlyCompletedGoal: $recentlyCompletedGoal, fatalError: $fatalError, hasLoadedAllLogbooks: $hasLoadedAllLogbooks, filters: $filters, bulkInsertProgress: $bulkInsertProgress, bulkInsertComplete: $bulkInsertComplete, statsModel: $statsModel, newVersionNumber: $newVersionNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AppState &&
            const DeepCollectionEquality()
                .equals(other.appStartupHasRan, appStartupHasRan) &&
            const DeepCollectionEquality()
                .equals(other.isLoggedIn, isLoggedIn) &&
            const DeepCollectionEquality()
                .equals(other.userDocument, userDocument) &&
            const DeepCollectionEquality()
                .equals(other.loginError, loginError) &&
            const DeepCollectionEquality()
                .equals(other.logbookEntryMap, logbookEntryMap) &&
            const DeepCollectionEquality().equals(other.goalMap, goalMap) &&
            const DeepCollectionEquality()
                .equals(other.projectMap, projectMap) &&
            const DeepCollectionEquality()
                .equals(other.hangboardRoutineMap, hangboardRoutineMap) &&
            const DeepCollectionEquality()
                .equals(other.hangboardEntryMap, hangboardEntryMap) &&
            const DeepCollectionEquality()
                .equals(other.trainingNotesMap, trainingNotesMap) &&
            const DeepCollectionEquality()
                .equals(other.recentlyCompletedGoal, recentlyCompletedGoal) &&
            const DeepCollectionEquality()
                .equals(other.fatalError, fatalError) &&
            const DeepCollectionEquality()
                .equals(other.hasLoadedAllLogbooks, hasLoadedAllLogbooks) &&
            const DeepCollectionEquality().equals(other.filters, filters) &&
            const DeepCollectionEquality()
                .equals(other.bulkInsertProgress, bulkInsertProgress) &&
            const DeepCollectionEquality()
                .equals(other.bulkInsertComplete, bulkInsertComplete) &&
            const DeepCollectionEquality()
                .equals(other.statsModel, statsModel) &&
            const DeepCollectionEquality()
                .equals(other.newVersionNumber, newVersionNumber));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(appStartupHasRan),
      const DeepCollectionEquality().hash(isLoggedIn),
      const DeepCollectionEquality().hash(userDocument),
      const DeepCollectionEquality().hash(loginError),
      const DeepCollectionEquality().hash(logbookEntryMap),
      const DeepCollectionEquality().hash(goalMap),
      const DeepCollectionEquality().hash(projectMap),
      const DeepCollectionEquality().hash(hangboardRoutineMap),
      const DeepCollectionEquality().hash(hangboardEntryMap),
      const DeepCollectionEquality().hash(trainingNotesMap),
      const DeepCollectionEquality().hash(recentlyCompletedGoal),
      const DeepCollectionEquality().hash(fatalError),
      const DeepCollectionEquality().hash(hasLoadedAllLogbooks),
      const DeepCollectionEquality().hash(filters),
      const DeepCollectionEquality().hash(bulkInsertProgress),
      const DeepCollectionEquality().hash(bulkInsertComplete),
      const DeepCollectionEquality().hash(statsModel),
      const DeepCollectionEquality().hash(newVersionNumber));

  @JsonKey(ignore: true)
  @override
  _$AppStateCopyWith<_AppState> get copyWith =>
      __$AppStateCopyWithImpl<_AppState>(this, _$identity);
}

abstract class _AppState extends AppState {
  factory _AppState(
      bool appStartupHasRan,
      bool isLoggedIn,
      DocumentSnapshot<UserModel>? userDocument,
      String? loginError,
      Map<String, DocumentSnapshot<LogbookEntryModel>> logbookEntryMap,
      Map<String, DocumentSnapshot<GoalModel>> goalMap,
      Map<String, DocumentSnapshot<ProjectModel>> projectMap,
      Map<String, DocumentSnapshot<HangboardRoutineModel>> hangboardRoutineMap,
      Map<String, DocumentSnapshot<HangboardEntryModel>> hangboardEntryMap,
      Map<DateTime, DocumentSnapshot<TrainingNotesModel>> trainingNotesMap,
      GoalModel? recentlyCompletedGoal,
      String? fatalError,
      bool hasLoadedAllLogbooks,
      FiltersModel filters,
      int bulkInsertProgress,
      bool bulkInsertComplete,
      StatsModel statsModel,
      String? newVersionNumber) = _$_AppState;
  _AppState._() : super._();

  @override
  bool get appStartupHasRan;
  @override
  bool get isLoggedIn;
  @override
  DocumentSnapshot<UserModel>? get userDocument;
  @override
  String? get loginError;
  @override
  Map<String, DocumentSnapshot<LogbookEntryModel>> get logbookEntryMap;
  @override
  Map<String, DocumentSnapshot<GoalModel>> get goalMap;
  @override
  Map<String, DocumentSnapshot<ProjectModel>> get projectMap;
  @override
  Map<String, DocumentSnapshot<HangboardRoutineModel>> get hangboardRoutineMap;
  @override
  Map<String, DocumentSnapshot<HangboardEntryModel>> get hangboardEntryMap;
  @override
  Map<DateTime, DocumentSnapshot<TrainingNotesModel>> get trainingNotesMap;
  @override
  GoalModel? get recentlyCompletedGoal;
  @override
  String? get fatalError;
  @override
  bool get hasLoadedAllLogbooks;
  @override
  FiltersModel get filters;
  @override
  int get bulkInsertProgress;
  @override
  bool get bulkInsertComplete;
  @override
  StatsModel get statsModel;
  @override
  String? get newVersionNumber;
  @override
  @JsonKey(ignore: true)
  _$AppStateCopyWith<_AppState> get copyWith =>
      throw _privateConstructorUsedError;
}
