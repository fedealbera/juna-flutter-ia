// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tracks_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TracksState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Track> tracks) loaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Track> tracks)? loaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Track> tracks)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TracksInitial value) initial,
    required TResult Function(TracksLoading value) loading,
    required TResult Function(TracksLoaded value) loaded,
    required TResult Function(TracksError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TracksInitial value)? initial,
    TResult? Function(TracksLoading value)? loading,
    TResult? Function(TracksLoaded value)? loaded,
    TResult? Function(TracksError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TracksInitial value)? initial,
    TResult Function(TracksLoading value)? loading,
    TResult Function(TracksLoaded value)? loaded,
    TResult Function(TracksError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TracksStateCopyWith<$Res> {
  factory $TracksStateCopyWith(
          TracksState value, $Res Function(TracksState) then) =
      _$TracksStateCopyWithImpl<$Res, TracksState>;
}

/// @nodoc
class _$TracksStateCopyWithImpl<$Res, $Val extends TracksState>
    implements $TracksStateCopyWith<$Res> {
  _$TracksStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TracksState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$TracksInitialImplCopyWith<$Res> {
  factory _$$TracksInitialImplCopyWith(
          _$TracksInitialImpl value, $Res Function(_$TracksInitialImpl) then) =
      __$$TracksInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TracksInitialImplCopyWithImpl<$Res>
    extends _$TracksStateCopyWithImpl<$Res, _$TracksInitialImpl>
    implements _$$TracksInitialImplCopyWith<$Res> {
  __$$TracksInitialImplCopyWithImpl(
      _$TracksInitialImpl _value, $Res Function(_$TracksInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of TracksState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TracksInitialImpl implements TracksInitial {
  const _$TracksInitialImpl();

  @override
  String toString() {
    return 'TracksState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TracksInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Track> tracks) loaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Track> tracks)? loaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Track> tracks)? loaded,
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
    required TResult Function(TracksInitial value) initial,
    required TResult Function(TracksLoading value) loading,
    required TResult Function(TracksLoaded value) loaded,
    required TResult Function(TracksError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TracksInitial value)? initial,
    TResult? Function(TracksLoading value)? loading,
    TResult? Function(TracksLoaded value)? loaded,
    TResult? Function(TracksError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TracksInitial value)? initial,
    TResult Function(TracksLoading value)? loading,
    TResult Function(TracksLoaded value)? loaded,
    TResult Function(TracksError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class TracksInitial implements TracksState {
  const factory TracksInitial() = _$TracksInitialImpl;
}

/// @nodoc
abstract class _$$TracksLoadingImplCopyWith<$Res> {
  factory _$$TracksLoadingImplCopyWith(
          _$TracksLoadingImpl value, $Res Function(_$TracksLoadingImpl) then) =
      __$$TracksLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TracksLoadingImplCopyWithImpl<$Res>
    extends _$TracksStateCopyWithImpl<$Res, _$TracksLoadingImpl>
    implements _$$TracksLoadingImplCopyWith<$Res> {
  __$$TracksLoadingImplCopyWithImpl(
      _$TracksLoadingImpl _value, $Res Function(_$TracksLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of TracksState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TracksLoadingImpl implements TracksLoading {
  const _$TracksLoadingImpl();

  @override
  String toString() {
    return 'TracksState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TracksLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Track> tracks) loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Track> tracks)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Track> tracks)? loaded,
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
    required TResult Function(TracksInitial value) initial,
    required TResult Function(TracksLoading value) loading,
    required TResult Function(TracksLoaded value) loaded,
    required TResult Function(TracksError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TracksInitial value)? initial,
    TResult? Function(TracksLoading value)? loading,
    TResult? Function(TracksLoaded value)? loaded,
    TResult? Function(TracksError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TracksInitial value)? initial,
    TResult Function(TracksLoading value)? loading,
    TResult Function(TracksLoaded value)? loaded,
    TResult Function(TracksError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class TracksLoading implements TracksState {
  const factory TracksLoading() = _$TracksLoadingImpl;
}

/// @nodoc
abstract class _$$TracksLoadedImplCopyWith<$Res> {
  factory _$$TracksLoadedImplCopyWith(
          _$TracksLoadedImpl value, $Res Function(_$TracksLoadedImpl) then) =
      __$$TracksLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Track> tracks});
}

/// @nodoc
class __$$TracksLoadedImplCopyWithImpl<$Res>
    extends _$TracksStateCopyWithImpl<$Res, _$TracksLoadedImpl>
    implements _$$TracksLoadedImplCopyWith<$Res> {
  __$$TracksLoadedImplCopyWithImpl(
      _$TracksLoadedImpl _value, $Res Function(_$TracksLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of TracksState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tracks = null,
  }) {
    return _then(_$TracksLoadedImpl(
      null == tracks
          ? _value._tracks
          : tracks // ignore: cast_nullable_to_non_nullable
              as List<Track>,
    ));
  }
}

/// @nodoc

class _$TracksLoadedImpl implements TracksLoaded {
  const _$TracksLoadedImpl(final List<Track> tracks) : _tracks = tracks;

  final List<Track> _tracks;
  @override
  List<Track> get tracks {
    if (_tracks is EqualUnmodifiableListView) return _tracks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tracks);
  }

  @override
  String toString() {
    return 'TracksState.loaded(tracks: $tracks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TracksLoadedImpl &&
            const DeepCollectionEquality().equals(other._tracks, _tracks));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_tracks));

  /// Create a copy of TracksState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TracksLoadedImplCopyWith<_$TracksLoadedImpl> get copyWith =>
      __$$TracksLoadedImplCopyWithImpl<_$TracksLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Track> tracks) loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(tracks);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Track> tracks)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(tracks);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Track> tracks)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(tracks);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TracksInitial value) initial,
    required TResult Function(TracksLoading value) loading,
    required TResult Function(TracksLoaded value) loaded,
    required TResult Function(TracksError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TracksInitial value)? initial,
    TResult? Function(TracksLoading value)? loading,
    TResult? Function(TracksLoaded value)? loaded,
    TResult? Function(TracksError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TracksInitial value)? initial,
    TResult Function(TracksLoading value)? loading,
    TResult Function(TracksLoaded value)? loaded,
    TResult Function(TracksError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class TracksLoaded implements TracksState {
  const factory TracksLoaded(final List<Track> tracks) = _$TracksLoadedImpl;

  List<Track> get tracks;

  /// Create a copy of TracksState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TracksLoadedImplCopyWith<_$TracksLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TracksErrorImplCopyWith<$Res> {
  factory _$$TracksErrorImplCopyWith(
          _$TracksErrorImpl value, $Res Function(_$TracksErrorImpl) then) =
      __$$TracksErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$TracksErrorImplCopyWithImpl<$Res>
    extends _$TracksStateCopyWithImpl<$Res, _$TracksErrorImpl>
    implements _$$TracksErrorImplCopyWith<$Res> {
  __$$TracksErrorImplCopyWithImpl(
      _$TracksErrorImpl _value, $Res Function(_$TracksErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of TracksState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$TracksErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TracksErrorImpl implements TracksError {
  const _$TracksErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'TracksState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TracksErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of TracksState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TracksErrorImplCopyWith<_$TracksErrorImpl> get copyWith =>
      __$$TracksErrorImplCopyWithImpl<_$TracksErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Track> tracks) loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Track> tracks)? loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Track> tracks)? loaded,
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
    required TResult Function(TracksInitial value) initial,
    required TResult Function(TracksLoading value) loading,
    required TResult Function(TracksLoaded value) loaded,
    required TResult Function(TracksError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TracksInitial value)? initial,
    TResult? Function(TracksLoading value)? loading,
    TResult? Function(TracksLoaded value)? loaded,
    TResult? Function(TracksError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TracksInitial value)? initial,
    TResult Function(TracksLoading value)? loading,
    TResult Function(TracksLoaded value)? loaded,
    TResult Function(TracksError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class TracksError implements TracksState {
  const factory TracksError(final String message) = _$TracksErrorImpl;

  String get message;

  /// Create a copy of TracksState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TracksErrorImplCopyWith<_$TracksErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
