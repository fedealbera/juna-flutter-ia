// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_participant_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UpdateParticipantResponseDto _$UpdateParticipantResponseDtoFromJson(
    Map<String, dynamic> json) {
  return _UpdateParticipantResponseDto.fromJson(json);
}

/// @nodoc
mixin _$UpdateParticipantResponseDto {
  Map<String, dynamic> get rawJson => throw _privateConstructorUsedError;

  /// Serializes this UpdateParticipantResponseDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateParticipantResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateParticipantResponseDtoCopyWith<UpdateParticipantResponseDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateParticipantResponseDtoCopyWith<$Res> {
  factory $UpdateParticipantResponseDtoCopyWith(
          UpdateParticipantResponseDto value,
          $Res Function(UpdateParticipantResponseDto) then) =
      _$UpdateParticipantResponseDtoCopyWithImpl<$Res,
          UpdateParticipantResponseDto>;
  @useResult
  $Res call({Map<String, dynamic> rawJson});
}

/// @nodoc
class _$UpdateParticipantResponseDtoCopyWithImpl<$Res,
        $Val extends UpdateParticipantResponseDto>
    implements $UpdateParticipantResponseDtoCopyWith<$Res> {
  _$UpdateParticipantResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateParticipantResponseDto
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
abstract class _$$UpdateParticipantResponseDtoImplCopyWith<$Res>
    implements $UpdateParticipantResponseDtoCopyWith<$Res> {
  factory _$$UpdateParticipantResponseDtoImplCopyWith(
          _$UpdateParticipantResponseDtoImpl value,
          $Res Function(_$UpdateParticipantResponseDtoImpl) then) =
      __$$UpdateParticipantResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, dynamic> rawJson});
}

/// @nodoc
class __$$UpdateParticipantResponseDtoImplCopyWithImpl<$Res>
    extends _$UpdateParticipantResponseDtoCopyWithImpl<$Res,
        _$UpdateParticipantResponseDtoImpl>
    implements _$$UpdateParticipantResponseDtoImplCopyWith<$Res> {
  __$$UpdateParticipantResponseDtoImplCopyWithImpl(
      _$UpdateParticipantResponseDtoImpl _value,
      $Res Function(_$UpdateParticipantResponseDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateParticipantResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rawJson = null,
  }) {
    return _then(_$UpdateParticipantResponseDtoImpl(
      rawJson: null == rawJson
          ? _value._rawJson
          : rawJson // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateParticipantResponseDtoImpl
    implements _UpdateParticipantResponseDto {
  const _$UpdateParticipantResponseDtoImpl(
      {required final Map<String, dynamic> rawJson})
      : _rawJson = rawJson;

  factory _$UpdateParticipantResponseDtoImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$UpdateParticipantResponseDtoImplFromJson(json);

  final Map<String, dynamic> _rawJson;
  @override
  Map<String, dynamic> get rawJson {
    if (_rawJson is EqualUnmodifiableMapView) return _rawJson;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_rawJson);
  }

  @override
  String toString() {
    return 'UpdateParticipantResponseDto(rawJson: $rawJson)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateParticipantResponseDtoImpl &&
            const DeepCollectionEquality().equals(other._rawJson, _rawJson));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_rawJson));

  /// Create a copy of UpdateParticipantResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateParticipantResponseDtoImplCopyWith<
          _$UpdateParticipantResponseDtoImpl>
      get copyWith => __$$UpdateParticipantResponseDtoImplCopyWithImpl<
          _$UpdateParticipantResponseDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateParticipantResponseDtoImplToJson(
      this,
    );
  }
}

abstract class _UpdateParticipantResponseDto
    implements UpdateParticipantResponseDto {
  const factory _UpdateParticipantResponseDto(
          {required final Map<String, dynamic> rawJson}) =
      _$UpdateParticipantResponseDtoImpl;

  factory _UpdateParticipantResponseDto.fromJson(Map<String, dynamic> json) =
      _$UpdateParticipantResponseDtoImpl.fromJson;

  @override
  Map<String, dynamic> get rawJson;

  /// Create a copy of UpdateParticipantResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateParticipantResponseDtoImplCopyWith<
          _$UpdateParticipantResponseDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
