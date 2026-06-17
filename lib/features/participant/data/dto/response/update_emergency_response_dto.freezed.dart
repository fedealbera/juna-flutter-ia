// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_emergency_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UpdateEmergencyResponseDto _$UpdateEmergencyResponseDtoFromJson(
    Map<String, dynamic> json) {
  return _UpdateEmergencyResponseDto.fromJson(json);
}

/// @nodoc
mixin _$UpdateEmergencyResponseDto {
  Map<String, dynamic> get rawJson => throw _privateConstructorUsedError;

  /// Serializes this UpdateEmergencyResponseDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateEmergencyResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateEmergencyResponseDtoCopyWith<UpdateEmergencyResponseDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateEmergencyResponseDtoCopyWith<$Res> {
  factory $UpdateEmergencyResponseDtoCopyWith(UpdateEmergencyResponseDto value,
          $Res Function(UpdateEmergencyResponseDto) then) =
      _$UpdateEmergencyResponseDtoCopyWithImpl<$Res,
          UpdateEmergencyResponseDto>;
  @useResult
  $Res call({Map<String, dynamic> rawJson});
}

/// @nodoc
class _$UpdateEmergencyResponseDtoCopyWithImpl<$Res,
        $Val extends UpdateEmergencyResponseDto>
    implements $UpdateEmergencyResponseDtoCopyWith<$Res> {
  _$UpdateEmergencyResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateEmergencyResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rawJson = null,
  }) {
    return _then(_value.copyWith(
      rawJson: null == rawJson
          ? _value.rawJson
          : rawJson // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateEmergencyResponseDtoImplCopyWith<$Res>
    implements $UpdateEmergencyResponseDtoCopyWith<$Res> {
  factory _$$UpdateEmergencyResponseDtoImplCopyWith(
          _$UpdateEmergencyResponseDtoImpl value,
          $Res Function(_$UpdateEmergencyResponseDtoImpl) then) =
      __$$UpdateEmergencyResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, dynamic> rawJson});
}

/// @nodoc
class __$$UpdateEmergencyResponseDtoImplCopyWithImpl<$Res>
    extends _$UpdateEmergencyResponseDtoCopyWithImpl<$Res,
        _$UpdateEmergencyResponseDtoImpl>
    implements _$$UpdateEmergencyResponseDtoImplCopyWith<$Res> {
  __$$UpdateEmergencyResponseDtoImplCopyWithImpl(
      _$UpdateEmergencyResponseDtoImpl _value,
      $Res Function(_$UpdateEmergencyResponseDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateEmergencyResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rawJson = null,
  }) {
    return _then(_$UpdateEmergencyResponseDtoImpl(
      rawJson: null == rawJson
          ? _value._rawJson
          : rawJson // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateEmergencyResponseDtoImpl implements _UpdateEmergencyResponseDto {
  const _$UpdateEmergencyResponseDtoImpl(
      {required final Map<String, dynamic> rawJson})
      : _rawJson = rawJson;

  factory _$UpdateEmergencyResponseDtoImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$UpdateEmergencyResponseDtoImplFromJson(json);

  final Map<String, dynamic> _rawJson;
  @override
  Map<String, dynamic> get rawJson {
    if (_rawJson is EqualUnmodifiableMapView) return _rawJson;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_rawJson);
  }

  @override
  String toString() {
    return 'UpdateEmergencyResponseDto(rawJson: $rawJson)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateEmergencyResponseDtoImpl &&
            const DeepCollectionEquality().equals(other._rawJson, _rawJson));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_rawJson));

  /// Create a copy of UpdateEmergencyResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateEmergencyResponseDtoImplCopyWith<_$UpdateEmergencyResponseDtoImpl>
      get copyWith => __$$UpdateEmergencyResponseDtoImplCopyWithImpl<
          _$UpdateEmergencyResponseDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateEmergencyResponseDtoImplToJson(
      this,
    );
  }
}

abstract class _UpdateEmergencyResponseDto
    implements UpdateEmergencyResponseDto {
  const factory _UpdateEmergencyResponseDto(
          {required final Map<String, dynamic> rawJson}) =
      _$UpdateEmergencyResponseDtoImpl;

  factory _UpdateEmergencyResponseDto.fromJson(Map<String, dynamic> json) =
      _$UpdateEmergencyResponseDtoImpl.fromJson;

  @override
  Map<String, dynamic> get rawJson;

  /// Create a copy of UpdateEmergencyResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateEmergencyResponseDtoImplCopyWith<_$UpdateEmergencyResponseDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
