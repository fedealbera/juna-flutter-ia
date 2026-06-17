// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'participant_file_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ParticipantFileResponseDto _$ParticipantFileResponseDtoFromJson(
    Map<String, dynamic> json) {
  return _ParticipantFileResponseDto.fromJson(json);
}

/// @nodoc
mixin _$ParticipantFileResponseDto {
  Map<String, dynamic> get rawJson => throw _privateConstructorUsedError;

  /// Serializes this ParticipantFileResponseDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ParticipantFileResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ParticipantFileResponseDtoCopyWith<ParticipantFileResponseDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParticipantFileResponseDtoCopyWith<$Res> {
  factory $ParticipantFileResponseDtoCopyWith(ParticipantFileResponseDto value,
          $Res Function(ParticipantFileResponseDto) then) =
      _$ParticipantFileResponseDtoCopyWithImpl<$Res,
          ParticipantFileResponseDto>;
  @useResult
  $Res call({Map<String, dynamic> rawJson});
}

/// @nodoc
class _$ParticipantFileResponseDtoCopyWithImpl<$Res,
        $Val extends ParticipantFileResponseDto>
    implements $ParticipantFileResponseDtoCopyWith<$Res> {
  _$ParticipantFileResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ParticipantFileResponseDto
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
abstract class _$$ParticipantFileResponseDtoImplCopyWith<$Res>
    implements $ParticipantFileResponseDtoCopyWith<$Res> {
  factory _$$ParticipantFileResponseDtoImplCopyWith(
          _$ParticipantFileResponseDtoImpl value,
          $Res Function(_$ParticipantFileResponseDtoImpl) then) =
      __$$ParticipantFileResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, dynamic> rawJson});
}

/// @nodoc
class __$$ParticipantFileResponseDtoImplCopyWithImpl<$Res>
    extends _$ParticipantFileResponseDtoCopyWithImpl<$Res,
        _$ParticipantFileResponseDtoImpl>
    implements _$$ParticipantFileResponseDtoImplCopyWith<$Res> {
  __$$ParticipantFileResponseDtoImplCopyWithImpl(
      _$ParticipantFileResponseDtoImpl _value,
      $Res Function(_$ParticipantFileResponseDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ParticipantFileResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rawJson = null,
  }) {
    return _then(_$ParticipantFileResponseDtoImpl(
      rawJson: null == rawJson
          ? _value._rawJson
          : rawJson // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ParticipantFileResponseDtoImpl implements _ParticipantFileResponseDto {
  const _$ParticipantFileResponseDtoImpl(
      {required final Map<String, dynamic> rawJson})
      : _rawJson = rawJson;

  factory _$ParticipantFileResponseDtoImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ParticipantFileResponseDtoImplFromJson(json);

  final Map<String, dynamic> _rawJson;
  @override
  Map<String, dynamic> get rawJson {
    if (_rawJson is EqualUnmodifiableMapView) return _rawJson;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_rawJson);
  }

  @override
  String toString() {
    return 'ParticipantFileResponseDto(rawJson: $rawJson)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParticipantFileResponseDtoImpl &&
            const DeepCollectionEquality().equals(other._rawJson, _rawJson));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_rawJson));

  /// Create a copy of ParticipantFileResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ParticipantFileResponseDtoImplCopyWith<_$ParticipantFileResponseDtoImpl>
      get copyWith => __$$ParticipantFileResponseDtoImplCopyWithImpl<
          _$ParticipantFileResponseDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ParticipantFileResponseDtoImplToJson(
      this,
    );
  }
}

abstract class _ParticipantFileResponseDto
    implements ParticipantFileResponseDto {
  const factory _ParticipantFileResponseDto(
          {required final Map<String, dynamic> rawJson}) =
      _$ParticipantFileResponseDtoImpl;

  factory _ParticipantFileResponseDto.fromJson(Map<String, dynamic> json) =
      _$ParticipantFileResponseDtoImpl.fromJson;

  @override
  Map<String, dynamic> get rawJson;

  /// Create a copy of ParticipantFileResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ParticipantFileResponseDtoImplCopyWith<_$ParticipantFileResponseDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
