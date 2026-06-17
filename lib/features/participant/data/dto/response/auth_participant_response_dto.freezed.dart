// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_participant_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AuthParticipantResponseDto _$AuthParticipantResponseDtoFromJson(
    Map<String, dynamic> json) {
  return _AuthParticipantResponseDto.fromJson(json);
}

/// @nodoc
mixin _$AuthParticipantResponseDto {
  Map<String, dynamic> get rawJson => throw _privateConstructorUsedError;

  /// Serializes this AuthParticipantResponseDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AuthParticipantResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthParticipantResponseDtoCopyWith<AuthParticipantResponseDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthParticipantResponseDtoCopyWith<$Res> {
  factory $AuthParticipantResponseDtoCopyWith(AuthParticipantResponseDto value,
          $Res Function(AuthParticipantResponseDto) then) =
      _$AuthParticipantResponseDtoCopyWithImpl<$Res,
          AuthParticipantResponseDto>;
  @useResult
  $Res call({Map<String, dynamic> rawJson});
}

/// @nodoc
class _$AuthParticipantResponseDtoCopyWithImpl<$Res,
        $Val extends AuthParticipantResponseDto>
    implements $AuthParticipantResponseDtoCopyWith<$Res> {
  _$AuthParticipantResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthParticipantResponseDto
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
abstract class _$$AuthParticipantResponseDtoImplCopyWith<$Res>
    implements $AuthParticipantResponseDtoCopyWith<$Res> {
  factory _$$AuthParticipantResponseDtoImplCopyWith(
          _$AuthParticipantResponseDtoImpl value,
          $Res Function(_$AuthParticipantResponseDtoImpl) then) =
      __$$AuthParticipantResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, dynamic> rawJson});
}

/// @nodoc
class __$$AuthParticipantResponseDtoImplCopyWithImpl<$Res>
    extends _$AuthParticipantResponseDtoCopyWithImpl<$Res,
        _$AuthParticipantResponseDtoImpl>
    implements _$$AuthParticipantResponseDtoImplCopyWith<$Res> {
  __$$AuthParticipantResponseDtoImplCopyWithImpl(
      _$AuthParticipantResponseDtoImpl _value,
      $Res Function(_$AuthParticipantResponseDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthParticipantResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rawJson = null,
  }) {
    return _then(_$AuthParticipantResponseDtoImpl(
      rawJson: null == rawJson
          ? _value._rawJson
          : rawJson // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthParticipantResponseDtoImpl implements _AuthParticipantResponseDto {
  const _$AuthParticipantResponseDtoImpl(
      {required final Map<String, dynamic> rawJson})
      : _rawJson = rawJson;

  factory _$AuthParticipantResponseDtoImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$AuthParticipantResponseDtoImplFromJson(json);

  final Map<String, dynamic> _rawJson;
  @override
  Map<String, dynamic> get rawJson {
    if (_rawJson is EqualUnmodifiableMapView) return _rawJson;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_rawJson);
  }

  @override
  String toString() {
    return 'AuthParticipantResponseDto(rawJson: $rawJson)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthParticipantResponseDtoImpl &&
            const DeepCollectionEquality().equals(other._rawJson, _rawJson));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_rawJson));

  /// Create a copy of AuthParticipantResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthParticipantResponseDtoImplCopyWith<_$AuthParticipantResponseDtoImpl>
      get copyWith => __$$AuthParticipantResponseDtoImplCopyWithImpl<
          _$AuthParticipantResponseDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthParticipantResponseDtoImplToJson(
      this,
    );
  }
}

abstract class _AuthParticipantResponseDto
    implements AuthParticipantResponseDto {
  const factory _AuthParticipantResponseDto(
          {required final Map<String, dynamic> rawJson}) =
      _$AuthParticipantResponseDtoImpl;

  factory _AuthParticipantResponseDto.fromJson(Map<String, dynamic> json) =
      _$AuthParticipantResponseDtoImpl.fromJson;

  @override
  Map<String, dynamic> get rawJson;

  /// Create a copy of AuthParticipantResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthParticipantResponseDtoImplCopyWith<_$AuthParticipantResponseDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
