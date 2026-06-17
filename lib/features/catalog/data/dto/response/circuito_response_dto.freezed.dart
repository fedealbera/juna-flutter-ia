// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'circuito_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CircuitoResponseDto _$CircuitoResponseDtoFromJson(Map<String, dynamic> json) {
  return _CircuitoResponseDto.fromJson(json);
}

/// @nodoc
mixin _$CircuitoResponseDto {
  Map<String, dynamic> get rawJson => throw _privateConstructorUsedError;

  /// Serializes this CircuitoResponseDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CircuitoResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CircuitoResponseDtoCopyWith<CircuitoResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CircuitoResponseDtoCopyWith<$Res> {
  factory $CircuitoResponseDtoCopyWith(
          CircuitoResponseDto value, $Res Function(CircuitoResponseDto) then) =
      _$CircuitoResponseDtoCopyWithImpl<$Res, CircuitoResponseDto>;
  @useResult
  $Res call({Map<String, dynamic> rawJson});
}

/// @nodoc
class _$CircuitoResponseDtoCopyWithImpl<$Res, $Val extends CircuitoResponseDto>
    implements $CircuitoResponseDtoCopyWith<$Res> {
  _$CircuitoResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CircuitoResponseDto
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
abstract class _$$CircuitoResponseDtoImplCopyWith<$Res>
    implements $CircuitoResponseDtoCopyWith<$Res> {
  factory _$$CircuitoResponseDtoImplCopyWith(_$CircuitoResponseDtoImpl value,
          $Res Function(_$CircuitoResponseDtoImpl) then) =
      __$$CircuitoResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, dynamic> rawJson});
}

/// @nodoc
class __$$CircuitoResponseDtoImplCopyWithImpl<$Res>
    extends _$CircuitoResponseDtoCopyWithImpl<$Res, _$CircuitoResponseDtoImpl>
    implements _$$CircuitoResponseDtoImplCopyWith<$Res> {
  __$$CircuitoResponseDtoImplCopyWithImpl(_$CircuitoResponseDtoImpl _value,
      $Res Function(_$CircuitoResponseDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of CircuitoResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rawJson = null,
  }) {
    return _then(_$CircuitoResponseDtoImpl(
      rawJson: null == rawJson
          ? _value._rawJson
          : rawJson // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CircuitoResponseDtoImpl implements _CircuitoResponseDto {
  const _$CircuitoResponseDtoImpl({required final Map<String, dynamic> rawJson})
      : _rawJson = rawJson;

  factory _$CircuitoResponseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CircuitoResponseDtoImplFromJson(json);

  final Map<String, dynamic> _rawJson;
  @override
  Map<String, dynamic> get rawJson {
    if (_rawJson is EqualUnmodifiableMapView) return _rawJson;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_rawJson);
  }

  @override
  String toString() {
    return 'CircuitoResponseDto(rawJson: $rawJson)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CircuitoResponseDtoImpl &&
            const DeepCollectionEquality().equals(other._rawJson, _rawJson));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_rawJson));

  /// Create a copy of CircuitoResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CircuitoResponseDtoImplCopyWith<_$CircuitoResponseDtoImpl> get copyWith =>
      __$$CircuitoResponseDtoImplCopyWithImpl<_$CircuitoResponseDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CircuitoResponseDtoImplToJson(
      this,
    );
  }
}

abstract class _CircuitoResponseDto implements CircuitoResponseDto {
  const factory _CircuitoResponseDto(
          {required final Map<String, dynamic> rawJson}) =
      _$CircuitoResponseDtoImpl;

  factory _CircuitoResponseDto.fromJson(Map<String, dynamic> json) =
      _$CircuitoResponseDtoImpl.fromJson;

  @override
  Map<String, dynamic> get rawJson;

  /// Create a copy of CircuitoResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CircuitoResponseDtoImplCopyWith<_$CircuitoResponseDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
