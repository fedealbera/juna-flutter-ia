// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'track_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TrackResponseDto _$TrackResponseDtoFromJson(Map<String, dynamic> json) {
  return _TrackResponseDto.fromJson(json);
}

/// @nodoc
mixin _$TrackResponseDto {
  Map<String, dynamic> get rawJson => throw _privateConstructorUsedError;

  /// Serializes this TrackResponseDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TrackResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TrackResponseDtoCopyWith<TrackResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrackResponseDtoCopyWith<$Res> {
  factory $TrackResponseDtoCopyWith(
          TrackResponseDto value, $Res Function(TrackResponseDto) then) =
      _$TrackResponseDtoCopyWithImpl<$Res, TrackResponseDto>;
  @useResult
  $Res call({Map<String, dynamic> rawJson});
}

/// @nodoc
class _$TrackResponseDtoCopyWithImpl<$Res, $Val extends TrackResponseDto>
    implements $TrackResponseDtoCopyWith<$Res> {
  _$TrackResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TrackResponseDto
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
abstract class _$$TrackResponseDtoImplCopyWith<$Res>
    implements $TrackResponseDtoCopyWith<$Res> {
  factory _$$TrackResponseDtoImplCopyWith(_$TrackResponseDtoImpl value,
          $Res Function(_$TrackResponseDtoImpl) then) =
      __$$TrackResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, dynamic> rawJson});
}

/// @nodoc
class __$$TrackResponseDtoImplCopyWithImpl<$Res>
    extends _$TrackResponseDtoCopyWithImpl<$Res, _$TrackResponseDtoImpl>
    implements _$$TrackResponseDtoImplCopyWith<$Res> {
  __$$TrackResponseDtoImplCopyWithImpl(_$TrackResponseDtoImpl _value,
      $Res Function(_$TrackResponseDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of TrackResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rawJson = null,
  }) {
    return _then(_$TrackResponseDtoImpl(
      rawJson: null == rawJson
          ? _value._rawJson
          : rawJson // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TrackResponseDtoImpl implements _TrackResponseDto {
  const _$TrackResponseDtoImpl({required final Map<String, dynamic> rawJson})
      : _rawJson = rawJson;

  factory _$TrackResponseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$TrackResponseDtoImplFromJson(json);

  final Map<String, dynamic> _rawJson;
  @override
  Map<String, dynamic> get rawJson {
    if (_rawJson is EqualUnmodifiableMapView) return _rawJson;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_rawJson);
  }

  @override
  String toString() {
    return 'TrackResponseDto(rawJson: $rawJson)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrackResponseDtoImpl &&
            const DeepCollectionEquality().equals(other._rawJson, _rawJson));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_rawJson));

  /// Create a copy of TrackResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TrackResponseDtoImplCopyWith<_$TrackResponseDtoImpl> get copyWith =>
      __$$TrackResponseDtoImplCopyWithImpl<_$TrackResponseDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TrackResponseDtoImplToJson(
      this,
    );
  }
}

abstract class _TrackResponseDto implements TrackResponseDto {
  const factory _TrackResponseDto(
      {required final Map<String, dynamic> rawJson}) = _$TrackResponseDtoImpl;

  factory _TrackResponseDto.fromJson(Map<String, dynamic> json) =
      _$TrackResponseDtoImpl.fromJson;

  @override
  Map<String, dynamic> get rawJson;

  /// Create a copy of TrackResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TrackResponseDtoImplCopyWith<_$TrackResponseDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
