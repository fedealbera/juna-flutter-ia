// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'send_sos_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SendSosRequestDto _$SendSosRequestDtoFromJson(Map<String, dynamic> json) {
  return _SendSosRequestDto.fromJson(json);
}

/// @nodoc
mixin _$SendSosRequestDto {
  @JsonKey(name: 'parti_id')
  String? get partiId => throw _privateConstructorUsedError;
  @JsonKey(name: 'evento_id')
  String? get eventoId => throw _privateConstructorUsedError;
  @JsonKey(name: 'org_id')
  String? get orgId => throw _privateConstructorUsedError;
  @JsonKey(name: 'latitud')
  String? get latitud => throw _privateConstructorUsedError;
  @JsonKey(name: 'longitud')
  String? get longitud => throw _privateConstructorUsedError;

  /// Serializes this SendSosRequestDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SendSosRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SendSosRequestDtoCopyWith<SendSosRequestDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendSosRequestDtoCopyWith<$Res> {
  factory $SendSosRequestDtoCopyWith(
          SendSosRequestDto value, $Res Function(SendSosRequestDto) then) =
      _$SendSosRequestDtoCopyWithImpl<$Res, SendSosRequestDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'parti_id') String? partiId,
      @JsonKey(name: 'evento_id') String? eventoId,
      @JsonKey(name: 'org_id') String? orgId,
      @JsonKey(name: 'latitud') String? latitud,
      @JsonKey(name: 'longitud') String? longitud});
}

/// @nodoc
class _$SendSosRequestDtoCopyWithImpl<$Res, $Val extends SendSosRequestDto>
    implements $SendSosRequestDtoCopyWith<$Res> {
  _$SendSosRequestDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SendSosRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? partiId = freezed,
    Object? eventoId = freezed,
    Object? orgId = freezed,
    Object? latitud = freezed,
    Object? longitud = freezed,
  }) {
    return _then(_value.copyWith(
      partiId: freezed == partiId
          ? _value.partiId
          : partiId // ignore: cast_nullable_to_non_nullable
              as String?,
      eventoId: freezed == eventoId
          ? _value.eventoId
          : eventoId // ignore: cast_nullable_to_non_nullable
              as String?,
      orgId: freezed == orgId
          ? _value.orgId
          : orgId // ignore: cast_nullable_to_non_nullable
              as String?,
      latitud: freezed == latitud
          ? _value.latitud
          : latitud // ignore: cast_nullable_to_non_nullable
              as String?,
      longitud: freezed == longitud
          ? _value.longitud
          : longitud // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SendSosRequestDtoImplCopyWith<$Res>
    implements $SendSosRequestDtoCopyWith<$Res> {
  factory _$$SendSosRequestDtoImplCopyWith(_$SendSosRequestDtoImpl value,
          $Res Function(_$SendSosRequestDtoImpl) then) =
      __$$SendSosRequestDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'parti_id') String? partiId,
      @JsonKey(name: 'evento_id') String? eventoId,
      @JsonKey(name: 'org_id') String? orgId,
      @JsonKey(name: 'latitud') String? latitud,
      @JsonKey(name: 'longitud') String? longitud});
}

/// @nodoc
class __$$SendSosRequestDtoImplCopyWithImpl<$Res>
    extends _$SendSosRequestDtoCopyWithImpl<$Res, _$SendSosRequestDtoImpl>
    implements _$$SendSosRequestDtoImplCopyWith<$Res> {
  __$$SendSosRequestDtoImplCopyWithImpl(_$SendSosRequestDtoImpl _value,
      $Res Function(_$SendSosRequestDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of SendSosRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? partiId = freezed,
    Object? eventoId = freezed,
    Object? orgId = freezed,
    Object? latitud = freezed,
    Object? longitud = freezed,
  }) {
    return _then(_$SendSosRequestDtoImpl(
      partiId: freezed == partiId
          ? _value.partiId
          : partiId // ignore: cast_nullable_to_non_nullable
              as String?,
      eventoId: freezed == eventoId
          ? _value.eventoId
          : eventoId // ignore: cast_nullable_to_non_nullable
              as String?,
      orgId: freezed == orgId
          ? _value.orgId
          : orgId // ignore: cast_nullable_to_non_nullable
              as String?,
      latitud: freezed == latitud
          ? _value.latitud
          : latitud // ignore: cast_nullable_to_non_nullable
              as String?,
      longitud: freezed == longitud
          ? _value.longitud
          : longitud // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SendSosRequestDtoImpl implements _SendSosRequestDto {
  const _$SendSosRequestDtoImpl(
      {@JsonKey(name: 'parti_id') this.partiId,
      @JsonKey(name: 'evento_id') this.eventoId,
      @JsonKey(name: 'org_id') this.orgId,
      @JsonKey(name: 'latitud') this.latitud,
      @JsonKey(name: 'longitud') this.longitud});

  factory _$SendSosRequestDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SendSosRequestDtoImplFromJson(json);

  @override
  @JsonKey(name: 'parti_id')
  final String? partiId;
  @override
  @JsonKey(name: 'evento_id')
  final String? eventoId;
  @override
  @JsonKey(name: 'org_id')
  final String? orgId;
  @override
  @JsonKey(name: 'latitud')
  final String? latitud;
  @override
  @JsonKey(name: 'longitud')
  final String? longitud;

  @override
  String toString() {
    return 'SendSosRequestDto(partiId: $partiId, eventoId: $eventoId, orgId: $orgId, latitud: $latitud, longitud: $longitud)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendSosRequestDtoImpl &&
            (identical(other.partiId, partiId) || other.partiId == partiId) &&
            (identical(other.eventoId, eventoId) ||
                other.eventoId == eventoId) &&
            (identical(other.orgId, orgId) || other.orgId == orgId) &&
            (identical(other.latitud, latitud) || other.latitud == latitud) &&
            (identical(other.longitud, longitud) ||
                other.longitud == longitud));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, partiId, eventoId, orgId, latitud, longitud);

  /// Create a copy of SendSosRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendSosRequestDtoImplCopyWith<_$SendSosRequestDtoImpl> get copyWith =>
      __$$SendSosRequestDtoImplCopyWithImpl<_$SendSosRequestDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SendSosRequestDtoImplToJson(
      this,
    );
  }
}

abstract class _SendSosRequestDto implements SendSosRequestDto {
  const factory _SendSosRequestDto(
          {@JsonKey(name: 'parti_id') final String? partiId,
          @JsonKey(name: 'evento_id') final String? eventoId,
          @JsonKey(name: 'org_id') final String? orgId,
          @JsonKey(name: 'latitud') final String? latitud,
          @JsonKey(name: 'longitud') final String? longitud}) =
      _$SendSosRequestDtoImpl;

  factory _SendSosRequestDto.fromJson(Map<String, dynamic> json) =
      _$SendSosRequestDtoImpl.fromJson;

  @override
  @JsonKey(name: 'parti_id')
  String? get partiId;
  @override
  @JsonKey(name: 'evento_id')
  String? get eventoId;
  @override
  @JsonKey(name: 'org_id')
  String? get orgId;
  @override
  @JsonKey(name: 'latitud')
  String? get latitud;
  @override
  @JsonKey(name: 'longitud')
  String? get longitud;

  /// Create a copy of SendSosRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SendSosRequestDtoImplCopyWith<_$SendSosRequestDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
