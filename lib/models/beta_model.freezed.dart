// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'beta_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BetaModel _$BetaModelFromJson(Map<String, dynamic> json) {
  return _BetaModel.fromJson(json);
}

/// @nodoc
class _$BetaModelTearOff {
  const _$BetaModelTearOff();

  _BetaModel call(String beta, String uniqueId) {
    return _BetaModel(
      beta,
      uniqueId,
    );
  }

  BetaModel fromJson(Map<String, Object?> json) {
    return BetaModel.fromJson(json);
  }
}

/// @nodoc
const $BetaModel = _$BetaModelTearOff();

/// @nodoc
mixin _$BetaModel {
  String get beta => throw _privateConstructorUsedError;
  String get uniqueId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BetaModelCopyWith<BetaModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BetaModelCopyWith<$Res> {
  factory $BetaModelCopyWith(BetaModel value, $Res Function(BetaModel) then) =
      _$BetaModelCopyWithImpl<$Res>;
  $Res call({String beta, String uniqueId});
}

/// @nodoc
class _$BetaModelCopyWithImpl<$Res> implements $BetaModelCopyWith<$Res> {
  _$BetaModelCopyWithImpl(this._value, this._then);

  final BetaModel _value;
  // ignore: unused_field
  final $Res Function(BetaModel) _then;

  @override
  $Res call({
    Object? beta = freezed,
    Object? uniqueId = freezed,
  }) {
    return _then(_value.copyWith(
      beta: beta == freezed
          ? _value.beta
          : beta // ignore: cast_nullable_to_non_nullable
              as String,
      uniqueId: uniqueId == freezed
          ? _value.uniqueId
          : uniqueId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$BetaModelCopyWith<$Res> implements $BetaModelCopyWith<$Res> {
  factory _$BetaModelCopyWith(
          _BetaModel value, $Res Function(_BetaModel) then) =
      __$BetaModelCopyWithImpl<$Res>;
  @override
  $Res call({String beta, String uniqueId});
}

/// @nodoc
class __$BetaModelCopyWithImpl<$Res> extends _$BetaModelCopyWithImpl<$Res>
    implements _$BetaModelCopyWith<$Res> {
  __$BetaModelCopyWithImpl(_BetaModel _value, $Res Function(_BetaModel) _then)
      : super(_value, (v) => _then(v as _BetaModel));

  @override
  _BetaModel get _value => super._value as _BetaModel;

  @override
  $Res call({
    Object? beta = freezed,
    Object? uniqueId = freezed,
  }) {
    return _then(_BetaModel(
      beta == freezed
          ? _value.beta
          : beta // ignore: cast_nullable_to_non_nullable
              as String,
      uniqueId == freezed
          ? _value.uniqueId
          : uniqueId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BetaModel extends _BetaModel {
  _$_BetaModel(this.beta, this.uniqueId) : super._();

  factory _$_BetaModel.fromJson(Map<String, dynamic> json) =>
      _$$_BetaModelFromJson(json);

  @override
  final String beta;
  @override
  final String uniqueId;

  @override
  String toString() {
    return 'BetaModel(beta: $beta, uniqueId: $uniqueId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BetaModel &&
            const DeepCollectionEquality().equals(other.beta, beta) &&
            const DeepCollectionEquality().equals(other.uniqueId, uniqueId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(beta),
      const DeepCollectionEquality().hash(uniqueId));

  @JsonKey(ignore: true)
  @override
  _$BetaModelCopyWith<_BetaModel> get copyWith =>
      __$BetaModelCopyWithImpl<_BetaModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BetaModelToJson(this);
  }
}

abstract class _BetaModel extends BetaModel {
  factory _BetaModel(String beta, String uniqueId) = _$_BetaModel;
  _BetaModel._() : super._();

  factory _BetaModel.fromJson(Map<String, dynamic> json) =
      _$_BetaModel.fromJson;

  @override
  String get beta;
  @override
  String get uniqueId;
  @override
  @JsonKey(ignore: true)
  _$BetaModelCopyWith<_BetaModel> get copyWith =>
      throw _privateConstructorUsedError;
}
