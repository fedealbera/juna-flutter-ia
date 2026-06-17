// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'participant_detail_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ParticipantDetailResponseDto _$ParticipantDetailResponseDtoFromJson(
    Map<String, dynamic> json) {
  return _ParticipantDetailResponseDto.fromJson(json);
}

/// @nodoc
mixin _$ParticipantDetailResponseDto {
  Map<String, dynamic> get rawJson => throw _privateConstructorUsedError;

  /// Serializes this ParticipantDetailResponseDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ParticipantDetailResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ParticipantDetailResponseDtoCopyWith<ParticipantDetailResponseDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParticipantDetailResponseDtoCopyWith<$Res> {
  factory $ParticipantDetailResponseDtoCopyWith(
          ParticipantDetailResponseDto value,
          $Res Function(ParticipantDetailResponseDto) then) =
      _$ParticipantDetailResponseDtoCopyWithImpl<$Res,
          ParticipantDetailResponseDto>;
  @useResult
  $Res call({Map<String, dynamic> rawJson});
}

/// @nodoc
class _$ParticipantDetailResponseDtoCopyWithImpl<$Res,
        $Val extends ParticipantDetailResponseDto>
    implements $ParticipantDetailResponseDtoCopyWith<$Res> {
  _$ParticipantDetailResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ParticipantDetailResponseDto
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
abstract class _$$ParticipantDetailResponseDtoImplCopyWith<$Res>
    implements $ParticipantDetailResponseDtoCopyWith<$Res> {
  factory _$$ParticipantDetailResponseDtoImplCopyWith(
          _$ParticipantDetailResponseDtoImpl value,
          $Res Function(_$ParticipantDetailResponseDtoImpl) then) =
      __$$ParticipantDetailResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, dynamic> rawJson});
}

/// @nodoc
class __$$ParticipantDetailResponseDtoImplCopyWithImpl<$Res>
    extends _$ParticipantDetailResponseDtoCopyWithImpl<$Res,
        _$ParticipantDetailResponseDtoImpl>
    implements _$$ParticipantDetailResponseDtoImplCopyWith<$Res> {
  __$$ParticipantDetailResponseDtoImplCopyWithImpl(
      _$ParticipantDetailResponseDtoImpl _value,
      $Res Function(_$ParticipantDetailResponseDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ParticipantDetailResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rawJson = null,
  }) {
    return _then(_$ParticipantDetailResponseDtoImpl(
      rawJson: null == rawJson
          ? _value._rawJson
          : rawJson // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ParticipantDetailResponseDtoImpl
    implements _ParticipantDetailResponseDto {
  const _$ParticipantDetailResponseDtoImpl(
      {required final Map<String, dynamic> rawJson})
      : _rawJson = rawJson;

  factory _$ParticipantDetailResponseDtoImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ParticipantDetailResponseDtoImplFromJson(json);

  final Map<String, dynamic> _rawJson;
  @override
  Map<String, dynamic> get rawJson {
    if (_rawJson is EqualUnmodifiableMapView) return _rawJson;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_rawJson);
  }

  @override
  String toString() {
    return 'ParticipantDetailResponseDto(rawJson: $rawJson)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParticipantDetailResponseDtoImpl &&
            const DeepCollectionEquality().equals(other._rawJson, _rawJson));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_rawJson));

  /// Create a copy of ParticipantDetailResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ParticipantDetailResponseDtoImplCopyWith<
          _$ParticipantDetailResponseDtoImpl>
      get copyWith => __$$ParticipantDetailResponseDtoImplCopyWithImpl<
          _$ParticipantDetailResponseDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ParticipantDetailResponseDtoImplToJson(
      this,
    );
  }
}

abstract class _ParticipantDetailResponseDto
    implements ParticipantDetailResponseDto {
  const factory _ParticipantDetailResponseDto(
          {required final Map<String, dynamic> rawJson}) =
      _$ParticipantDetailResponseDtoImpl;

  factory _ParticipantDetailResponseDto.fromJson(Map<String, dynamic> json) =
      _$ParticipantDetailResponseDtoImpl.fromJson;

  @override
  Map<String, dynamic> get rawJson;

  /// Create a copy of ParticipantDetailResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ParticipantDetailResponseDtoImplCopyWith<
          _$ParticipantDetailResponseDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
