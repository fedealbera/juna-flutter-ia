// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pais_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaisResponseDto _$PaisResponseDtoFromJson(Map<String, dynamic> json) {
  return _PaisResponseDto.fromJson(json);
}

/// @nodoc
mixin _$PaisResponseDto {
  Map<String, dynamic> get rawJson => throw _privateConstructorUsedError;

  /// Serializes this PaisResponseDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaisResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaisResponseDtoCopyWith<PaisResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaisResponseDtoCopyWith<$Res> {
  factory $PaisResponseDtoCopyWith(
          PaisResponseDto value, $Res Function(PaisResponseDto) then) =
      _$PaisResponseDtoCopyWithImpl<$Res, PaisResponseDto>;
  @useResult
  $Res call({Map<String, dynamic> rawJson});
}

/// @nodoc
class _$PaisResponseDtoCopyWithImpl<$Res, $Val extends PaisResponseDto>
    implements $PaisResponseDtoCopyWith<$Res> {
  _$PaisResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaisResponseDto
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
abstract class _$$PaisResponseDtoImplCopyWith<$Res>
    implements $PaisResponseDtoCopyWith<$Res> {
  factory _$$PaisResponseDtoImplCopyWith(_$PaisResponseDtoImpl value,
          $Res Function(_$PaisResponseDtoImpl) then) =
      __$$PaisResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, dynamic> rawJson});
}

/// @nodoc
class __$$PaisResponseDtoImplCopyWithImpl<$Res>
    extends _$PaisResponseDtoCopyWithImpl<$Res, _$PaisResponseDtoImpl>
    implements _$$PaisResponseDtoImplCopyWith<$Res> {
  __$$PaisResponseDtoImplCopyWithImpl(
      _$PaisResponseDtoImpl _value, $Res Function(_$PaisResponseDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaisResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rawJson = null,
  }) {
    return _then(_$PaisResponseDtoImpl(
      rawJson: null == rawJson
          ? _value._rawJson
          : rawJson // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaisResponseDtoImpl implements _PaisResponseDto {
  const _$PaisResponseDtoImpl({required final Map<String, dynamic> rawJson})
      : _rawJson = rawJson;

  factory _$PaisResponseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaisResponseDtoImplFromJson(json);

  final Map<String, dynamic> _rawJson;
  @override
  Map<String, dynamic> get rawJson {
    if (_rawJson is EqualUnmodifiableMapView) return _rawJson;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_rawJson);
  }

  @override
  String toString() {
    return 'PaisResponseDto(rawJson: $rawJson)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaisResponseDtoImpl &&
            const DeepCollectionEquality().equals(other._rawJson, _rawJson));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_rawJson));

  /// Create a copy of PaisResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaisResponseDtoImplCopyWith<_$PaisResponseDtoImpl> get copyWith =>
      __$$PaisResponseDtoImplCopyWithImpl<_$PaisResponseDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaisResponseDtoImplToJson(
      this,
    );
  }
}

abstract class _PaisResponseDto implements PaisResponseDto {
  const factory _PaisResponseDto(
      {required final Map<String, dynamic> rawJson}) = _$PaisResponseDtoImpl;

  factory _PaisResponseDto.fromJson(Map<String, dynamic> json) =
      _$PaisResponseDtoImpl.fromJson;

  @override
  Map<String, dynamic> get rawJson;

  /// Create a copy of PaisResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaisResponseDtoImplCopyWith<_$PaisResponseDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
