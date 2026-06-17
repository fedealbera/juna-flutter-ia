// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'emergency_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EmergencyEvent {
  String get partiId => throw _privateConstructorUsedError;
  String get eventoId => throw _privateConstructorUsedError;
  String get orgId => throw _privateConstructorUsedError;
  String get latitud => throw _privateConstructorUsedError;
  String get longitud => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String partiId, String eventoId, String orgId,
            String latitud, String longitud)
        sendSos,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String partiId, String eventoId, String orgId,
            String latitud, String longitud)?
        sendSos,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String partiId, String eventoId, String orgId,
            String latitud, String longitud)?
        sendSos,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendSos value) sendSos,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SendSos value)? sendSos,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SendSos value)? sendSos,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of EmergencyEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EmergencyEventCopyWith<EmergencyEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmergencyEventCopyWith<$Res> {
  factory $EmergencyEventCopyWith(
          EmergencyEvent value, $Res Function(EmergencyEvent) then) =
      _$EmergencyEventCopyWithImpl<$Res, EmergencyEvent>;
  @useResult
  $Res call(
      {String partiId,
      String eventoId,
      String orgId,
      String latitud,
      String longitud});
}

/// @nodoc
class _$EmergencyEventCopyWithImpl<$Res, $Val extends EmergencyEvent>
    implements $EmergencyEventCopyWith<$Res> {
  _$EmergencyEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EmergencyEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? partiId = null,
    Object? eventoId = null,
    Object? orgId = null,
    Object? latitud = null,
    Object? longitud = null,
  }) {
    return _then(_value.copyWith(
      partiId: null == partiId
          ? _value.partiId
          : partiId // ignore: cast_nullable_to_non_nullable
              as String,
      eventoId: null == eventoId
          ? _value.eventoId
          : eventoId // ignore: cast_nullable_to_non_nullable
              as String,
      orgId: null == orgId
          ? _value.orgId
          : orgId // ignore: cast_nullable_to_non_nullable
              as String,
      latitud: null == latitud
          ? _value.latitud
          : latitud // ignore: cast_nullable_to_non_nullable
              as String,
      longitud: null == longitud
          ? _value.longitud
          : longitud // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SendSosImplCopyWith<$Res>
    implements $EmergencyEventCopyWith<$Res> {
  factory _$$SendSosImplCopyWith(
          _$SendSosImpl value, $Res Function(_$SendSosImpl) then) =
      __$$SendSosImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String partiId,
      String eventoId,
      String orgId,
      String latitud,
      String longitud});
}

/// @nodoc
class __$$SendSosImplCopyWithImpl<$Res>
    extends _$EmergencyEventCopyWithImpl<$Res, _$SendSosImpl>
    implements _$$SendSosImplCopyWith<$Res> {
  __$$SendSosImplCopyWithImpl(
      _$SendSosImpl _value, $Res Function(_$SendSosImpl) _then)
      : super(_value, _then);

  /// Create a copy of EmergencyEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? partiId = null,
    Object? eventoId = null,
    Object? orgId = null,
    Object? latitud = null,
    Object? longitud = null,
  }) {
    return _then(_$SendSosImpl(
      partiId: null == partiId
          ? _value.partiId
          : partiId // ignore: cast_nullable_to_non_nullable
              as String,
      eventoId: null == eventoId
          ? _value.eventoId
          : eventoId // ignore: cast_nullable_to_non_nullable
              as String,
      orgId: null == orgId
          ? _value.orgId
          : orgId // ignore: cast_nullable_to_non_nullable
              as String,
      latitud: null == latitud
          ? _value.latitud
          : latitud // ignore: cast_nullable_to_non_nullable
              as String,
      longitud: null == longitud
          ? _value.longitud
          : longitud // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SendSosImpl implements SendSos {
  const _$SendSosImpl(
      {required this.partiId,
      required this.eventoId,
      required this.orgId,
      required this.latitud,
      required this.longitud});

  @override
  final String partiId;
  @override
  final String eventoId;
  @override
  final String orgId;
  @override
  final String latitud;
  @override
  final String longitud;

  @override
  String toString() {
    return 'EmergencyEvent.sendSos(partiId: $partiId, eventoId: $eventoId, orgId: $orgId, latitud: $latitud, longitud: $longitud)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendSosImpl &&
            (identical(other.partiId, partiId) || other.partiId == partiId) &&
            (identical(other.eventoId, eventoId) ||
                other.eventoId == eventoId) &&
            (identical(other.orgId, orgId) || other.orgId == orgId) &&
            (identical(other.latitud, latitud) || other.latitud == latitud) &&
            (identical(other.longitud, longitud) ||
                other.longitud == longitud));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, partiId, eventoId, orgId, latitud, longitud);

  /// Create a copy of EmergencyEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendSosImplCopyWith<_$SendSosImpl> get copyWith =>
      __$$SendSosImplCopyWithImpl<_$SendSosImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String partiId, String eventoId, String orgId,
            String latitud, String longitud)
        sendSos,
  }) {
    return sendSos(partiId, eventoId, orgId, latitud, longitud);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String partiId, String eventoId, String orgId,
            String latitud, String longitud)?
        sendSos,
  }) {
    return sendSos?.call(partiId, eventoId, orgId, latitud, longitud);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String partiId, String eventoId, String orgId,
            String latitud, String longitud)?
        sendSos,
    required TResult orElse(),
  }) {
    if (sendSos != null) {
      return sendSos(partiId, eventoId, orgId, latitud, longitud);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendSos value) sendSos,
  }) {
    return sendSos(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SendSos value)? sendSos,
  }) {
    return sendSos?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SendSos value)? sendSos,
    required TResult orElse(),
  }) {
    if (sendSos != null) {
      return sendSos(this);
    }
    return orElse();
  }
}

abstract class SendSos implements EmergencyEvent {
  const factory SendSos(
      {required final String partiId,
      required final String eventoId,
      required final String orgId,
      required final String latitud,
      required final String longitud}) = _$SendSosImpl;

  @override
  String get partiId;
  @override
  String get eventoId;
  @override
  String get orgId;
  @override
  String get latitud;
  @override
  String get longitud;

  /// Create a copy of EmergencyEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SendSosImplCopyWith<_$SendSosImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
