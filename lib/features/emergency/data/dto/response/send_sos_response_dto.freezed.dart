// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'send_sos_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SendSosResponseDto _$SendSosResponseDtoFromJson(Map<String, dynamic> json) {
  return _SendSosResponseDto.fromJson(json);
}

/// @nodoc
mixin _$SendSosResponseDto {
  Map<String, dynamic> get rawJson => throw _privateConstructorUsedError;

  /// Serializes this SendSosResponseDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SendSosResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SendSosResponseDtoCopyWith<SendSosResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendSosResponseDtoCopyWith<$Res> {
  factory $SendSosResponseDtoCopyWith(
          SendSosResponseDto value, $Res Function(SendSosResponseDto) then) =
      _$SendSosResponseDtoCopyWithImpl<$Res, SendSosResponseDto>;
  @useResult
  $Res call({Map<String, dynamic> rawJson});
}

/// @nodoc
class _$SendSosResponseDtoCopyWithImpl<$Res, $Val extends SendSosResponseDto>
    implements $SendSosResponseDtoCopyWith<$Res> {
  _$SendSosResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SendSosResponseDto
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
abstract class _$$SendSosResponseDtoImplCopyWith<$Res>
    implements $SendSosResponseDtoCopyWith<$Res> {
  factory _$$SendSosResponseDtoImplCopyWith(_$SendSosResponseDtoImpl value,
          $Res Function(_$SendSosResponseDtoImpl) then) =
      __$$SendSosResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, dynamic> rawJson});
}

/// @nodoc
class __$$SendSosResponseDtoImplCopyWithImpl<$Res>
    extends _$SendSosResponseDtoCopyWithImpl<$Res, _$SendSosResponseDtoImpl>
    implements _$$SendSosResponseDtoImplCopyWith<$Res> {
  __$$SendSosResponseDtoImplCopyWithImpl(_$SendSosResponseDtoImpl _value,
      $Res Function(_$SendSosResponseDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of SendSosResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rawJson = null,
  }) {
    return _then(_$SendSosResponseDtoImpl(
      rawJson: null == rawJson
          ? _value._rawJson
          : rawJson // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SendSosResponseDtoImpl implements _SendSosResponseDto {
  const _$SendSosResponseDtoImpl({required final Map<String, dynamic> rawJson})
      : _rawJson = rawJson;

  factory _$SendSosResponseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SendSosResponseDtoImplFromJson(json);

  final Map<String, dynamic> _rawJson;
  @override
  Map<String, dynamic> get rawJson {
    if (_rawJson is EqualUnmodifiableMapView) return _rawJson;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_rawJson);
  }

  @override
  String toString() {
    return 'SendSosResponseDto(rawJson: $rawJson)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendSosResponseDtoImpl &&
            const DeepCollectionEquality().equals(other._rawJson, _rawJson));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_rawJson));

  /// Create a copy of SendSosResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendSosResponseDtoImplCopyWith<_$SendSosResponseDtoImpl> get copyWith =>
      __$$SendSosResponseDtoImplCopyWithImpl<_$SendSosResponseDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SendSosResponseDtoImplToJson(
      this,
    );
  }
}

abstract class _SendSosResponseDto implements SendSosResponseDto {
  const factory _SendSosResponseDto(
      {required final Map<String, dynamic> rawJson}) = _$SendSosResponseDtoImpl;

  factory _SendSosResponseDto.fromJson(Map<String, dynamic> json) =
      _$SendSosResponseDtoImpl.fromJson;

  @override
  Map<String, dynamic> get rawJson;

  /// Create a copy of SendSosResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SendSosResponseDtoImplCopyWith<_$SendSosResponseDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
