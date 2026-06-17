// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'talle_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TalleResponseDto _$TalleResponseDtoFromJson(Map<String, dynamic> json) {
  return _TalleResponseDto.fromJson(json);
}

/// @nodoc
mixin _$TalleResponseDto {
  Map<String, dynamic> get rawJson => throw _privateConstructorUsedError;

  /// Serializes this TalleResponseDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TalleResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TalleResponseDtoCopyWith<TalleResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TalleResponseDtoCopyWith<$Res> {
  factory $TalleResponseDtoCopyWith(
          TalleResponseDto value, $Res Function(TalleResponseDto) then) =
      _$TalleResponseDtoCopyWithImpl<$Res, TalleResponseDto>;
  @useResult
  $Res call({Map<String, dynamic> rawJson});
}

/// @nodoc
class _$TalleResponseDtoCopyWithImpl<$Res, $Val extends TalleResponseDto>
    implements $TalleResponseDtoCopyWith<$Res> {
  _$TalleResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TalleResponseDto
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
abstract class _$$TalleResponseDtoImplCopyWith<$Res>
    implements $TalleResponseDtoCopyWith<$Res> {
  factory _$$TalleResponseDtoImplCopyWith(_$TalleResponseDtoImpl value,
          $Res Function(_$TalleResponseDtoImpl) then) =
      __$$TalleResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, dynamic> rawJson});
}

/// @nodoc
class __$$TalleResponseDtoImplCopyWithImpl<$Res>
    extends _$TalleResponseDtoCopyWithImpl<$Res, _$TalleResponseDtoImpl>
    implements _$$TalleResponseDtoImplCopyWith<$Res> {
  __$$TalleResponseDtoImplCopyWithImpl(_$TalleResponseDtoImpl _value,
      $Res Function(_$TalleResponseDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of TalleResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rawJson = null,
  }) {
    return _then(_$TalleResponseDtoImpl(
      rawJson: null == rawJson
          ? _value._rawJson
          : rawJson // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TalleResponseDtoImpl implements _TalleResponseDto {
  const _$TalleResponseDtoImpl({required final Map<String, dynamic> rawJson})
      : _rawJson = rawJson;

  factory _$TalleResponseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$TalleResponseDtoImplFromJson(json);

  final Map<String, dynamic> _rawJson;
  @override
  Map<String, dynamic> get rawJson {
    if (_rawJson is EqualUnmodifiableMapView) return _rawJson;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_rawJson);
  }

  @override
  String toString() {
    return 'TalleResponseDto(rawJson: $rawJson)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TalleResponseDtoImpl &&
            const DeepCollectionEquality().equals(other._rawJson, _rawJson));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_rawJson));

  /// Create a copy of TalleResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TalleResponseDtoImplCopyWith<_$TalleResponseDtoImpl> get copyWith =>
      __$$TalleResponseDtoImplCopyWithImpl<_$TalleResponseDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TalleResponseDtoImplToJson(
      this,
    );
  }
}

abstract class _TalleResponseDto implements TalleResponseDto {
  const factory _TalleResponseDto(
      {required final Map<String, dynamic> rawJson}) = _$TalleResponseDtoImpl;

  factory _TalleResponseDto.fromJson(Map<String, dynamic> json) =
      _$TalleResponseDtoImpl.fromJson;

  @override
  Map<String, dynamic> get rawJson;

  /// Create a copy of TalleResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TalleResponseDtoImplCopyWith<_$TalleResponseDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
