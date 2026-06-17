// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'documents_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DocumentsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ParticipantFile> files) loaded,
    required TResult Function(UploadFileResult result) uploaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ParticipantFile> files)? loaded,
    TResult? Function(UploadFileResult result)? uploaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ParticipantFile> files)? loaded,
    TResult Function(UploadFileResult result)? uploaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DocumentsInitial value) initial,
    required TResult Function(DocumentsLoading value) loading,
    required TResult Function(DocumentsLoaded value) loaded,
    required TResult Function(DocumentsUploaded value) uploaded,
    required TResult Function(DocumentsError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DocumentsInitial value)? initial,
    TResult? Function(DocumentsLoading value)? loading,
    TResult? Function(DocumentsLoaded value)? loaded,
    TResult? Function(DocumentsUploaded value)? uploaded,
    TResult? Function(DocumentsError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DocumentsInitial value)? initial,
    TResult Function(DocumentsLoading value)? loading,
    TResult Function(DocumentsLoaded value)? loaded,
    TResult Function(DocumentsUploaded value)? uploaded,
    TResult Function(DocumentsError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DocumentsStateCopyWith<$Res> {
  factory $DocumentsStateCopyWith(
          DocumentsState value, $Res Function(DocumentsState) then) =
      _$DocumentsStateCopyWithImpl<$Res, DocumentsState>;
}

/// @nodoc
class _$DocumentsStateCopyWithImpl<$Res, $Val extends DocumentsState>
    implements $DocumentsStateCopyWith<$Res> {
  _$DocumentsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DocumentsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$DocumentsInitialImplCopyWith<$Res> {
  factory _$$DocumentsInitialImplCopyWith(_$DocumentsInitialImpl value,
          $Res Function(_$DocumentsInitialImpl) then) =
      __$$DocumentsInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DocumentsInitialImplCopyWithImpl<$Res>
    extends _$DocumentsStateCopyWithImpl<$Res, _$DocumentsInitialImpl>
    implements _$$DocumentsInitialImplCopyWith<$Res> {
  __$$DocumentsInitialImplCopyWithImpl(_$DocumentsInitialImpl _value,
      $Res Function(_$DocumentsInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of DocumentsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DocumentsInitialImpl implements DocumentsInitial {
  const _$DocumentsInitialImpl();

  @override
  String toString() {
    return 'DocumentsState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DocumentsInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ParticipantFile> files) loaded,
    required TResult Function(UploadFileResult result) uploaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ParticipantFile> files)? loaded,
    TResult? Function(UploadFileResult result)? uploaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ParticipantFile> files)? loaded,
    TResult Function(UploadFileResult result)? uploaded,
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
    required TResult Function(DocumentsInitial value) initial,
    required TResult Function(DocumentsLoading value) loading,
    required TResult Function(DocumentsLoaded value) loaded,
    required TResult Function(DocumentsUploaded value) uploaded,
    required TResult Function(DocumentsError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DocumentsInitial value)? initial,
    TResult? Function(DocumentsLoading value)? loading,
    TResult? Function(DocumentsLoaded value)? loaded,
    TResult? Function(DocumentsUploaded value)? uploaded,
    TResult? Function(DocumentsError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DocumentsInitial value)? initial,
    TResult Function(DocumentsLoading value)? loading,
    TResult Function(DocumentsLoaded value)? loaded,
    TResult Function(DocumentsUploaded value)? uploaded,
    TResult Function(DocumentsError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class DocumentsInitial implements DocumentsState {
  const factory DocumentsInitial() = _$DocumentsInitialImpl;
}

/// @nodoc
abstract class _$$DocumentsLoadingImplCopyWith<$Res> {
  factory _$$DocumentsLoadingImplCopyWith(_$DocumentsLoadingImpl value,
          $Res Function(_$DocumentsLoadingImpl) then) =
      __$$DocumentsLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DocumentsLoadingImplCopyWithImpl<$Res>
    extends _$DocumentsStateCopyWithImpl<$Res, _$DocumentsLoadingImpl>
    implements _$$DocumentsLoadingImplCopyWith<$Res> {
  __$$DocumentsLoadingImplCopyWithImpl(_$DocumentsLoadingImpl _value,
      $Res Function(_$DocumentsLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of DocumentsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DocumentsLoadingImpl implements DocumentsLoading {
  const _$DocumentsLoadingImpl();

  @override
  String toString() {
    return 'DocumentsState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DocumentsLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ParticipantFile> files) loaded,
    required TResult Function(UploadFileResult result) uploaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ParticipantFile> files)? loaded,
    TResult? Function(UploadFileResult result)? uploaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ParticipantFile> files)? loaded,
    TResult Function(UploadFileResult result)? uploaded,
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
    required TResult Function(DocumentsInitial value) initial,
    required TResult Function(DocumentsLoading value) loading,
    required TResult Function(DocumentsLoaded value) loaded,
    required TResult Function(DocumentsUploaded value) uploaded,
    required TResult Function(DocumentsError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DocumentsInitial value)? initial,
    TResult? Function(DocumentsLoading value)? loading,
    TResult? Function(DocumentsLoaded value)? loaded,
    TResult? Function(DocumentsUploaded value)? uploaded,
    TResult? Function(DocumentsError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DocumentsInitial value)? initial,
    TResult Function(DocumentsLoading value)? loading,
    TResult Function(DocumentsLoaded value)? loaded,
    TResult Function(DocumentsUploaded value)? uploaded,
    TResult Function(DocumentsError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class DocumentsLoading implements DocumentsState {
  const factory DocumentsLoading() = _$DocumentsLoadingImpl;
}

/// @nodoc
abstract class _$$DocumentsLoadedImplCopyWith<$Res> {
  factory _$$DocumentsLoadedImplCopyWith(_$DocumentsLoadedImpl value,
          $Res Function(_$DocumentsLoadedImpl) then) =
      __$$DocumentsLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ParticipantFile> files});
}

/// @nodoc
class __$$DocumentsLoadedImplCopyWithImpl<$Res>
    extends _$DocumentsStateCopyWithImpl<$Res, _$DocumentsLoadedImpl>
    implements _$$DocumentsLoadedImplCopyWith<$Res> {
  __$$DocumentsLoadedImplCopyWithImpl(
      _$DocumentsLoadedImpl _value, $Res Function(_$DocumentsLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of DocumentsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? files = null,
  }) {
    return _then(_$DocumentsLoadedImpl(
      null == files
          ? _value._files
          : files // ignore: cast_nullable_to_non_nullable
              as List<ParticipantFile>,
    ));
  }
}

/// @nodoc

class _$DocumentsLoadedImpl implements DocumentsLoaded {
  const _$DocumentsLoadedImpl(final List<ParticipantFile> files)
      : _files = files;

  final List<ParticipantFile> _files;
  @override
  List<ParticipantFile> get files {
    if (_files is EqualUnmodifiableListView) return _files;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_files);
  }

  @override
  String toString() {
    return 'DocumentsState.loaded(files: $files)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DocumentsLoadedImpl &&
            const DeepCollectionEquality().equals(other._files, _files));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_files));

  /// Create a copy of DocumentsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DocumentsLoadedImplCopyWith<_$DocumentsLoadedImpl> get copyWith =>
      __$$DocumentsLoadedImplCopyWithImpl<_$DocumentsLoadedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ParticipantFile> files) loaded,
    required TResult Function(UploadFileResult result) uploaded,
    required TResult Function(String message) error,
  }) {
    return loaded(files);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ParticipantFile> files)? loaded,
    TResult? Function(UploadFileResult result)? uploaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(files);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ParticipantFile> files)? loaded,
    TResult Function(UploadFileResult result)? uploaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(files);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DocumentsInitial value) initial,
    required TResult Function(DocumentsLoading value) loading,
    required TResult Function(DocumentsLoaded value) loaded,
    required TResult Function(DocumentsUploaded value) uploaded,
    required TResult Function(DocumentsError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DocumentsInitial value)? initial,
    TResult? Function(DocumentsLoading value)? loading,
    TResult? Function(DocumentsLoaded value)? loaded,
    TResult? Function(DocumentsUploaded value)? uploaded,
    TResult? Function(DocumentsError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DocumentsInitial value)? initial,
    TResult Function(DocumentsLoading value)? loading,
    TResult Function(DocumentsLoaded value)? loaded,
    TResult Function(DocumentsUploaded value)? uploaded,
    TResult Function(DocumentsError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class DocumentsLoaded implements DocumentsState {
  const factory DocumentsLoaded(final List<ParticipantFile> files) =
      _$DocumentsLoadedImpl;

  List<ParticipantFile> get files;

  /// Create a copy of DocumentsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DocumentsLoadedImplCopyWith<_$DocumentsLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DocumentsUploadedImplCopyWith<$Res> {
  factory _$$DocumentsUploadedImplCopyWith(_$DocumentsUploadedImpl value,
          $Res Function(_$DocumentsUploadedImpl) then) =
      __$$DocumentsUploadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UploadFileResult result});
}

/// @nodoc
class __$$DocumentsUploadedImplCopyWithImpl<$Res>
    extends _$DocumentsStateCopyWithImpl<$Res, _$DocumentsUploadedImpl>
    implements _$$DocumentsUploadedImplCopyWith<$Res> {
  __$$DocumentsUploadedImplCopyWithImpl(_$DocumentsUploadedImpl _value,
      $Res Function(_$DocumentsUploadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of DocumentsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
  }) {
    return _then(_$DocumentsUploadedImpl(
      null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as UploadFileResult,
    ));
  }
}

/// @nodoc

class _$DocumentsUploadedImpl implements DocumentsUploaded {
  const _$DocumentsUploadedImpl(this.result);

  @override
  final UploadFileResult result;

  @override
  String toString() {
    return 'DocumentsState.uploaded(result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DocumentsUploadedImpl &&
            (identical(other.result, result) || other.result == result));
  }

  @override
  int get hashCode => Object.hash(runtimeType, result);

  /// Create a copy of DocumentsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DocumentsUploadedImplCopyWith<_$DocumentsUploadedImpl> get copyWith =>
      __$$DocumentsUploadedImplCopyWithImpl<_$DocumentsUploadedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ParticipantFile> files) loaded,
    required TResult Function(UploadFileResult result) uploaded,
    required TResult Function(String message) error,
  }) {
    return uploaded(result);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ParticipantFile> files)? loaded,
    TResult? Function(UploadFileResult result)? uploaded,
    TResult? Function(String message)? error,
  }) {
    return uploaded?.call(result);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ParticipantFile> files)? loaded,
    TResult Function(UploadFileResult result)? uploaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (uploaded != null) {
      return uploaded(result);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DocumentsInitial value) initial,
    required TResult Function(DocumentsLoading value) loading,
    required TResult Function(DocumentsLoaded value) loaded,
    required TResult Function(DocumentsUploaded value) uploaded,
    required TResult Function(DocumentsError value) error,
  }) {
    return uploaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DocumentsInitial value)? initial,
    TResult? Function(DocumentsLoading value)? loading,
    TResult? Function(DocumentsLoaded value)? loaded,
    TResult? Function(DocumentsUploaded value)? uploaded,
    TResult? Function(DocumentsError value)? error,
  }) {
    return uploaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DocumentsInitial value)? initial,
    TResult Function(DocumentsLoading value)? loading,
    TResult Function(DocumentsLoaded value)? loaded,
    TResult Function(DocumentsUploaded value)? uploaded,
    TResult Function(DocumentsError value)? error,
    required TResult orElse(),
  }) {
    if (uploaded != null) {
      return uploaded(this);
    }
    return orElse();
  }
}

