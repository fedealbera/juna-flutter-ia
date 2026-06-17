// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'content_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ContentEvent {
  String get eventId => throw _privateConstructorUsedError;
  String get idOrg => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String eventId, String idOrg) getEventContent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String eventId, String idOrg)? getEventContent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String eventId, String idOrg)? getEventContent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchContent value) getEventContent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchContent value)? getEventContent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchContent value)? getEventContent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of ContentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ContentEventCopyWith<ContentEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentEventCopyWith<$Res> {
  factory $ContentEventCopyWith(
          ContentEvent value, $Res Function(ContentEvent) then) =
      _$ContentEventCopyWithImpl<$Res, ContentEvent>;
  @useResult
  $Res call({String eventId, String idOrg});
}

/// @nodoc
class _$ContentEventCopyWithImpl<$Res, $Val extends ContentEvent>
    implements $ContentEventCopyWith<$Res> {
  _$ContentEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ContentEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? idOrg = null,
  }) {
    return _then(_value.copyWith(
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      idOrg: null == idOrg
          ? _value.idOrg
          : idOrg // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FetchContentImplCopyWith<$Res>
    implements $ContentEventCopyWith<$Res> {
  factory _$$FetchContentImplCopyWith(
          _$FetchContentImpl value, $Res Function(_$FetchContentImpl) then) =
      __$$FetchContentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String eventId, String idOrg});
}

/// @nodoc
class __$$FetchContentImplCopyWithImpl<$Res>
    extends _$ContentEventCopyWithImpl<$Res, _$FetchContentImpl>
    implements _$$FetchContentImplCopyWith<$Res> {
  __$$FetchContentImplCopyWithImpl(
      _$FetchContentImpl _value, $Res Function(_$FetchContentImpl) _then)
      : super(_value, _then);

  /// Create a copy of ContentEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? idOrg = null,
  }) {
    return _then(_$FetchContentImpl(
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      idOrg: null == idOrg
          ? _value.idOrg
          : idOrg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FetchContentImpl implements FetchContent {
  const _$FetchContentImpl({required this.eventId, required this.idOrg});

  @override
  final String eventId;
  @override
  final String idOrg;

  @override
  String toString() {
    return 'ContentEvent.getEventContent(eventId: $eventId, idOrg: $idOrg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchContentImpl &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.idOrg, idOrg) || other.idOrg == idOrg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, eventId, idOrg);

  /// Create a copy of ContentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchContentImplCopyWith<_$FetchContentImpl> get copyWith =>
      __$$FetchContentImplCopyWithImpl<_$FetchContentImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String eventId, String idOrg) getEventContent,
  }) {
    return getEventContent(eventId, idOrg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String eventId, String idOrg)? getEventContent,
  }) {
    return getEventContent?.call(eventId, idOrg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String eventId, String idOrg)? getEventContent,
    required TResult orElse(),
  }) {
    if (getEventContent != null) {
      return getEventContent(eventId, idOrg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchContent value) getEventContent,
  }) {
    return getEventContent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchContent value)? getEventContent,
  }) {
    return getEventContent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchContent value)? getEventContent,
    required TResult orElse(),
  }) {
    if (getEventContent != null) {
      return getEventContent(this);
    }
    return orElse();
  }
}

abstract class FetchContent implements ContentEvent {
  const factory FetchContent(
      {required final String eventId,
      required final String idOrg}) = _$FetchContentImpl;

  @override
  String get eventId;
  @override
  String get idOrg;

  /// Create a copy of ContentEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchContentImplCopyWith<_$FetchContentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
