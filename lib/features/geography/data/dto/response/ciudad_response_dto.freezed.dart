// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ciudad_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CiudadResponseDto _$CiudadResponseDtoFromJson(Map<String, dynamic> json) {
  return _CiudadResponseDto.fromJson(json);
}

/// @nodoc
mixin _$CiudadResponseDto {
  Map<String, dynamic> get rawJson => throw _privateConstructorUsedError;

  /// Serializes this CiudadResponseDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CiudadResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CiudadResponseDtoCopyWith<CiudadResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CiudadResponseDtoCopyWith<$Res> {
  factory $CiudadResponseDtoCopyWith(
          CiudadResponseDto value, $Res Function(CiudadResponseDto) then) =
      _$CiudadResponseDtoCopyWithImpl<$Res, CiudadResponseDto>;
  @useResult
  $Res call({Map<String, dynamic> rawJson});
}

/// @nodoc
class _$CiudadResponseDtoCopyWithImpl<$Res, $Val extends CiudadResponseDto>
    implements $CiudadResponseDtoCopyWith<$Res> {
  _$CiudadResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CiudadResponseDto
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
abstract class _$$CiudadResponseDtoImplCopyWith<$Res>
    implements $CiudadResponseDtoCopyWith<$Res> {
  factory _$$CiudadResponseDtoImplCopyWith(_$CiudadResponseDtoImpl value,
          $Res Function(_$CiudadResponseDtoImpl) then) =
      __$$CiudadResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, dynamic> rawJson});
}

/// @nodoc
class __$$CiudadResponseDtoImplCopyWithImpl<$Res>
    extends _$CiudadResponseDtoCopyWithImpl<$Res, _$CiudadResponseDtoImpl>
    implements _$$CiudadResponseDtoImplCopyWith<$Res> {
  __$$CiudadResponseDtoImplCopyWithImpl(_$CiudadResponseDtoImpl _value,
      $Res Function(_$CiudadResponseDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of CiudadResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rawJson = null,
  }) {
    return _then(_$CiudadResponseDtoImpl(
      rawJson: null == rawJson
          ? _value._rawJson
          : rawJson // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CiudadResponseDtoImpl implements _CiudadResponseDto {
  const _$CiudadResponseDtoImpl({required final Map<String, dynamic> rawJson})
      : _rawJson = rawJson;

  factory _$CiudadResponseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CiudadResponseDtoImplFromJson(json);

  final Map<String, dynamic> _rawJson;
  @override
  Map<String, dynamic> get rawJson {
    if (_rawJson is EqualUnmodifiableMapView) return _rawJson;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_rawJson);
  }

  @override
  String toString() {
    return 'CiudadResponseDto(rawJson: $rawJson)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CiudadResponseDtoImpl &&
            const DeepCollectionEquality().equals(other._rawJson, _rawJson));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_rawJson));

  /// Create a copy of CiudadResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CiudadResponseDtoImplCopyWith<_$CiudadResponseDtoImpl> get copyWith =>
      __$$CiudadResponseDtoImplCopyWithImpl<_$CiudadResponseDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CiudadResponseDtoImplToJson(
      this,
    );
  }
}

abstract class _CiudadResponseDto implements CiudadResponseDto {
  const factory _CiudadResponseDto(
      {required final Map<String, dynamic> rawJson}) = _$CiudadResponseDtoImpl;

  factory _CiudadResponseDto.fromJson(Map<String, dynamic> json) =
      _$CiudadResponseDtoImpl.fromJson;

  @override
  Map<String, dynamic> get rawJson;

  /// Create a copy of CiudadResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CiudadResponseDtoImplCopyWith<_$CiudadResponseDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
