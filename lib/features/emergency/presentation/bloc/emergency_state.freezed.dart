// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'emergency_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EmergencyState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(SosResult result) sosSent,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(SosResult result)? sosSent,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(SosResult result)? sosSent,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmergencyInitial value) initial,
    required TResult Function(EmergencyLoading value) loading,
    required TResult Function(EmergencySosSent value) sosSent,
    required TResult Function(EmergencyError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmergencyInitial value)? initial,
    TResult? Function(EmergencyLoading value)? loading,
    TResult? Function(EmergencySosSent value)? sosSent,
    TResult? Function(EmergencyError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmergencyInitial value)? initial,
    TResult Function(EmergencyLoading value)? loading,
    TResult Function(EmergencySosSent value)? sosSent,
    TResult Function(EmergencyError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmergencyStateCopyWith<$Res> {
  factory $EmergencyStateCopyWith(
          EmergencyState value, $Res Function(EmergencyState) then) =
      _$EmergencyStateCopyWithImpl<$Res, EmergencyState>;
}

/// @nodoc
class _$EmergencyStateCopyWithImpl<$Res, $Val extends EmergencyState>
    implements $EmergencyStateCopyWith<$Res> {
  _$EmergencyStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EmergencyState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$EmergencyInitialImplCopyWith<$Res> {
  factory _$$EmergencyInitialImplCopyWith(_$EmergencyInitialImpl value,
          $Res Function(_$EmergencyInitialImpl) then) =
      __$$EmergencyInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EmergencyInitialImplCopyWithImpl<$Res>
    extends _$EmergencyStateCopyWithImpl<$Res, _$EmergencyInitialImpl>
    implements _$$EmergencyInitialImplCopyWith<$Res> {
  __$$EmergencyInitialImplCopyWithImpl(_$EmergencyInitialImpl _value,
      $Res Function(_$EmergencyInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of EmergencyState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$EmergencyInitialImpl implements EmergencyInitial {
  const _$EmergencyInitialImpl();

  @override
  String toString() {
    return 'EmergencyState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EmergencyInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(SosResult result) sosSent,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(SosResult result)? sosSent,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(SosResult result)? sosSent,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmergencyInitial value) initial,
    required TResult Function(EmergencyLoading value) loading,
    required TResult Function(EmergencySosSent value) sosSent,
    required TResult Function(EmergencyError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmergencyInitial value)? initial,
    TResult? Function(EmergencyLoading value)? loading,
    TResult? Function(EmergencySosSent value)? sosSent,
    TResult? Function(EmergencyError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmergencyInitial value)? initial,
    TResult Function(EmergencyLoading value)? loading,
    TResult Function(EmergencySosSent value)? sosSent,
    TResult Function(EmergencyError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class EmergencyInitial implements EmergencyState {
  const factory EmergencyInitial() = _$EmergencyInitialImpl;
}

/// @nodoc
abstract class _$$EmergencyLoadingImplCopyWith<$Res> {
  factory _$$EmergencyLoadingImplCopyWith(_$EmergencyLoadingImpl value,
          $Res Function(_$EmergencyLoadingImpl) then) =
      __$$EmergencyLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EmergencyLoadingImplCopyWithImpl<$Res>
    extends _$EmergencyStateCopyWithImpl<$Res, _$EmergencyLoadingImpl>
    implements _$$EmergencyLoadingImplCopyWith<$Res> {
  __$$EmergencyLoadingImplCopyWithImpl(_$EmergencyLoadingImpl _value,
      $Res Function(_$EmergencyLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of EmergencyState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$EmergencyLoadingImpl implements EmergencyLoading {
  const _$EmergencyLoadingImpl();

  @override
  String toString() {
    return 'EmergencyState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EmergencyLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(SosResult result) sosSent,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(SosResult result)? sosSent,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(SosResult result)? sosSent,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmergencyInitial value) initial,
    required TResult Function(EmergencyLoading value) loading,
    required TResult Function(EmergencySosSent value) sosSent,
    required TResult Function(EmergencyError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmergencyInitial value)? initial,
    TResult? Function(EmergencyLoading value)? loading,
    TResult? Function(EmergencySosSent value)? sosSent,
    TResult? Function(EmergencyError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmergencyInitial value)? initial,
    TResult Function(EmergencyLoading value)? loading,
    TResult Function(EmergencySosSent value)? sosSent,
    TResult Function(EmergencyError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class EmergencyLoading implements EmergencyState {
  const factory EmergencyLoading() = _$EmergencyLoadingImpl;
}

/// @nodoc
abstract class _$$EmergencySosSentImplCopyWith<$Res> {
  factory _$$EmergencySosSentImplCopyWith(_$EmergencySosSentImpl value,
          $Res Function(_$EmergencySosSentImpl) then) =
      __$$EmergencySosSentImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SosResult result});
}

/// @nodoc
class __$$EmergencySosSentImplCopyWithImpl<$Res>
    extends _$EmergencyStateCopyWithImpl<$Res, _$EmergencySosSentImpl>
    implements _$$EmergencySosSentImplCopyWith<$Res> {
  __$$EmergencySosSentImplCopyWithImpl(_$EmergencySosSentImpl _value,
      $Res Function(_$EmergencySosSentImpl) _then)
      : super(_value, _then);

  /// Create a copy of EmergencyState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
  }) {
    return _then(_$EmergencySosSentImpl(
      null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as SosResult,
    ));
  }
}

/// @nodoc

class _$EmergencySosSentImpl implements EmergencySosSent {
  const _$EmergencySosSentImpl(this.result);

  @override
  final SosResult result;

  @override
  String toString() {
    return 'EmergencyState.sosSent(result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmergencySosSentImpl &&
            (identical(other.result, result) || other.result == result));
  }

  @override
  int get hashCode => Object.hash(runtimeType, result);

  /// Create a copy of EmergencyState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EmergencySosSentImplCopyWith<_$EmergencySosSentImpl> get copyWith =>
      __$$EmergencySosSentImplCopyWithImpl<_$EmergencySosSentImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(SosResult result) sosSent,
    required TResult Function(String message) error,
  }) {
    return sosSent(result);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(SosResult result)? sosSent,
    TResult? Function(String message)? error,
  }) {
    return sosSent?.call(result);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(SosResult result)? sosSent,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (sosSent != null) {
      return sosSent(result);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmergencyInitial value) initial,
    required TResult Function(EmergencyLoading value) loading,
    required TResult Function(EmergencySosSent value) sosSent,
    required TResult Function(EmergencyError value) error,
  }) {
    return sosSent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmergencyInitial value)? initial,
    TResult? Function(EmergencyLoading value)? loading,
    TResult? Function(EmergencySosSent value)? sosSent,
    TResult? Function(EmergencyError value)? error,
  }) {
    return sosSent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmergencyInitial value)? initial,
    TResult Function(EmergencyLoading value)? loading,
    TResult Function(EmergencySosSent value)? sosSent,
    TResult Function(EmergencyError value)? error,
    required TResult orElse(),
  }) {
    if (sosSent != null) {
      return sosSent(this);
    }
    return orElse();
  }
}

abstract class EmergencySosSent implements EmergencyState {
  const factory EmergencySosSent(final SosResult result) =
      _$EmergencySosSentImpl;

  SosResult get result;

  /// Create a copy of EmergencyState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EmergencySosSentImplCopyWith<_$EmergencySosSentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EmergencyErrorImplCopyWith<$Res> {
  factory _$$EmergencyErrorImplCopyWith(_$EmergencyErrorImpl value,
          $Res Function(_$EmergencyErrorImpl) then) =
      __$$EmergencyErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$EmergencyErrorImplCopyWithImpl<$Res>
    extends _$EmergencyStateCopyWithImpl<$Res, _$EmergencyErrorImpl>
    implements _$$EmergencyErrorImplCopyWith<$Res> {
  __$$EmergencyErrorImplCopyWithImpl(
      _$EmergencyErrorImpl _value, $Res Function(_$EmergencyErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of EmergencyState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$EmergencyErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$EmergencyErrorImpl implements EmergencyError {
  const _$EmergencyErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'EmergencyState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmergencyErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of EmergencyState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EmergencyErrorImplCopyWith<_$EmergencyErrorImpl> get copyWith =>
      __$$EmergencyErrorImplCopyWithImpl<_$EmergencyErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(SosResult result) sosSent,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(SosResult result)? sosSent,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(SosResult result)? sosSent,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmergencyInitial value) initial,
    required TResult Function(EmergencyLoading value) loading,
    required TResult Function(EmergencySosSent value) sosSent,
    required TResult Function(EmergencyError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmergencyInitial value)? initial,
    TResult? Function(EmergencyLoading value)? loading,
    TResult? Function(EmergencySosSent value)? sosSent,
    TResult? Function(EmergencyError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmergencyInitial value)? initial,
    TResult Function(EmergencyLoading value)? loading,
    TResult Function(EmergencySosSent value)? sosSent,
    TResult Function(EmergencyError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class EmergencyError implements EmergencyState {
  const factory EmergencyError(final String message) = _$EmergencyErrorImpl;

  String get message;

  /// Create a copy of EmergencyState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EmergencyErrorImplCopyWith<_$EmergencyErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
