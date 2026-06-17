// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'content_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ContentState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(EventContent content) loaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(EventContent content)? loaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(EventContent content)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ContentInitial value) initial,
    required TResult Function(ContentLoading value) loading,
    required TResult Function(ContentLoaded value) loaded,
    required TResult Function(ContentError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ContentInitial value)? initial,
    TResult? Function(ContentLoading value)? loading,
    TResult? Function(ContentLoaded value)? loaded,
    TResult? Function(ContentError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ContentInitial value)? initial,
    TResult Function(ContentLoading value)? loading,
    TResult Function(ContentLoaded value)? loaded,
    TResult Function(ContentError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentStateCopyWith<$Res> {
  factory $ContentStateCopyWith(
          ContentState value, $Res Function(ContentState) then) =
      _$ContentStateCopyWithImpl<$Res, ContentState>;
}

/// @nodoc
class _$ContentStateCopyWithImpl<$Res, $Val extends ContentState>
    implements $ContentStateCopyWith<$Res> {
  _$ContentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ContentState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ContentInitialImplCopyWith<$Res> {
  factory _$$ContentInitialImplCopyWith(_$ContentInitialImpl value,
          $Res Function(_$ContentInitialImpl) then) =
      __$$ContentInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ContentInitialImplCopyWithImpl<$Res>
    extends _$ContentStateCopyWithImpl<$Res, _$ContentInitialImpl>
    implements _$$ContentInitialImplCopyWith<$Res> {
  __$$ContentInitialImplCopyWithImpl(
      _$ContentInitialImpl _value, $Res Function(_$ContentInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of ContentState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ContentInitialImpl implements ContentInitial {
  const _$ContentInitialImpl();

  @override
  String toString() {
    return 'ContentState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ContentInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(EventContent content) loaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(EventContent content)? loaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(EventContent content)? loaded,
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
    required TResult Function(ContentInitial value) initial,
    required TResult Function(ContentLoading value) loading,
    required TResult Function(ContentLoaded value) loaded,
    required TResult Function(ContentError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ContentInitial value)? initial,
    TResult? Function(ContentLoading value)? loading,
    TResult? Function(ContentLoaded value)? loaded,
    TResult? Function(ContentError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ContentInitial value)? initial,
    TResult Function(ContentLoading value)? loading,
    TResult Function(ContentLoaded value)? loaded,
    TResult Function(ContentError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class ContentInitial implements ContentState {
  const factory ContentInitial() = _$ContentInitialImpl;
}

/// @nodoc
abstract class _$$ContentLoadingImplCopyWith<$Res> {
  factory _$$ContentLoadingImplCopyWith(_$ContentLoadingImpl value,
          $Res Function(_$ContentLoadingImpl) then) =
      __$$ContentLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ContentLoadingImplCopyWithImpl<$Res>
    extends _$ContentStateCopyWithImpl<$Res, _$ContentLoadingImpl>
    implements _$$ContentLoadingImplCopyWith<$Res> {
  __$$ContentLoadingImplCopyWithImpl(
      _$ContentLoadingImpl _value, $Res Function(_$ContentLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ContentState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ContentLoadingImpl implements ContentLoading {
  const _$ContentLoadingImpl();

  @override
  String toString() {
    return 'ContentState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ContentLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(EventContent content) loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(EventContent content)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(EventContent content)? loaded,
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
    required TResult Function(ContentInitial value) initial,
    required TResult Function(ContentLoading value) loading,
    required TResult Function(ContentLoaded value) loaded,
    required TResult Function(ContentError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ContentInitial value)? initial,
    TResult? Function(ContentLoading value)? loading,
    TResult? Function(ContentLoaded value)? loaded,
    TResult? Function(ContentError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ContentInitial value)? initial,
    TResult Function(ContentLoading value)? loading,
    TResult Function(ContentLoaded value)? loaded,
    TResult Function(ContentError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ContentLoading implements ContentState {
  const factory ContentLoading() = _$ContentLoadingImpl;
}

/// @nodoc
abstract class _$$ContentLoadedImplCopyWith<$Res> {
  factory _$$ContentLoadedImplCopyWith(
          _$ContentLoadedImpl value, $Res Function(_$ContentLoadedImpl) then) =
      __$$ContentLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({EventContent content});
}

/// @nodoc
class __$$ContentLoadedImplCopyWithImpl<$Res>
    extends _$ContentStateCopyWithImpl<$Res, _$ContentLoadedImpl>
    implements _$$ContentLoadedImplCopyWith<$Res> {
  __$$ContentLoadedImplCopyWithImpl(
      _$ContentLoadedImpl _value, $Res Function(_$ContentLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ContentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
  }) {
    return _then(_$ContentLoadedImpl(
      null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as EventContent,
    ));
  }
}

/// @nodoc

class _$ContentLoadedImpl implements ContentLoaded {
  const _$ContentLoadedImpl(this.content);

  @override
  final EventContent content;

  @override
  String toString() {
    return 'ContentState.loaded(content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContentLoadedImpl &&
            (identical(other.content, content) || other.content == content));
  }

  @override
  int get hashCode => Object.hash(runtimeType, content);

  /// Create a copy of ContentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ContentLoadedImplCopyWith<_$ContentLoadedImpl> get copyWith =>
      __$$ContentLoadedImplCopyWithImpl<_$ContentLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(EventContent content) loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(content);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(EventContent content)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(content);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(EventContent content)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(content);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ContentInitial value) initial,
    required TResult Function(ContentLoading value) loading,
    required TResult Function(ContentLoaded value) loaded,
    required TResult Function(ContentError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ContentInitial value)? initial,
    TResult? Function(ContentLoading value)? loading,
    TResult? Function(ContentLoaded value)? loaded,
    TResult? Function(ContentError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ContentInitial value)? initial,
    TResult Function(ContentLoading value)? loading,
    TResult Function(ContentLoaded value)? loaded,
    TResult Function(ContentError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class ContentLoaded implements ContentState {
  const factory ContentLoaded(final EventContent content) = _$ContentLoadedImpl;

  EventContent get content;

  /// Create a copy of ContentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContentLoadedImplCopyWith<_$ContentLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ContentErrorImplCopyWith<$Res> {
  factory _$$ContentErrorImplCopyWith(
          _$ContentErrorImpl value, $Res Function(_$ContentErrorImpl) then) =
      __$$ContentErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ContentErrorImplCopyWithImpl<$Res>
    extends _$ContentStateCopyWithImpl<$Res, _$ContentErrorImpl>
    implements _$$ContentErrorImplCopyWith<$Res> {
  __$$ContentErrorImplCopyWithImpl(
      _$ContentErrorImpl _value, $Res Function(_$ContentErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of ContentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ContentErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ContentErrorImpl implements ContentError {
  const _$ContentErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'ContentState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContentErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of ContentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ContentErrorImplCopyWith<_$ContentErrorImpl> get copyWith =>
      __$$ContentErrorImplCopyWithImpl<_$ContentErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(EventContent content) loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(EventContent content)? loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(EventContent content)? loaded,
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
    required TResult Function(ContentInitial value) initial,
    required TResult Function(ContentLoading value) loading,
    required TResult Function(ContentLoaded value) loaded,
    required TResult Function(ContentError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ContentInitial value)? initial,
    TResult? Function(ContentLoading value)? loading,
    TResult? Function(ContentLoaded value)? loaded,
    TResult? Function(ContentError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ContentInitial value)? initial,
    TResult Function(ContentLoading value)? loading,
    TResult Function(ContentLoaded value)? loaded,
    TResult Function(ContentError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ContentError implements ContentState {
  const factory ContentError(final String message) = _$ContentErrorImpl;

  String get message;

  /// Create a copy of ContentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContentErrorImplCopyWith<_$ContentErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
