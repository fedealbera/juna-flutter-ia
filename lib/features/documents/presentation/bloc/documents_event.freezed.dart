// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'documents_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DocumentsEvent {
  String get partiId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String partiId) getDocuments,
    required TResult Function(String tipo, String partiId, File file)
        uploadDocument,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String partiId)? getDocuments,
    TResult? Function(String tipo, String partiId, File file)? uploadDocument,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String partiId)? getDocuments,
    TResult Function(String tipo, String partiId, File file)? uploadDocument,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchDocuments value) getDocuments,
    required TResult Function(UploadDocumentEvent value) uploadDocument,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchDocuments value)? getDocuments,
    TResult? Function(UploadDocumentEvent value)? uploadDocument,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchDocuments value)? getDocuments,
    TResult Function(UploadDocumentEvent value)? uploadDocument,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of DocumentsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DocumentsEventCopyWith<DocumentsEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DocumentsEventCopyWith<$Res> {
  factory $DocumentsEventCopyWith(
          DocumentsEvent value, $Res Function(DocumentsEvent) then) =
      _$DocumentsEventCopyWithImpl<$Res, DocumentsEvent>;
  @useResult
  $Res call({String partiId});
}

/// @nodoc
class _$DocumentsEventCopyWithImpl<$Res, $Val extends DocumentsEvent>
    implements $DocumentsEventCopyWith<$Res> {
  _$DocumentsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DocumentsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? partiId = null,
  }) {
    return _then(_value.copyWith(
      partiId: null == partiId
          ? _value.partiId
          : partiId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FetchDocumentsImplCopyWith<$Res>
    implements $DocumentsEventCopyWith<$Res> {
  factory _$$FetchDocumentsImplCopyWith(_$FetchDocumentsImpl value,
          $Res Function(_$FetchDocumentsImpl) then) =
      __$$FetchDocumentsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String partiId});
}

/// @nodoc
class __$$FetchDocumentsImplCopyWithImpl<$Res>
    extends _$DocumentsEventCopyWithImpl<$Res, _$FetchDocumentsImpl>
    implements _$$FetchDocumentsImplCopyWith<$Res> {
  __$$FetchDocumentsImplCopyWithImpl(
      _$FetchDocumentsImpl _value, $Res Function(_$FetchDocumentsImpl) _then)
      : super(_value, _then);

  /// Create a copy of DocumentsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? partiId = null,
  }) {
    return _then(_$FetchDocumentsImpl(
      partiId: null == partiId
          ? _value.partiId
          : partiId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FetchDocumentsImpl implements FetchDocuments {
  const _$FetchDocumentsImpl({required this.partiId});

  @override
  final String partiId;

  @override
  String toString() {
    return 'DocumentsEvent.getDocuments(partiId: $partiId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchDocumentsImpl &&
            (identical(other.partiId, partiId) || other.partiId == partiId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, partiId);

  /// Create a copy of DocumentsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchDocumentsImplCopyWith<_$FetchDocumentsImpl> get copyWith =>
      __$$FetchDocumentsImplCopyWithImpl<_$FetchDocumentsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String partiId) getDocuments,
    required TResult Function(String tipo, String partiId, File file)
        uploadDocument,
  }) {
    return getDocuments(partiId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String partiId)? getDocuments,
    TResult? Function(String tipo, String partiId, File file)? uploadDocument,
  }) {
    return getDocuments?.call(partiId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String partiId)? getDocuments,
    TResult Function(String tipo, String partiId, File file)? uploadDocument,
    required TResult orElse(),
  }) {
    if (getDocuments != null) {
      return getDocuments(partiId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchDocuments value) getDocuments,
    required TResult Function(UploadDocumentEvent value) uploadDocument,
  }) {
    return getDocuments(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchDocuments value)? getDocuments,
    TResult? Function(UploadDocumentEvent value)? uploadDocument,
  }) {
    return getDocuments?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchDocuments value)? getDocuments,
    TResult Function(UploadDocumentEvent value)? uploadDocument,
    required TResult orElse(),
  }) {
    if (getDocuments != null) {
      return getDocuments(this);
    }
    return orElse();
  }
}

