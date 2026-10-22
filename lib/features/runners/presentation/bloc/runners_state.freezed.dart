// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'runners_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RunnersState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<RunnerItem> runners) loaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<RunnerItem> runners)? loaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<RunnerItem> runners)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RunnersInitial value) initial,
    required TResult Function(RunnersLoading value) loading,
    required TResult Function(RunnersLoaded value) loaded,
    required TResult Function(RunnersError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RunnersInitial value)? initial,
    TResult? Function(RunnersLoading value)? loading,
    TResult? Function(RunnersLoaded value)? loaded,
    TResult? Function(RunnersError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RunnersInitial value)? initial,
    TResult Function(RunnersLoading value)? loading,
    TResult Function(RunnersLoaded value)? loaded,
    TResult Function(RunnersError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RunnersStateCopyWith<$Res> {
  factory $RunnersStateCopyWith(
          RunnersState value, $Res Function(RunnersState) then) =
      _$RunnersStateCopyWithImpl<$Res, RunnersState>;
}

/// @nodoc
class _$RunnersStateCopyWithImpl<$Res, $Val extends RunnersState>
    implements $RunnersStateCopyWith<$Res> {
  _$RunnersStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RunnersState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$RunnersInitialImplCopyWith<$Res> {
  factory _$$RunnersInitialImplCopyWith(_$RunnersInitialImpl value,
          $Res Function(_$RunnersInitialImpl) then) =
      __$$RunnersInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RunnersInitialImplCopyWithImpl<$Res>
    extends _$RunnersStateCopyWithImpl<$Res, _$RunnersInitialImpl>
    implements _$$RunnersInitialImplCopyWith<$Res> {
  __$$RunnersInitialImplCopyWithImpl(
      _$RunnersInitialImpl _value, $Res Function(_$RunnersInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of RunnersState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RunnersInitialImpl implements RunnersInitial {
  const _$RunnersInitialImpl();

  @override
  String toString() {
    return 'RunnersState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RunnersInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<RunnerItem> runners) loaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<RunnerItem> runners)? loaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<RunnerItem> runners)? loaded,
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
    required TResult Function(RunnersInitial value) initial,
    required TResult Function(RunnersLoading value) loading,
    required TResult Function(RunnersLoaded value) loaded,
    required TResult Function(RunnersError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RunnersInitial value)? initial,
    TResult? Function(RunnersLoading value)? loading,
    TResult? Function(RunnersLoaded value)? loaded,
    TResult? Function(RunnersError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RunnersInitial value)? initial,
    TResult Function(RunnersLoading value)? loading,
    TResult Function(RunnersLoaded value)? loaded,
    TResult Function(RunnersError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class RunnersInitial implements RunnersState {
  const factory RunnersInitial() = _$RunnersInitialImpl;
}

/// @nodoc
abstract class _$$RunnersLoadingImplCopyWith<$Res> {
  factory _$$RunnersLoadingImplCopyWith(_$RunnersLoadingImpl value,
          $Res Function(_$RunnersLoadingImpl) then) =
      __$$RunnersLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RunnersLoadingImplCopyWithImpl<$Res>
    extends _$RunnersStateCopyWithImpl<$Res, _$RunnersLoadingImpl>
    implements _$$RunnersLoadingImplCopyWith<$Res> {
  __$$RunnersLoadingImplCopyWithImpl(
      _$RunnersLoadingImpl _value, $Res Function(_$RunnersLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of RunnersState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RunnersLoadingImpl implements RunnersLoading {
  const _$RunnersLoadingImpl();

  @override
  String toString() {
    return 'RunnersState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RunnersLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<RunnerItem> runners) loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<RunnerItem> runners)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<RunnerItem> runners)? loaded,
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
    required TResult Function(RunnersInitial value) initial,
    required TResult Function(RunnersLoading value) loading,
    required TResult Function(RunnersLoaded value) loaded,
    required TResult Function(RunnersError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RunnersInitial value)? initial,
    TResult? Function(RunnersLoading value)? loading,
    TResult? Function(RunnersLoaded value)? loaded,
    TResult? Function(RunnersError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RunnersInitial value)? initial,
    TResult Function(RunnersLoading value)? loading,
    TResult Function(RunnersLoaded value)? loaded,
    TResult Function(RunnersError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class RunnersLoading implements RunnersState {
  const factory RunnersLoading() = _$RunnersLoadingImpl;
}

/// @nodoc
abstract class _$$RunnersLoadedImplCopyWith<$Res> {
  factory _$$RunnersLoadedImplCopyWith(
          _$RunnersLoadedImpl value, $Res Function(_$RunnersLoadedImpl) then) =
      __$$RunnersLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<RunnerItem> runners});
}

/// @nodoc
class __$$RunnersLoadedImplCopyWithImpl<$Res>
    extends _$RunnersStateCopyWithImpl<$Res, _$RunnersLoadedImpl>
    implements _$$RunnersLoadedImplCopyWith<$Res> {
  __$$RunnersLoadedImplCopyWithImpl(
      _$RunnersLoadedImpl _value, $Res Function(_$RunnersLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of RunnersState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? runners = null,
  }) {
    return _then(_$RunnersLoadedImpl(
      runners: null == runners
          ? _value._runners
          : runners // ignore: cast_nullable_to_non_nullable
              as List<RunnerItem>,
    ));
  }
}

/// @nodoc

class _$RunnersLoadedImpl implements RunnersLoaded {
  const _$RunnersLoadedImpl({required final List<RunnerItem> runners})
      : _runners = runners;

  final List<RunnerItem> _runners;
  @override
  List<RunnerItem> get runners {
    if (_runners is EqualUnmodifiableListView) return _runners;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_runners);
  }

  @override
  String toString() {
    return 'RunnersState.loaded(runners: $runners)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RunnersLoadedImpl &&
            const DeepCollectionEquality().equals(other._runners, _runners));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_runners));

  /// Create a copy of RunnersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RunnersLoadedImplCopyWith<_$RunnersLoadedImpl> get copyWith =>
      __$$RunnersLoadedImplCopyWithImpl<_$RunnersLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<RunnerItem> runners) loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(runners);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<RunnerItem> runners)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(runners);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<RunnerItem> runners)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(runners);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RunnersInitial value) initial,
    required TResult Function(RunnersLoading value) loading,
    required TResult Function(RunnersLoaded value) loaded,
    required TResult Function(RunnersError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RunnersInitial value)? initial,
    TResult? Function(RunnersLoading value)? loading,
    TResult? Function(RunnersLoaded value)? loaded,
    TResult? Function(RunnersError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RunnersInitial value)? initial,
    TResult Function(RunnersLoading value)? loading,
    TResult Function(RunnersLoaded value)? loaded,
    TResult Function(RunnersError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class RunnersLoaded implements RunnersState {
  const factory RunnersLoaded({required final List<RunnerItem> runners}) =
      _$RunnersLoadedImpl;

  List<RunnerItem> get runners;

  /// Create a copy of RunnersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RunnersLoadedImplCopyWith<_$RunnersLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RunnersErrorImplCopyWith<$Res> {
  factory _$$RunnersErrorImplCopyWith(
          _$RunnersErrorImpl value, $Res Function(_$RunnersErrorImpl) then) =
      __$$RunnersErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$RunnersErrorImplCopyWithImpl<$Res>
    extends _$RunnersStateCopyWithImpl<$Res, _$RunnersErrorImpl>
    implements _$$RunnersErrorImplCopyWith<$Res> {
  __$$RunnersErrorImplCopyWithImpl(
      _$RunnersErrorImpl _value, $Res Function(_$RunnersErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of RunnersState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$RunnersErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RunnersErrorImpl implements RunnersError {
  const _$RunnersErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'RunnersState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RunnersErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of RunnersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RunnersErrorImplCopyWith<_$RunnersErrorImpl> get copyWith =>
      __$$RunnersErrorImplCopyWithImpl<_$RunnersErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<RunnerItem> runners) loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<RunnerItem> runners)? loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<RunnerItem> runners)? loaded,
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
    required TResult Function(RunnersInitial value) initial,
    required TResult Function(RunnersLoading value) loading,
    required TResult Function(RunnersLoaded value) loaded,
    required TResult Function(RunnersError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RunnersInitial value)? initial,
    TResult? Function(RunnersLoading value)? loading,
    TResult? Function(RunnersLoaded value)? loaded,
    TResult? Function(RunnersError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RunnersInitial value)? initial,
    TResult Function(RunnersLoading value)? loading,
    TResult Function(RunnersLoaded value)? loaded,
    TResult Function(RunnersError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class RunnersError implements RunnersState {
  const factory RunnersError(final String message) = _$RunnersErrorImpl;

  String get message;

  /// Create a copy of RunnersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RunnersErrorImplCopyWith<_$RunnersErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
