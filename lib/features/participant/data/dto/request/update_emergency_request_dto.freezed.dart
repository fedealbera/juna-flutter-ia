// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_emergency_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UpdateEmergencyRequestDto _$UpdateEmergencyRequestDtoFromJson(
    Map<String, dynamic> json) {
  return _UpdateEmergencyRequestDto.fromJson(json);
}

/// @nodoc
mixin _$UpdateEmergencyRequestDto {
  @JsonKey(name: 'contNombre')
  String? get contNombre => throw _privateConstructorUsedError;
  @JsonKey(name: 'contTel')
  String? get contTel => throw _privateConstructorUsedError;

  /// Serializes this UpdateEmergencyRequestDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateEmergencyRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateEmergencyRequestDtoCopyWith<UpdateEmergencyRequestDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateEmergencyRequestDtoCopyWith<$Res> {
  factory $UpdateEmergencyRequestDtoCopyWith(UpdateEmergencyRequestDto value,
          $Res Function(UpdateEmergencyRequestDto) then) =
      _$UpdateEmergencyRequestDtoCopyWithImpl<$Res, UpdateEmergencyRequestDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'contNombre') String? contNombre,
      @JsonKey(name: 'contTel') String? contTel});
}

/// @nodoc
class _$UpdateEmergencyRequestDtoCopyWithImpl<$Res,
        $Val extends UpdateEmergencyRequestDto>
    implements $UpdateEmergencyRequestDtoCopyWith<$Res> {
  _$UpdateEmergencyRequestDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateEmergencyRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contNombre = freezed,
    Object? contTel = freezed,
  }) {
    return _then(_value.copyWith(
      contNombre: freezed == contNombre
          ? _value.contNombre
          : contNombre // ignore: cast_nullable_to_non_nullable
              as String?,
      contTel: freezed == contTel
          ? _value.contTel
          : contTel // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateEmergencyRequestDtoImplCopyWith<$Res>
    implements $UpdateEmergencyRequestDtoCopyWith<$Res> {
  factory _$$UpdateEmergencyRequestDtoImplCopyWith(
          _$UpdateEmergencyRequestDtoImpl value,
          $Res Function(_$UpdateEmergencyRequestDtoImpl) then) =
      __$$UpdateEmergencyRequestDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'contNombre') String? contNombre,
      @JsonKey(name: 'contTel') String? contTel});
}

/// @nodoc
class __$$UpdateEmergencyRequestDtoImplCopyWithImpl<$Res>
    extends _$UpdateEmergencyRequestDtoCopyWithImpl<$Res,
        _$UpdateEmergencyRequestDtoImpl>
    implements _$$UpdateEmergencyRequestDtoImplCopyWith<$Res> {
  __$$UpdateEmergencyRequestDtoImplCopyWithImpl(
      _$UpdateEmergencyRequestDtoImpl _value,
      $Res Function(_$UpdateEmergencyRequestDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateEmergencyRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contNombre = freezed,
    Object? contTel = freezed,
  }) {
    return _then(_$UpdateEmergencyRequestDtoImpl(
      contNombre: freezed == contNombre
          ? _value.contNombre
          : contNombre // ignore: cast_nullable_to_non_nullable
              as String?,
      contTel: freezed == contTel
          ? _value.contTel
          : contTel // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateEmergencyRequestDtoImpl implements _UpdateEmergencyRequestDto {
  const _$UpdateEmergencyRequestDtoImpl(
      {@JsonKey(name: 'contNombre') this.contNombre,
      @JsonKey(name: 'contTel') this.contTel});

  factory _$UpdateEmergencyRequestDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateEmergencyRequestDtoImplFromJson(json);

  @override
  @JsonKey(name: 'contNombre')
  final String? contNombre;
  @override
  @JsonKey(name: 'contTel')
  final String? contTel;

  @override
  String toString() {
    return 'UpdateEmergencyRequestDto(contNombre: $contNombre, contTel: $contTel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateEmergencyRequestDtoImpl &&
            (identical(other.contNombre, contNombre) ||
                other.contNombre == contNombre) &&
            (identical(other.contTel, contTel) || other.contTel == contTel));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, contNombre, contTel);

  /// Create a copy of UpdateEmergencyRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateEmergencyRequestDtoImplCopyWith<_$UpdateEmergencyRequestDtoImpl>
      get copyWith => __$$UpdateEmergencyRequestDtoImplCopyWithImpl<
          _$UpdateEmergencyRequestDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateEmergencyRequestDtoImplToJson(
      this,
    );
  }
}

abstract class _UpdateEmergencyRequestDto implements UpdateEmergencyRequestDto {
  const factory _UpdateEmergencyRequestDto(
          {@JsonKey(name: 'contNombre') final String? contNombre,
          @JsonKey(name: 'contTel') final String? contTel}) =
      _$UpdateEmergencyRequestDtoImpl;

  factory _UpdateEmergencyRequestDto.fromJson(Map<String, dynamic> json) =
      _$UpdateEmergencyRequestDtoImpl.fromJson;

  @override
  @JsonKey(name: 'contNombre')
  String? get contNombre;
  @override
  @JsonKey(name: 'contTel')
  String? get contTel;

  /// Create a copy of UpdateEmergencyRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateEmergencyRequestDtoImplCopyWith<_$UpdateEmergencyRequestDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
