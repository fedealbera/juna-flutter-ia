// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_circuito_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UpdateCircuitoResponseDto _$UpdateCircuitoResponseDtoFromJson(
    Map<String, dynamic> json) {
  return _UpdateCircuitoResponseDto.fromJson(json);
}

/// @nodoc
mixin _$UpdateCircuitoResponseDto {
  Map<String, dynamic> get rawJson => throw _privateConstructorUsedError;

  /// Serializes this UpdateCircuitoResponseDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateCircuitoResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateCircuitoResponseDtoCopyWith<UpdateCircuitoResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateCircuitoResponseDtoCopyWith<$Res> {
  factory $UpdateCircuitoResponseDtoCopyWith(UpdateCircuitoResponseDto value,
          $Res Function(UpdateCircuitoResponseDto) then) =
      _$UpdateCircuitoResponseDtoCopyWithImpl<$Res, UpdateCircuitoResponseDto>;
  @useResult
  $Res call({Map<String, dynamic> rawJson});
}

/// @nodoc
class _$UpdateCircuitoResponseDtoCopyWithImpl<$Res,
        $Val extends UpdateCircuitoResponseDto>
    implements $UpdateCircuitoResponseDtoCopyWith<$Res> {
  _$UpdateCircuitoResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateCircuitoResponseDto
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
abstract class _$$UpdateCircuitoResponseDtoImplCopyWith<$Res>
    implements $UpdateCircuitoResponseDtoCopyWith<$Res> {
  factory _$$UpdateCircuitoResponseDtoImplCopyWith(
          _$UpdateCircuitoResponseDtoImpl value,
          $Res Function(_$UpdateCircuitoResponseDtoImpl) then) =
      __$$UpdateCircuitoResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, dynamic> rawJson});
}

/// @nodoc
class __$$UpdateCircuitoResponseDtoImplCopyWithImpl<$Res>
    extends _$UpdateCircuitoResponseDtoCopyWithImpl<$Res,
        _$UpdateCircuitoResponseDtoImpl>
    implements _$$UpdateCircuitoResponseDtoImplCopyWith<$Res> {
  __$$UpdateCircuitoResponseDtoImplCopyWithImpl(
      _$UpdateCircuitoResponseDtoImpl _value,
      $Res Function(_$UpdateCircuitoResponseDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateCircuitoResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rawJson = null,
  }) {
    return _then(_$UpdateCircuitoResponseDtoImpl(
      rawJson: null == rawJson
          ? _value._rawJson
          : rawJson // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateCircuitoResponseDtoImpl implements _UpdateCircuitoResponseDto {
  const _$UpdateCircuitoResponseDtoImpl(
      {required final Map<String, dynamic> rawJson})
      : _rawJson = rawJson;

  factory _$UpdateCircuitoResponseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateCircuitoResponseDtoImplFromJson(json);

  final Map<String, dynamic> _rawJson;
  @override
  Map<String, dynamic> get rawJson {
    if (_rawJson is EqualUnmodifiableMapView) return _rawJson;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_rawJson);
  }

  @override
  String toString() {
    return 'UpdateCircuitoResponseDto(rawJson: $rawJson)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateCircuitoResponseDtoImpl &&
            const DeepCollectionEquality().equals(other._rawJson, _rawJson));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_rawJson));

  /// Create a copy of UpdateCircuitoResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateCircuitoResponseDtoImplCopyWith<_$UpdateCircuitoResponseDtoImpl>
      get copyWith => __$$UpdateCircuitoResponseDtoImplCopyWithImpl<
          _$UpdateCircuitoResponseDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateCircuitoResponseDtoImplToJson(
      this,
    );
  }
}

abstract class _UpdateCircuitoResponseDto implements UpdateCircuitoResponseDto {
  const factory _UpdateCircuitoResponseDto(
          {required final Map<String, dynamic> rawJson}) =
      _$UpdateCircuitoResponseDtoImpl;

  factory _UpdateCircuitoResponseDto.fromJson(Map<String, dynamic> json) =
      _$UpdateCircuitoResponseDtoImpl.fromJson;

  @override
  Map<String, dynamic> get rawJson;

  /// Create a copy of UpdateCircuitoResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateCircuitoResponseDtoImplCopyWith<_$UpdateCircuitoResponseDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
