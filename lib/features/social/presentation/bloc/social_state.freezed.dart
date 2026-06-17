// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'social_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SocialState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(SocialLinks links) loaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(SocialLinks links)? loaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(SocialLinks links)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SocialInitial value) initial,
    required TResult Function(SocialLoading value) loading,
    required TResult Function(SocialLoaded value) loaded,
    required TResult Function(SocialError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SocialInitial value)? initial,
    TResult? Function(SocialLoading value)? loading,
    TResult? Function(SocialLoaded value)? loaded,
    TResult? Function(SocialError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SocialInitial value)? initial,
    TResult Function(SocialLoading value)? loading,
    TResult Function(SocialLoaded value)? loaded,
    TResult Function(SocialError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SocialStateCopyWith<$Res> {
  factory $SocialStateCopyWith(
          SocialState value, $Res Function(SocialState) then) =
      _$SocialStateCopyWithImpl<$Res, SocialState>;
}

/// @nodoc
class _$SocialStateCopyWithImpl<$Res, $Val extends SocialState>
    implements $SocialStateCopyWith<$Res> {
  _$SocialStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SocialState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SocialInitialImplCopyWith<$Res> {
  factory _$$SocialInitialImplCopyWith(
          _$SocialInitialImpl value, $Res Function(_$SocialInitialImpl) then) =
      __$$SocialInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SocialInitialImplCopyWithImpl<$Res>
    extends _$SocialStateCopyWithImpl<$Res, _$SocialInitialImpl>
    implements _$$SocialInitialImplCopyWith<$Res> {
  __$$SocialInitialImplCopyWithImpl(
      _$SocialInitialImpl _value, $Res Function(_$SocialInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of SocialState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SocialInitialImpl implements SocialInitial {
  const _$SocialInitialImpl();

  @override
  String toString() {
    return 'SocialState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SocialInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(SocialLinks links) loaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(SocialLinks links)? loaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(SocialLinks links)? loaded,
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
    required TResult Function(SocialInitial value) initial,
    required TResult Function(SocialLoading value) loading,
    required TResult Function(SocialLoaded value) loaded,
    required TResult Function(SocialError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SocialInitial value)? initial,
    TResult? Function(SocialLoading value)? loading,
    TResult? Function(SocialLoaded value)? loaded,
    TResult? Function(SocialError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SocialInitial value)? initial,
    TResult Function(SocialLoading value)? loading,
    TResult Function(SocialLoaded value)? loaded,
    TResult Function(SocialError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class SocialInitial implements SocialState {
  const factory SocialInitial() = _$SocialInitialImpl;
}

/// @nodoc
abstract class _$$SocialLoadingImplCopyWith<$Res> {
  factory _$$SocialLoadingImplCopyWith(
          _$SocialLoadingImpl value, $Res Function(_$SocialLoadingImpl) then) =
      __$$SocialLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SocialLoadingImplCopyWithImpl<$Res>
    extends _$SocialStateCopyWithImpl<$Res, _$SocialLoadingImpl>
    implements _$$SocialLoadingImplCopyWith<$Res> {
  __$$SocialLoadingImplCopyWithImpl(
      _$SocialLoadingImpl _value, $Res Function(_$SocialLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of SocialState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SocialLoadingImpl implements SocialLoading {
  const _$SocialLoadingImpl();

  @override
  String toString() {
    return 'SocialState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SocialLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(SocialLinks links) loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(SocialLinks links)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(SocialLinks links)? loaded,
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
    required TResult Function(SocialInitial value) initial,
    required TResult Function(SocialLoading value) loading,
    required TResult Function(SocialLoaded value) loaded,
    required TResult Function(SocialError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SocialInitial value)? initial,
    TResult? Function(SocialLoading value)? loading,
    TResult? Function(SocialLoaded value)? loaded,
    TResult? Function(SocialError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SocialInitial value)? initial,
    TResult Function(SocialLoading value)? loading,
    TResult Function(SocialLoaded value)? loaded,
    TResult Function(SocialError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class SocialLoading implements SocialState {
  const factory SocialLoading() = _$SocialLoadingImpl;
}

/// @nodoc
abstract class _$$SocialLoadedImplCopyWith<$Res> {
  factory _$$SocialLoadedImplCopyWith(
          _$SocialLoadedImpl value, $Res Function(_$SocialLoadedImpl) then) =
      __$$SocialLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SocialLinks links});
}

/// @nodoc
class __$$SocialLoadedImplCopyWithImpl<$Res>
    extends _$SocialStateCopyWithImpl<$Res, _$SocialLoadedImpl>
    implements _$$SocialLoadedImplCopyWith<$Res> {
  __$$SocialLoadedImplCopyWithImpl(
      _$SocialLoadedImpl _value, $Res Function(_$SocialLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of SocialState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? links = null,
  }) {
    return _then(_$SocialLoadedImpl(
      null == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as SocialLinks,
    ));
  }
}

/// @nodoc

class _$SocialLoadedImpl implements SocialLoaded {
  const _$SocialLoadedImpl(this.links);

  @override
  final SocialLinks links;

  @override
  String toString() {
    return 'SocialState.loaded(links: $links)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SocialLoadedImpl &&
            (identical(other.links, links) || other.links == links));
  }

  @override
  int get hashCode => Object.hash(runtimeType, links);

  /// Create a copy of SocialState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SocialLoadedImplCopyWith<_$SocialLoadedImpl> get copyWith =>
      __$$SocialLoadedImplCopyWithImpl<_$SocialLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(SocialLinks links) loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(links);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(SocialLinks links)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(links);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(SocialLinks links)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(links);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SocialInitial value) initial,
    required TResult Function(SocialLoading value) loading,
    required TResult Function(SocialLoaded value) loaded,
    required TResult Function(SocialError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SocialInitial value)? initial,
    TResult? Function(SocialLoading value)? loading,
    TResult? Function(SocialLoaded value)? loaded,
    TResult? Function(SocialError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SocialInitial value)? initial,
    TResult Function(SocialLoading value)? loading,
    TResult Function(SocialLoaded value)? loaded,
    TResult Function(SocialError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class SocialLoaded implements SocialState {
  const factory SocialLoaded(final SocialLinks links) = _$SocialLoadedImpl;

  SocialLinks get links;

  /// Create a copy of SocialState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SocialLoadedImplCopyWith<_$SocialLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SocialErrorImplCopyWith<$Res> {
  factory _$$SocialErrorImplCopyWith(
          _$SocialErrorImpl value, $Res Function(_$SocialErrorImpl) then) =
      __$$SocialErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$SocialErrorImplCopyWithImpl<$Res>
    extends _$SocialStateCopyWithImpl<$Res, _$SocialErrorImpl>
    implements _$$SocialErrorImplCopyWith<$Res> {
  __$$SocialErrorImplCopyWithImpl(
      _$SocialErrorImpl _value, $Res Function(_$SocialErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of SocialState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$SocialErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SocialErrorImpl implements SocialError {
  const _$SocialErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'SocialState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SocialErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of SocialState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SocialErrorImplCopyWith<_$SocialErrorImpl> get copyWith =>
      __$$SocialErrorImplCopyWithImpl<_$SocialErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(SocialLinks links) loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(SocialLinks links)? loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(SocialLinks links)? loaded,
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
    required TResult Function(SocialInitial value) initial,
    required TResult Function(SocialLoading value) loading,
    required TResult Function(SocialLoaded value) loaded,
    required TResult Function(SocialError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SocialInitial value)? initial,
    TResult? Function(SocialLoading value)? loading,
    TResult? Function(SocialLoaded value)? loaded,
    TResult? Function(SocialError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SocialInitial value)? initial,
    TResult Function(SocialLoading value)? loading,
    TResult Function(SocialLoaded value)? loaded,
    TResult Function(SocialError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class SocialError implements SocialState {
  const factory SocialError(final String message) = _$SocialErrorImpl;

  String get message;

  /// Create a copy of SocialState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SocialErrorImplCopyWith<_$SocialErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
