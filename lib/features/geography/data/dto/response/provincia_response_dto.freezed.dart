// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'provincia_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProvinciaResponseDto _$ProvinciaResponseDtoFromJson(Map<String, dynamic> json) {
  return _ProvinciaResponseDto.fromJson(json);
}

/// @nodoc
mixin _$ProvinciaResponseDto {
  Map<String, dynamic> get rawJson => throw _privateConstructorUsedError;

  /// Serializes this ProvinciaResponseDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProvinciaResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProvinciaResponseDtoCopyWith<ProvinciaResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProvinciaResponseDtoCopyWith<$Res> {
  factory $ProvinciaResponseDtoCopyWith(ProvinciaResponseDto value,
          $Res Function(ProvinciaResponseDto) then) =
      _$ProvinciaResponseDtoCopyWithImpl<$Res, ProvinciaResponseDto>;
  @useResult
  $Res call({Map<String, dynamic> rawJson});
}

/// @nodoc
class _$ProvinciaResponseDtoCopyWithImpl<$Res,
        $Val extends ProvinciaResponseDto>
    implements $ProvinciaResponseDtoCopyWith<$Res> {
  _$ProvinciaResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProvinciaResponseDto
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
abstract class _$$ProvinciaResponseDtoImplCopyWith<$Res>
    implements $ProvinciaResponseDtoCopyWith<$Res> {
  factory _$$ProvinciaResponseDtoImplCopyWith(_$ProvinciaResponseDtoImpl value,
          $Res Function(_$ProvinciaResponseDtoImpl) then) =
      __$$ProvinciaResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, dynamic> rawJson});
}

/// @nodoc
class __$$ProvinciaResponseDtoImplCopyWithImpl<$Res>
    extends _$ProvinciaResponseDtoCopyWithImpl<$Res, _$ProvinciaResponseDtoImpl>
    implements _$$ProvinciaResponseDtoImplCopyWith<$Res> {
  __$$ProvinciaResponseDtoImplCopyWithImpl(_$ProvinciaResponseDtoImpl _value,
      $Res Function(_$ProvinciaResponseDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProvinciaResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rawJson = null,
  }) {
    return _then(_$ProvinciaResponseDtoImpl(
      rawJson: null == rawJson
          ? _value._rawJson
          : rawJson // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProvinciaResponseDtoImpl implements _ProvinciaResponseDto {
  const _$ProvinciaResponseDtoImpl(
      {required final Map<String, dynamic> rawJson})
      : _rawJson = rawJson;

  factory _$ProvinciaResponseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProvinciaResponseDtoImplFromJson(json);

  final Map<String, dynamic> _rawJson;
  @override
  Map<String, dynamic> get rawJson {
    if (_rawJson is EqualUnmodifiableMapView) return _rawJson;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_rawJson);
  }

  @override
  String toString() {
    return 'ProvinciaResponseDto(rawJson: $rawJson)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProvinciaResponseDtoImpl &&
            const DeepCollectionEquality().equals(other._rawJson, _rawJson));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_rawJson));

  /// Create a copy of ProvinciaResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProvinciaResponseDtoImplCopyWith<_$ProvinciaResponseDtoImpl>
      get copyWith =>
          __$$ProvinciaResponseDtoImplCopyWithImpl<_$ProvinciaResponseDtoImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProvinciaResponseDtoImplToJson(
      this,
    );
  }
}

abstract class _ProvinciaResponseDto implements ProvinciaResponseDto {
  const factory _ProvinciaResponseDto(
          {required final Map<String, dynamic> rawJson}) =
      _$ProvinciaResponseDtoImpl;

  factory _ProvinciaResponseDto.fromJson(Map<String, dynamic> json) =
      _$ProvinciaResponseDtoImpl.fromJson;

  @override
  Map<String, dynamic> get rawJson;

  /// Create a copy of ProvinciaResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProvinciaResponseDtoImplCopyWith<_$ProvinciaResponseDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
