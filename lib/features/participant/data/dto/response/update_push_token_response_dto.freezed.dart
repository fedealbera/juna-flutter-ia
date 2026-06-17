// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_push_token_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UpdatePushTokenResponseDto _$UpdatePushTokenResponseDtoFromJson(
    Map<String, dynamic> json) {
  return _UpdatePushTokenResponseDto.fromJson(json);
}

/// @nodoc
mixin _$UpdatePushTokenResponseDto {
  Map<String, dynamic> get rawJson => throw _privateConstructorUsedError;

  /// Serializes this UpdatePushTokenResponseDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdatePushTokenResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdatePushTokenResponseDtoCopyWith<UpdatePushTokenResponseDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdatePushTokenResponseDtoCopyWith<$Res> {
  factory $UpdatePushTokenResponseDtoCopyWith(UpdatePushTokenResponseDto value,
          $Res Function(UpdatePushTokenResponseDto) then) =
      _$UpdatePushTokenResponseDtoCopyWithImpl<$Res,
          UpdatePushTokenResponseDto>;
  @useResult
  $Res call({Map<String, dynamic> rawJson});
}

/// @nodoc
class _$UpdatePushTokenResponseDtoCopyWithImpl<$Res,
        $Val extends UpdatePushTokenResponseDto>
    implements $UpdatePushTokenResponseDtoCopyWith<$Res> {
  _$UpdatePushTokenResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdatePushTokenResponseDto
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
abstract class _$$UpdatePushTokenResponseDtoImplCopyWith<$Res>
    implements $UpdatePushTokenResponseDtoCopyWith<$Res> {
  factory _$$UpdatePushTokenResponseDtoImplCopyWith(
          _$UpdatePushTokenResponseDtoImpl value,
          $Res Function(_$UpdatePushTokenResponseDtoImpl) then) =
      __$$UpdatePushTokenResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, dynamic> rawJson});
}

/// @nodoc
class __$$UpdatePushTokenResponseDtoImplCopyWithImpl<$Res>
    extends _$UpdatePushTokenResponseDtoCopyWithImpl<$Res,
        _$UpdatePushTokenResponseDtoImpl>
    implements _$$UpdatePushTokenResponseDtoImplCopyWith<$Res> {
  __$$UpdatePushTokenResponseDtoImplCopyWithImpl(
      _$UpdatePushTokenResponseDtoImpl _value,
      $Res Function(_$UpdatePushTokenResponseDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdatePushTokenResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rawJson = null,
  }) {
    return _then(_$UpdatePushTokenResponseDtoImpl(
      rawJson: null == rawJson
          ? _value._rawJson
          : rawJson // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdatePushTokenResponseDtoImpl implements _UpdatePushTokenResponseDto {
  const _$UpdatePushTokenResponseDtoImpl(
      {required final Map<String, dynamic> rawJson})
      : _rawJson = rawJson;

  factory _$UpdatePushTokenResponseDtoImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$UpdatePushTokenResponseDtoImplFromJson(json);

  final Map<String, dynamic> _rawJson;
  @override
  Map<String, dynamic> get rawJson {
    if (_rawJson is EqualUnmodifiableMapView) return _rawJson;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_rawJson);
  }

  @override
  String toString() {
    return 'UpdatePushTokenResponseDto(rawJson: $rawJson)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdatePushTokenResponseDtoImpl &&
            const DeepCollectionEquality().equals(other._rawJson, _rawJson));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_rawJson));

  /// Create a copy of UpdatePushTokenResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdatePushTokenResponseDtoImplCopyWith<_$UpdatePushTokenResponseDtoImpl>
      get copyWith => __$$UpdatePushTokenResponseDtoImplCopyWithImpl<
          _$UpdatePushTokenResponseDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdatePushTokenResponseDtoImplToJson(
      this,
    );
  }
}

abstract class _UpdatePushTokenResponseDto
    implements UpdatePushTokenResponseDto {
  const factory _UpdatePushTokenResponseDto(
          {required final Map<String, dynamic> rawJson}) =
      _$UpdatePushTokenResponseDtoImpl;

  factory _UpdatePushTokenResponseDto.fromJson(Map<String, dynamic> json) =
      _$UpdatePushTokenResponseDtoImpl.fromJson;

  @override
  Map<String, dynamic> get rawJson;

  /// Create a copy of UpdatePushTokenResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdatePushTokenResponseDtoImplCopyWith<_$UpdatePushTokenResponseDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
