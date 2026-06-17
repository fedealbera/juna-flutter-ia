// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_circuito_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UpdateCircuitoRequestDto _$UpdateCircuitoRequestDtoFromJson(
    Map<String, dynamic> json) {
  return _UpdateCircuitoRequestDto.fromJson(json);
}

/// @nodoc
mixin _$UpdateCircuitoRequestDto {
  @JsonKey(name: 'insId')
  String? get insId => throw _privateConstructorUsedError;
  @JsonKey(name: 'circuitoId')
  String? get circuitoId => throw _privateConstructorUsedError;
  @JsonKey(name: 'categoriaId')
  String? get categoriaId => throw _privateConstructorUsedError;
  @JsonKey(name: 'talleId')
  String? get talleId => throw _privateConstructorUsedError;

  /// Serializes this UpdateCircuitoRequestDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateCircuitoRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateCircuitoRequestDtoCopyWith<UpdateCircuitoRequestDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateCircuitoRequestDtoCopyWith<$Res> {
  factory $UpdateCircuitoRequestDtoCopyWith(UpdateCircuitoRequestDto value,
          $Res Function(UpdateCircuitoRequestDto) then) =
      _$UpdateCircuitoRequestDtoCopyWithImpl<$Res, UpdateCircuitoRequestDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'insId') String? insId,
      @JsonKey(name: 'circuitoId') String? circuitoId,
      @JsonKey(name: 'categoriaId') String? categoriaId,
      @JsonKey(name: 'talleId') String? talleId});
}

/// @nodoc
class _$UpdateCircuitoRequestDtoCopyWithImpl<$Res,
        $Val extends UpdateCircuitoRequestDto>
    implements $UpdateCircuitoRequestDtoCopyWith<$Res> {
  _$UpdateCircuitoRequestDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateCircuitoRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? insId = freezed,
    Object? circuitoId = freezed,
    Object? categoriaId = freezed,
    Object? talleId = freezed,
  }) {
    return _then(_value.copyWith(
      insId: freezed == insId
          ? _value.insId
          : insId // ignore: cast_nullable_to_non_nullable
              as String?,
      circuitoId: freezed == circuitoId
          ? _value.circuitoId
          : circuitoId // ignore: cast_nullable_to_non_nullable
              as String?,
      categoriaId: freezed == categoriaId
          ? _value.categoriaId
          : categoriaId // ignore: cast_nullable_to_non_nullable
              as String?,
      talleId: freezed == talleId
          ? _value.talleId
          : talleId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateCircuitoRequestDtoImplCopyWith<$Res>
    implements $UpdateCircuitoRequestDtoCopyWith<$Res> {
  factory _$$UpdateCircuitoRequestDtoImplCopyWith(
          _$UpdateCircuitoRequestDtoImpl value,
          $Res Function(_$UpdateCircuitoRequestDtoImpl) then) =
      __$$UpdateCircuitoRequestDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'insId') String? insId,
      @JsonKey(name: 'circuitoId') String? circuitoId,
      @JsonKey(name: 'categoriaId') String? categoriaId,
      @JsonKey(name: 'talleId') String? talleId});
}

/// @nodoc
class __$$UpdateCircuitoRequestDtoImplCopyWithImpl<$Res>
    extends _$UpdateCircuitoRequestDtoCopyWithImpl<$Res,
        _$UpdateCircuitoRequestDtoImpl>
    implements _$$UpdateCircuitoRequestDtoImplCopyWith<$Res> {
  __$$UpdateCircuitoRequestDtoImplCopyWithImpl(
      _$UpdateCircuitoRequestDtoImpl _value,
      $Res Function(_$UpdateCircuitoRequestDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateCircuitoRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? insId = freezed,
    Object? circuitoId = freezed,
    Object? categoriaId = freezed,
    Object? talleId = freezed,
  }) {
    return _then(_$UpdateCircuitoRequestDtoImpl(
      insId: freezed == insId
          ? _value.insId
          : insId // ignore: cast_nullable_to_non_nullable
              as String?,
      circuitoId: freezed == circuitoId
          ? _value.circuitoId
          : circuitoId // ignore: cast_nullable_to_non_nullable
              as String?,
      categoriaId: freezed == categoriaId
          ? _value.categoriaId
          : categoriaId // ignore: cast_nullable_to_non_nullable
              as String?,
      talleId: freezed == talleId
          ? _value.talleId
          : talleId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateCircuitoRequestDtoImpl implements _UpdateCircuitoRequestDto {
  const _$UpdateCircuitoRequestDtoImpl(
      {@JsonKey(name: 'insId') this.insId,
      @JsonKey(name: 'circuitoId') this.circuitoId,
      @JsonKey(name: 'categoriaId') this.categoriaId,
      @JsonKey(name: 'talleId') this.talleId});

  factory _$UpdateCircuitoRequestDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateCircuitoRequestDtoImplFromJson(json);

  @override
  @JsonKey(name: 'insId')
  final String? insId;
  @override
  @JsonKey(name: 'circuitoId')
  final String? circuitoId;
  @override
  @JsonKey(name: 'categoriaId')
  final String? categoriaId;
  @override
  @JsonKey(name: 'talleId')
  final String? talleId;

  @override
  String toString() {
    return 'UpdateCircuitoRequestDto(insId: $insId, circuitoId: $circuitoId, categoriaId: $categoriaId, talleId: $talleId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateCircuitoRequestDtoImpl &&
            (identical(other.insId, insId) || other.insId == insId) &&
            (identical(other.circuitoId, circuitoId) ||
                other.circuitoId == circuitoId) &&
            (identical(other.categoriaId, categoriaId) ||
                other.categoriaId == categoriaId) &&
            (identical(other.talleId, talleId) || other.talleId == talleId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, insId, circuitoId, categoriaId, talleId);

  /// Create a copy of UpdateCircuitoRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateCircuitoRequestDtoImplCopyWith<_$UpdateCircuitoRequestDtoImpl>
      get copyWith => __$$UpdateCircuitoRequestDtoImplCopyWithImpl<
          _$UpdateCircuitoRequestDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateCircuitoRequestDtoImplToJson(
      this,
    );
  }
}

abstract class _UpdateCircuitoRequestDto implements UpdateCircuitoRequestDto {
  const factory _UpdateCircuitoRequestDto(
          {@JsonKey(name: 'insId') final String? insId,
          @JsonKey(name: 'circuitoId') final String? circuitoId,
          @JsonKey(name: 'categoriaId') final String? categoriaId,
          @JsonKey(name: 'talleId') final String? talleId}) =
      _$UpdateCircuitoRequestDtoImpl;

  factory _UpdateCircuitoRequestDto.fromJson(Map<String, dynamic> json) =
      _$UpdateCircuitoRequestDtoImpl.fromJson;

  @override
  @JsonKey(name: 'insId')
  String? get insId;
  @override
  @JsonKey(name: 'circuitoId')
  String? get circuitoId;
  @override
  @JsonKey(name: 'categoriaId')
  String? get categoriaId;
  @override
  @JsonKey(name: 'talleId')
  String? get talleId;

  /// Create a copy of UpdateCircuitoRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateCircuitoRequestDtoImplCopyWith<_$UpdateCircuitoRequestDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
