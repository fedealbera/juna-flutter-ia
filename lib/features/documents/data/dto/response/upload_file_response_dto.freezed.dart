// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upload_file_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UploadFileResponseDto _$UploadFileResponseDtoFromJson(
    Map<String, dynamic> json) {
  return _UploadFileResponseDto.fromJson(json);
}

/// @nodoc
mixin _$UploadFileResponseDto {
  Map<String, dynamic> get rawJson => throw _privateConstructorUsedError;

  /// Serializes this UploadFileResponseDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UploadFileResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UploadFileResponseDtoCopyWith<UploadFileResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadFileResponseDtoCopyWith<$Res> {
  factory $UploadFileResponseDtoCopyWith(UploadFileResponseDto value,
          $Res Function(UploadFileResponseDto) then) =
      _$UploadFileResponseDtoCopyWithImpl<$Res, UploadFileResponseDto>;
  @useResult
  $Res call({Map<String, dynamic> rawJson});
}

/// @nodoc
class _$UploadFileResponseDtoCopyWithImpl<$Res,
        $Val extends UploadFileResponseDto>
    implements $UploadFileResponseDtoCopyWith<$Res> {
  _$UploadFileResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UploadFileResponseDto
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
abstract class _$$UploadFileResponseDtoImplCopyWith<$Res>
    implements $UploadFileResponseDtoCopyWith<$Res> {
  factory _$$UploadFileResponseDtoImplCopyWith(
          _$UploadFileResponseDtoImpl value,
          $Res Function(_$UploadFileResponseDtoImpl) then) =
      __$$UploadFileResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, dynamic> rawJson});
}

/// @nodoc
class __$$UploadFileResponseDtoImplCopyWithImpl<$Res>
    extends _$UploadFileResponseDtoCopyWithImpl<$Res,
        _$UploadFileResponseDtoImpl>
    implements _$$UploadFileResponseDtoImplCopyWith<$Res> {
  __$$UploadFileResponseDtoImplCopyWithImpl(_$UploadFileResponseDtoImpl _value,
      $Res Function(_$UploadFileResponseDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of UploadFileResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rawJson = null,
  }) {
    return _then(_$UploadFileResponseDtoImpl(
      rawJson: null == rawJson
          ? _value._rawJson
          : rawJson // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UploadFileResponseDtoImpl implements _UploadFileResponseDto {
  const _$UploadFileResponseDtoImpl(
      {required final Map<String, dynamic> rawJson})
      : _rawJson = rawJson;

  factory _$UploadFileResponseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UploadFileResponseDtoImplFromJson(json);

  final Map<String, dynamic> _rawJson;
  @override
  Map<String, dynamic> get rawJson {
    if (_rawJson is EqualUnmodifiableMapView) return _rawJson;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_rawJson);
  }

  @override
  String toString() {
    return 'UploadFileResponseDto(rawJson: $rawJson)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadFileResponseDtoImpl &&
            const DeepCollectionEquality().equals(other._rawJson, _rawJson));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_rawJson));

  /// Create a copy of UploadFileResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadFileResponseDtoImplCopyWith<_$UploadFileResponseDtoImpl>
      get copyWith => __$$UploadFileResponseDtoImplCopyWithImpl<
          _$UploadFileResponseDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UploadFileResponseDtoImplToJson(
      this,
    );
  }
}

abstract class _UploadFileResponseDto implements UploadFileResponseDto {
  const factory _UploadFileResponseDto(
          {required final Map<String, dynamic> rawJson}) =
      _$UploadFileResponseDtoImpl;

  factory _UploadFileResponseDto.fromJson(Map<String, dynamic> json) =
      _$UploadFileResponseDtoImpl.fromJson;

  @override
  Map<String, dynamic> get rawJson;

  /// Create a copy of UploadFileResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UploadFileResponseDtoImplCopyWith<_$UploadFileResponseDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
