// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'about_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AboutState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(AboutInfo info) loaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(AboutInfo info)? loaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(AboutInfo info)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AboutInitial value) initial,
    required TResult Function(AboutLoading value) loading,
    required TResult Function(AboutLoaded value) loaded,
    required TResult Function(AboutError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AboutInitial value)? initial,
    TResult? Function(AboutLoading value)? loading,
    TResult? Function(AboutLoaded value)? loaded,
    TResult? Function(AboutError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AboutInitial value)? initial,
    TResult Function(AboutLoading value)? loading,
    TResult Function(AboutLoaded value)? loaded,
    TResult Function(AboutError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AboutStateCopyWith<$Res> {
  factory $AboutStateCopyWith(
          AboutState value, $Res Function(AboutState) then) =
      _$AboutStateCopyWithImpl<$Res, AboutState>;
}

/// @nodoc
class _$AboutStateCopyWithImpl<$Res, $Val extends AboutState>
    implements $AboutStateCopyWith<$Res> {
  _$AboutStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AboutState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$AboutInitialImplCopyWith<$Res> {
  factory _$$AboutInitialImplCopyWith(
          _$AboutInitialImpl value, $Res Function(_$AboutInitialImpl) then) =
      __$$AboutInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AboutInitialImplCopyWithImpl<$Res>
    extends _$AboutStateCopyWithImpl<$Res, _$AboutInitialImpl>
    implements _$$AboutInitialImplCopyWith<$Res> {
  __$$AboutInitialImplCopyWithImpl(
      _$AboutInitialImpl _value, $Res Function(_$AboutInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of AboutState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AboutInitialImpl implements AboutInitial {
  const _$AboutInitialImpl();

  @override
  String toString() {
    return 'AboutState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AboutInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(AboutInfo info) loaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(AboutInfo info)? loaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(AboutInfo info)? loaded,
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
    required TResult Function(AboutInitial value) initial,
    required TResult Function(AboutLoading value) loading,
    required TResult Function(AboutLoaded value) loaded,
    required TResult Function(AboutError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AboutInitial value)? initial,
    TResult? Function(AboutLoading value)? loading,
    TResult? Function(AboutLoaded value)? loaded,
    TResult? Function(AboutError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AboutInitial value)? initial,
    TResult Function(AboutLoading value)? loading,
    TResult Function(AboutLoaded value)? loaded,
    TResult Function(AboutError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class AboutInitial implements AboutState {
  const factory AboutInitial() = _$AboutInitialImpl;
}

/// @nodoc
abstract class _$$AboutLoadingImplCopyWith<$Res> {
  factory _$$AboutLoadingImplCopyWith(
          _$AboutLoadingImpl value, $Res Function(_$AboutLoadingImpl) then) =
      __$$AboutLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AboutLoadingImplCopyWithImpl<$Res>
    extends _$AboutStateCopyWithImpl<$Res, _$AboutLoadingImpl>
    implements _$$AboutLoadingImplCopyWith<$Res> {
  __$$AboutLoadingImplCopyWithImpl(
      _$AboutLoadingImpl _value, $Res Function(_$AboutLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of AboutState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AboutLoadingImpl implements AboutLoading {
  const _$AboutLoadingImpl();

  @override
  String toString() {
    return 'AboutState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AboutLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(AboutInfo info) loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(AboutInfo info)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(AboutInfo info)? loaded,
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
    required TResult Function(AboutInitial value) initial,
    required TResult Function(AboutLoading value) loading,
    required TResult Function(AboutLoaded value) loaded,
    required TResult Function(AboutError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AboutInitial value)? initial,
    TResult? Function(AboutLoading value)? loading,
    TResult? Function(AboutLoaded value)? loaded,
    TResult? Function(AboutError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AboutInitial value)? initial,
    TResult Function(AboutLoading value)? loading,
    TResult Function(AboutLoaded value)? loaded,
    TResult Function(AboutError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class AboutLoading implements AboutState {
  const factory AboutLoading() = _$AboutLoadingImpl;
}

/// @nodoc
abstract class _$$AboutLoadedImplCopyWith<$Res> {
  factory _$$AboutLoadedImplCopyWith(
          _$AboutLoadedImpl value, $Res Function(_$AboutLoadedImpl) then) =
      __$$AboutLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AboutInfo info});
}

/// @nodoc
class __$$AboutLoadedImplCopyWithImpl<$Res>
    extends _$AboutStateCopyWithImpl<$Res, _$AboutLoadedImpl>
    implements _$$AboutLoadedImplCopyWith<$Res> {
  __$$AboutLoadedImplCopyWithImpl(
      _$AboutLoadedImpl _value, $Res Function(_$AboutLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AboutState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? info = null,
  }) {
    return _then(_$AboutLoadedImpl(
      null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as AboutInfo,
    ));
  }
}

/// @nodoc

class _$AboutLoadedImpl implements AboutLoaded {
  const _$AboutLoadedImpl(this.info);

  @override
  final AboutInfo info;

  @override
  String toString() {
    return 'AboutState.loaded(info: $info)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AboutLoadedImpl &&
            (identical(other.info, info) || other.info == info));
  }

  @override
  int get hashCode => Object.hash(runtimeType, info);

  /// Create a copy of AboutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AboutLoadedImplCopyWith<_$AboutLoadedImpl> get copyWith =>
      __$$AboutLoadedImplCopyWithImpl<_$AboutLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(AboutInfo info) loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(info);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(AboutInfo info)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(info);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(AboutInfo info)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(info);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AboutInitial value) initial,
    required TResult Function(AboutLoading value) loading,
    required TResult Function(AboutLoaded value) loaded,
    required TResult Function(AboutError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AboutInitial value)? initial,
    TResult? Function(AboutLoading value)? loading,
    TResult? Function(AboutLoaded value)? loaded,
    TResult? Function(AboutError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AboutInitial value)? initial,
    TResult Function(AboutLoading value)? loading,
    TResult Function(AboutLoaded value)? loaded,
    TResult Function(AboutError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class AboutLoaded implements AboutState {
  const factory AboutLoaded(final AboutInfo info) = _$AboutLoadedImpl;

  AboutInfo get info;

  /// Create a copy of AboutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AboutLoadedImplCopyWith<_$AboutLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AboutErrorImplCopyWith<$Res> {
  factory _$$AboutErrorImplCopyWith(
          _$AboutErrorImpl value, $Res Function(_$AboutErrorImpl) then) =
      __$$AboutErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$AboutErrorImplCopyWithImpl<$Res>
    extends _$AboutStateCopyWithImpl<$Res, _$AboutErrorImpl>
    implements _$$AboutErrorImplCopyWith<$Res> {
  __$$AboutErrorImplCopyWithImpl(
      _$AboutErrorImpl _value, $Res Function(_$AboutErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of AboutState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$AboutErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AboutErrorImpl implements AboutError {
  const _$AboutErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'AboutState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AboutErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AboutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AboutErrorImplCopyWith<_$AboutErrorImpl> get copyWith =>
      __$$AboutErrorImplCopyWithImpl<_$AboutErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(AboutInfo info) loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(AboutInfo info)? loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(AboutInfo info)? loaded,
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
    required TResult Function(AboutInitial value) initial,
    required TResult Function(AboutLoading value) loading,
    required TResult Function(AboutLoaded value) loaded,
    required TResult Function(AboutError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AboutInitial value)? initial,
    TResult? Function(AboutLoading value)? loading,
    TResult? Function(AboutLoaded value)? loaded,
    TResult? Function(AboutError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AboutInitial value)? initial,
    TResult Function(AboutLoading value)? loading,
    TResult Function(AboutLoaded value)? loaded,
    TResult Function(AboutError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class AboutError implements AboutState {
  const factory AboutError(final String message) = _$AboutErrorImpl;

  String get message;

  /// Create a copy of AboutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AboutErrorImplCopyWith<_$AboutErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
