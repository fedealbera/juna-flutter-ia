// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'categoria_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CategoriaResponseDto _$CategoriaResponseDtoFromJson(Map<String, dynamic> json) {
  return _CategoriaResponseDto.fromJson(json);
}

/// @nodoc
mixin _$CategoriaResponseDto {
  Map<String, dynamic> get rawJson => throw _privateConstructorUsedError;

  /// Serializes this CategoriaResponseDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CategoriaResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoriaResponseDtoCopyWith<CategoriaResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoriaResponseDtoCopyWith<$Res> {
  factory $CategoriaResponseDtoCopyWith(CategoriaResponseDto value,
          $Res Function(CategoriaResponseDto) then) =
      _$CategoriaResponseDtoCopyWithImpl<$Res, CategoriaResponseDto>;
  @useResult
  $Res call({Map<String, dynamic> rawJson});
}

/// @nodoc
class _$CategoriaResponseDtoCopyWithImpl<$Res,
        $Val extends CategoriaResponseDto>
    implements $CategoriaResponseDtoCopyWith<$Res> {
  _$CategoriaResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoriaResponseDto
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
abstract class _$$CategoriaResponseDtoImplCopyWith<$Res>
    implements $CategoriaResponseDtoCopyWith<$Res> {
  factory _$$CategoriaResponseDtoImplCopyWith(_$CategoriaResponseDtoImpl value,
          $Res Function(_$CategoriaResponseDtoImpl) then) =
      __$$CategoriaResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, dynamic> rawJson});
}

/// @nodoc
class __$$CategoriaResponseDtoImplCopyWithImpl<$Res>
    extends _$CategoriaResponseDtoCopyWithImpl<$Res, _$CategoriaResponseDtoImpl>
    implements _$$CategoriaResponseDtoImplCopyWith<$Res> {
  __$$CategoriaResponseDtoImplCopyWithImpl(_$CategoriaResponseDtoImpl _value,
      $Res Function(_$CategoriaResponseDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoriaResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rawJson = null,
  }) {
    return _then(_$CategoriaResponseDtoImpl(
      rawJson: null == rawJson
          ? _value._rawJson
          : rawJson // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoriaResponseDtoImpl implements _CategoriaResponseDto {
  const _$CategoriaResponseDtoImpl(
      {required final Map<String, dynamic> rawJson})
      : _rawJson = rawJson;

  factory _$CategoriaResponseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoriaResponseDtoImplFromJson(json);

  final Map<String, dynamic> _rawJson;
  @override
  Map<String, dynamic> get rawJson {
    if (_rawJson is EqualUnmodifiableMapView) return _rawJson;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_rawJson);
  }

  @override
  String toString() {
    return 'CategoriaResponseDto(rawJson: $rawJson)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoriaResponseDtoImpl &&
            const DeepCollectionEquality().equals(other._rawJson, _rawJson));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_rawJson));

  /// Create a copy of CategoriaResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoriaResponseDtoImplCopyWith<_$CategoriaResponseDtoImpl>
      get copyWith =>
          __$$CategoriaResponseDtoImplCopyWithImpl<_$CategoriaResponseDtoImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoriaResponseDtoImplToJson(
      this,
    );
  }
}

abstract class _CategoriaResponseDto implements CategoriaResponseDto {
  const factory _CategoriaResponseDto(
          {required final Map<String, dynamic> rawJson}) =
      _$CategoriaResponseDtoImpl;

  factory _CategoriaResponseDto.fromJson(Map<String, dynamic> json) =
      _$CategoriaResponseDtoImpl.fromJson;

  @override
  Map<String, dynamic> get rawJson;

  /// Create a copy of CategoriaResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoriaResponseDtoImplCopyWith<_$CategoriaResponseDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
