// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'validate_discount_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ValidateDiscountResponseDto _$ValidateDiscountResponseDtoFromJson(
    Map<String, dynamic> json) {
  return _ValidateDiscountResponseDto.fromJson(json);
}

/// @nodoc
mixin _$ValidateDiscountResponseDto {
  Map<String, dynamic> get rawJson => throw _privateConstructorUsedError;

  /// Serializes this ValidateDiscountResponseDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ValidateDiscountResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ValidateDiscountResponseDtoCopyWith<ValidateDiscountResponseDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ValidateDiscountResponseDtoCopyWith<$Res> {
  factory $ValidateDiscountResponseDtoCopyWith(
          ValidateDiscountResponseDto value,
          $Res Function(ValidateDiscountResponseDto) then) =
      _$ValidateDiscountResponseDtoCopyWithImpl<$Res,
          ValidateDiscountResponseDto>;
  @useResult
  $Res call({Map<String, dynamic> rawJson});
}

/// @nodoc
class _$ValidateDiscountResponseDtoCopyWithImpl<$Res,
        $Val extends ValidateDiscountResponseDto>
    implements $ValidateDiscountResponseDtoCopyWith<$Res> {
  _$ValidateDiscountResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ValidateDiscountResponseDto
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
abstract class _$$ValidateDiscountResponseDtoImplCopyWith<$Res>
    implements $ValidateDiscountResponseDtoCopyWith<$Res> {
  factory _$$ValidateDiscountResponseDtoImplCopyWith(
          _$ValidateDiscountResponseDtoImpl value,
          $Res Function(_$ValidateDiscountResponseDtoImpl) then) =
      __$$ValidateDiscountResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, dynamic> rawJson});
}

/// @nodoc
class __$$ValidateDiscountResponseDtoImplCopyWithImpl<$Res>
    extends _$ValidateDiscountResponseDtoCopyWithImpl<$Res,
        _$ValidateDiscountResponseDtoImpl>
    implements _$$ValidateDiscountResponseDtoImplCopyWith<$Res> {
  __$$ValidateDiscountResponseDtoImplCopyWithImpl(
      _$ValidateDiscountResponseDtoImpl _value,
      $Res Function(_$ValidateDiscountResponseDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ValidateDiscountResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rawJson = null,
  }) {
    return _then(_$ValidateDiscountResponseDtoImpl(
      rawJson: null == rawJson
          ? _value._rawJson
          : rawJson // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ValidateDiscountResponseDtoImpl
    implements _ValidateDiscountResponseDto {
  const _$ValidateDiscountResponseDtoImpl(
      {required final Map<String, dynamic> rawJson})
      : _rawJson = rawJson;

  factory _$ValidateDiscountResponseDtoImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ValidateDiscountResponseDtoImplFromJson(json);

  final Map<String, dynamic> _rawJson;
  @override
  Map<String, dynamic> get rawJson {
    if (_rawJson is EqualUnmodifiableMapView) return _rawJson;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_rawJson);
  }

  @override
  String toString() {
    return 'ValidateDiscountResponseDto(rawJson: $rawJson)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ValidateDiscountResponseDtoImpl &&
            const DeepCollectionEquality().equals(other._rawJson, _rawJson));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_rawJson));

  /// Create a copy of ValidateDiscountResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ValidateDiscountResponseDtoImplCopyWith<_$ValidateDiscountResponseDtoImpl>
      get copyWith => __$$ValidateDiscountResponseDtoImplCopyWithImpl<
          _$ValidateDiscountResponseDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ValidateDiscountResponseDtoImplToJson(
      this,
    );
  }
}

abstract class _ValidateDiscountResponseDto
    implements ValidateDiscountResponseDto {
  const factory _ValidateDiscountResponseDto(
          {required final Map<String, dynamic> rawJson}) =
      _$ValidateDiscountResponseDtoImpl;

  factory _ValidateDiscountResponseDto.fromJson(Map<String, dynamic> json) =
      _$ValidateDiscountResponseDtoImpl.fromJson;

  @override
  Map<String, dynamic> get rawJson;

  /// Create a copy of ValidateDiscountResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ValidateDiscountResponseDtoImplCopyWith<_$ValidateDiscountResponseDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
