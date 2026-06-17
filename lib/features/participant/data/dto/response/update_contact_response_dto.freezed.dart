// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_contact_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UpdateContactResponseDto _$UpdateContactResponseDtoFromJson(
    Map<String, dynamic> json) {
  return _UpdateContactResponseDto.fromJson(json);
}

/// @nodoc
mixin _$UpdateContactResponseDto {
  Map<String, dynamic> get rawJson => throw _privateConstructorUsedError;

  /// Serializes this UpdateContactResponseDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateContactResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateContactResponseDtoCopyWith<UpdateContactResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateContactResponseDtoCopyWith<$Res> {
  factory $UpdateContactResponseDtoCopyWith(UpdateContactResponseDto value,
          $Res Function(UpdateContactResponseDto) then) =
      _$UpdateContactResponseDtoCopyWithImpl<$Res, UpdateContactResponseDto>;
  @useResult
  $Res call({Map<String, dynamic> rawJson});
}

/// @nodoc
class _$UpdateContactResponseDtoCopyWithImpl<$Res,
        $Val extends UpdateContactResponseDto>
    implements $UpdateContactResponseDtoCopyWith<$Res> {
  _$UpdateContactResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateContactResponseDto
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
abstract class _$$UpdateContactResponseDtoImplCopyWith<$Res>
    implements $UpdateContactResponseDtoCopyWith<$Res> {
  factory _$$UpdateContactResponseDtoImplCopyWith(
          _$UpdateContactResponseDtoImpl value,
          $Res Function(_$UpdateContactResponseDtoImpl) then) =
      __$$UpdateContactResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, dynamic> rawJson});
}

/// @nodoc
class __$$UpdateContactResponseDtoImplCopyWithImpl<$Res>
    extends _$UpdateContactResponseDtoCopyWithImpl<$Res,
        _$UpdateContactResponseDtoImpl>
    implements _$$UpdateContactResponseDtoImplCopyWith<$Res> {
  __$$UpdateContactResponseDtoImplCopyWithImpl(
      _$UpdateContactResponseDtoImpl _value,
      $Res Function(_$UpdateContactResponseDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateContactResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rawJson = null,
  }) {
    return _then(_$UpdateContactResponseDtoImpl(
      rawJson: null == rawJson
          ? _value._rawJson
          : rawJson // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateContactResponseDtoImpl implements _UpdateContactResponseDto {
  const _$UpdateContactResponseDtoImpl(
      {required final Map<String, dynamic> rawJson})
      : _rawJson = rawJson;

  factory _$UpdateContactResponseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateContactResponseDtoImplFromJson(json);

  final Map<String, dynamic> _rawJson;
  @override
  Map<String, dynamic> get rawJson {
    if (_rawJson is EqualUnmodifiableMapView) return _rawJson;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_rawJson);
  }

  @override
  String toString() {
    return 'UpdateContactResponseDto(rawJson: $rawJson)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateContactResponseDtoImpl &&
            const DeepCollectionEquality().equals(other._rawJson, _rawJson));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_rawJson));

  /// Create a copy of UpdateContactResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateContactResponseDtoImplCopyWith<_$UpdateContactResponseDtoImpl>
      get copyWith => __$$UpdateContactResponseDtoImplCopyWithImpl<
          _$UpdateContactResponseDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateContactResponseDtoImplToJson(
      this,
    );
  }
}

abstract class _UpdateContactResponseDto implements UpdateContactResponseDto {
  const factory _UpdateContactResponseDto(
          {required final Map<String, dynamic> rawJson}) =
      _$UpdateContactResponseDtoImpl;

  factory _UpdateContactResponseDto.fromJson(Map<String, dynamic> json) =
      _$UpdateContactResponseDtoImpl.fromJson;

  @override
  Map<String, dynamic> get rawJson;

  /// Create a copy of UpdateContactResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateContactResponseDtoImplCopyWith<_$UpdateContactResponseDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