abstract class FetchDocuments implements DocumentsEvent {
  const factory FetchDocuments({required final String partiId}) =
      _$FetchDocumentsImpl;

  @override
  String get partiId;

  /// Create a copy of DocumentsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchDocumentsImplCopyWith<_$FetchDocumentsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UploadDocumentEventImplCopyWith<$Res>
    implements $DocumentsEventCopyWith<$Res> {
  factory _$$UploadDocumentEventImplCopyWith(_$UploadDocumentEventImpl value,
          $Res Function(_$UploadDocumentEventImpl) then) =
      __$$UploadDocumentEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String tipo, String partiId, File file});
}

/// @nodoc
class __$$UploadDocumentEventImplCopyWithImpl<$Res>
    extends _$DocumentsEventCopyWithImpl<$Res, _$UploadDocumentEventImpl>
    implements _$$UploadDocumentEventImplCopyWith<$Res> {
  __$$UploadDocumentEventImplCopyWithImpl(_$UploadDocumentEventImpl _value,
      $Res Function(_$UploadDocumentEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of DocumentsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tipo = null,
    Object? partiId = null,
    Object? file = null,
  }) {
    return _then(_$UploadDocumentEventImpl(
      tipo: null == tipo
          ? _value.tipo
          : tipo // ignore: cast_nullable_to_non_nullable
              as String,
      partiId: null == partiId
          ? _value.partiId
          : partiId // ignore: cast_nullable_to_non_nullable
              as String,
      file: null == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as File,
    ));
  }
}

/// @nodoc

class _$UploadDocumentEventImpl implements UploadDocumentEvent {
  const _$UploadDocumentEventImpl(
      {required this.tipo, required this.partiId, required this.file});

  @override
  final String tipo;
  @override
  final String partiId;
  @override
  final File file;

  @override
  String toString() {
    return 'DocumentsEvent.uploadDocument(tipo: $tipo, partiId: $partiId, file: $file)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadDocumentEventImpl &&
            (identical(other.tipo, tipo) || other.tipo == tipo) &&
            (identical(other.partiId, partiId) || other.partiId == partiId) &&
            (identical(other.file, file) || other.file == file));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tipo, partiId, file);

  /// Create a copy of DocumentsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadDocumentEventImplCopyWith<_$UploadDocumentEventImpl> get copyWith =>
      __$$UploadDocumentEventImplCopyWithImpl<_$UploadDocumentEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String partiId) getDocuments,
    required TResult Function(String tipo, String partiId, File file)
        uploadDocument,
  }) {
    return uploadDocument(tipo, partiId, file);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String partiId)? getDocuments,
    TResult? Function(String tipo, String partiId, File file)? uploadDocument,
  }) {
    return uploadDocument?.call(tipo, partiId, file);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String partiId)? getDocuments,
    TResult Function(String tipo, String partiId, File file)? uploadDocument,
    required TResult orElse(),
  }) {
    if (uploadDocument != null) {
      return uploadDocument(tipo, partiId, file);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchDocuments value) getDocuments,
    required TResult Function(UploadDocumentEvent value) uploadDocument,
  }) {
    return uploadDocument(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchDocuments value)? getDocuments,
    TResult? Function(UploadDocumentEvent value)? uploadDocument,
  }) {
    return uploadDocument?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchDocuments value)? getDocuments,
    TResult Function(UploadDocumentEvent value)? uploadDocument,
    required TResult orElse(),
  }) {
    if (uploadDocument != null) {
      return uploadDocument(this);
    }
    return orElse();
  }
}

abstract class UploadDocumentEvent implements DocumentsEvent {
  const factory UploadDocumentEvent(
      {required final String tipo,
      required final String partiId,
      required final File file}) = _$UploadDocumentEventImpl;

  String get tipo;
  @override
  String get partiId;
  File get file;

  /// Create a copy of DocumentsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UploadDocumentEventImplCopyWith<_$UploadDocumentEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
