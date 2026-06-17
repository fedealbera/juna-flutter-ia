// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_settings_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EventSettingsResponseDto _$EventSettingsResponseDtoFromJson(
    Map<String, dynamic> json) {
  return _EventSettingsResponseDto.fromJson(json);
}

/// @nodoc
mixin _$EventSettingsResponseDto {
  Map<String, dynamic> get rawJson => throw _privateConstructorUsedError;

  /// Serializes this EventSettingsResponseDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EventSettingsResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EventSettingsResponseDtoCopyWith<EventSettingsResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventSettingsResponseDtoCopyWith<$Res> {
  factory $EventSettingsResponseDtoCopyWith(EventSettingsResponseDto value,
          $Res Function(EventSettingsResponseDto) then) =
      _$EventSettingsResponseDtoCopyWithImpl<$Res, EventSettingsResponseDto>;
  @useResult
  $Res call({Map<String, dynamic> rawJson});
}

/// @nodoc
class _$EventSettingsResponseDtoCopyWithImpl<$Res,
        $Val extends EventSettingsResponseDto>
    implements $EventSettingsResponseDtoCopyWith<$Res> {
  _$EventSettingsResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EventSettingsResponseDto
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
abstract class _$$EventSettingsResponseDtoImplCopyWith<$Res>
    implements $EventSettingsResponseDtoCopyWith<$Res> {
  factory _$$EventSettingsResponseDtoImplCopyWith(
          _$EventSettingsResponseDtoImpl value,
          $Res Function(_$EventSettingsResponseDtoImpl) then) =
      __$$EventSettingsResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, dynamic> rawJson});
}

/// @nodoc
class __$$EventSettingsResponseDtoImplCopyWithImpl<$Res>
    extends _$EventSettingsResponseDtoCopyWithImpl<$Res,
        _$EventSettingsResponseDtoImpl>
    implements _$$EventSettingsResponseDtoImplCopyWith<$Res> {
  __$$EventSettingsResponseDtoImplCopyWithImpl(
      _$EventSettingsResponseDtoImpl _value,
      $Res Function(_$EventSettingsResponseDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventSettingsResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rawJson = null,
  }) {
    return _then(_$EventSettingsResponseDtoImpl(
      rawJson: null == rawJson
          ? _value._rawJson
          : rawJson // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EventSettingsResponseDtoImpl implements _EventSettingsResponseDto {
  const _$EventSettingsResponseDtoImpl(
      {required final Map<String, dynamic> rawJson})
      : _rawJson = rawJson;

  factory _$EventSettingsResponseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventSettingsResponseDtoImplFromJson(json);

  final Map<String, dynamic> _rawJson;
  @override
  Map<String, dynamic> get rawJson {
    if (_rawJson is EqualUnmodifiableMapView) return _rawJson;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_rawJson);
  }

  @override
  String toString() {
    return 'EventSettingsResponseDto(rawJson: $rawJson)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventSettingsResponseDtoImpl &&
            const DeepCollectionEquality().equals(other._rawJson, _rawJson));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_rawJson));

  /// Create a copy of EventSettingsResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventSettingsResponseDtoImplCopyWith<_$EventSettingsResponseDtoImpl>
      get copyWith => __$$EventSettingsResponseDtoImplCopyWithImpl<
          _$EventSettingsResponseDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventSettingsResponseDtoImplToJson(
      this,
    );
  }
}

abstract class _EventSettingsResponseDto implements EventSettingsResponseDto {
  const factory _EventSettingsResponseDto(
          {required final Map<String, dynamic> rawJson}) =
      _$EventSettingsResponseDtoImpl;

  factory _EventSettingsResponseDto.fromJson(Map<String, dynamic> json) =
      _$EventSettingsResponseDtoImpl.fromJson;

  @override
  Map<String, dynamic> get rawJson;

  /// Create a copy of EventSettingsResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventSettingsResponseDtoImplCopyWith<_$EventSettingsResponseDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