abstract class DocumentsUploaded implements DocumentsState {
  const factory DocumentsUploaded(final UploadFileResult result) =
      _$DocumentsUploadedImpl;

  UploadFileResult get result;

  /// Create a copy of DocumentsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DocumentsUploadedImplCopyWith<_$DocumentsUploadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DocumentsErrorImplCopyWith<$Res> {
  factory _$$DocumentsErrorImplCopyWith(_$DocumentsErrorImpl value,
          $Res Function(_$DocumentsErrorImpl) then) =
      __$$DocumentsErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$DocumentsErrorImplCopyWithImpl<$Res>
    extends _$DocumentsStateCopyWithImpl<$Res, _$DocumentsErrorImpl>
    implements _$$DocumentsErrorImplCopyWith<$Res> {
  __$$DocumentsErrorImplCopyWithImpl(
      _$DocumentsErrorImpl _value, $Res Function(_$DocumentsErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of DocumentsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$DocumentsErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DocumentsErrorImpl implements DocumentsError {
  const _$DocumentsErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'DocumentsState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DocumentsErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of DocumentsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DocumentsErrorImplCopyWith<_$DocumentsErrorImpl> get copyWith =>
      __$$DocumentsErrorImplCopyWithImpl<_$DocumentsErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ParticipantFile> files) loaded,
    required TResult Function(UploadFileResult result) uploaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ParticipantFile> files)? loaded,
    TResult? Function(UploadFileResult result)? uploaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ParticipantFile> files)? loaded,
    TResult Function(UploadFileResult result)? uploaded,
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
    required TResult Function(DocumentsInitial value) initial,
    required TResult Function(DocumentsLoading value) loading,
    required TResult Function(DocumentsLoaded value) loaded,
    required TResult Function(DocumentsUploaded value) uploaded,
    required TResult Function(DocumentsError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DocumentsInitial value)? initial,
    TResult? Function(DocumentsLoading value)? loading,
    TResult? Function(DocumentsLoaded value)? loaded,
    TResult? Function(DocumentsUploaded value)? uploaded,
    TResult? Function(DocumentsError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DocumentsInitial value)? initial,
    TResult Function(DocumentsLoading value)? loading,
    TResult Function(DocumentsLoaded value)? loaded,
    TResult Function(DocumentsUploaded value)? uploaded,
    TResult Function(DocumentsError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class DocumentsError implements DocumentsState {
  const factory DocumentsError(final String message) = _$DocumentsErrorImpl;

  String get message;

  /// Create a copy of DocumentsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DocumentsErrorImplCopyWith<_$DocumentsErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
