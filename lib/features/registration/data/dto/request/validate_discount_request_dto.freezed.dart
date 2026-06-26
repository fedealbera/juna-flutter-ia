// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'validate_discount_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ValidateDiscountRequestDto _$ValidateDiscountRequestDtoFromJson(
    Map<String, dynamic> json) {
  return _ValidateDiscountRequestDto.fromJson(json);
}

/// @nodoc
mixin _$ValidateDiscountRequestDto {
  @JsonKey(name: 'codigo')
  String? get codigo => throw _privateConstructorUsedError;

  /// Serializes this ValidateDiscountRequestDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ValidateDiscountRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ValidateDiscountRequestDtoCopyWith<ValidateDiscountRequestDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ValidateDiscountRequestDtoCopyWith<$Res> {
  factory $ValidateDiscountRequestDtoCopyWith(ValidateDiscountRequestDto value,
          $Res Function(ValidateDiscountRequestDto) then) =
      _$ValidateDiscountRequestDtoCopyWithImpl<$Res,
          ValidateDiscountRequestDto>;
  @useResult
  $Res call({@JsonKey(name: 'codigo') String? codigo});
}

/// @nodoc
class _$ValidateDiscountRequestDtoCopyWithImpl<$Res,
        $Val extends ValidateDiscountRequestDto>
    implements $ValidateDiscountRequestDtoCopyWith<$Res> {
  _$ValidateDiscountRequestDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ValidateDiscountRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codigo = freezed,
  }) {
    return _then(_value.copyWith(
      codigo: freezed == codigo
          ? _value.codigo
          : codigo // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ValidateDiscountRequestDtoImplCopyWith<$Res>
    implements $ValidateDiscountRequestDtoCopyWith<$Res> {
  factory _$$ValidateDiscountRequestDtoImplCopyWith(
          _$ValidateDiscountRequestDtoImpl value,
          $Res Function(_$ValidateDiscountRequestDtoImpl) then) =
      __$$ValidateDiscountRequestDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'codigo') String? codigo});
}

/// @nodoc
class __$$ValidateDiscountRequestDtoImplCopyWithImpl<$Res>
    extends _$ValidateDiscountRequestDtoCopyWithImpl<$Res,
        _$ValidateDiscountRequestDtoImpl>
    implements _$$ValidateDiscountRequestDtoImplCopyWith<$Res> {
  __$$ValidateDiscountRequestDtoImplCopyWithImpl(
      _$ValidateDiscountRequestDtoImpl _value,
      $Res Function(_$ValidateDiscountRequestDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ValidateDiscountRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codigo = freezed,
  }) {
    return _then(_$ValidateDiscountRequestDtoImpl(
      codigo: freezed == codigo
          ? _value.codigo
          : codigo // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ValidateDiscountRequestDtoImpl implements _ValidateDiscountRequestDto {
  const _$ValidateDiscountRequestDtoImpl(
      {@JsonKey(name: 'codigo') this.codigo});

  factory _$ValidateDiscountRequestDtoImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ValidateDiscountRequestDtoImplFromJson(json);

  @override
  @JsonKey(name: 'codigo')
  final String? codigo;

  @override
  String toString() {
    return 'ValidateDiscountRequestDto(codigo: $codigo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ValidateDiscountRequestDtoImpl &&
            (identical(other.codigo, codigo) || other.codigo == codigo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, codigo);

  /// Create a copy of ValidateDiscountRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ValidateDiscountRequestDtoImplCopyWith<_$ValidateDiscountRequestDtoImpl>
      get copyWith => __$$ValidateDiscountRequestDtoImplCopyWithImpl<
          _$ValidateDiscountRequestDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ValidateDiscountRequestDtoImplToJson(
      this,
    );
  }
}

abstract class _ValidateDiscountRequestDto
    implements ValidateDiscountRequestDto {
  const factory _ValidateDiscountRequestDto(
          {@JsonKey(name: 'codigo') final String? codigo}) =
      _$ValidateDiscountRequestDtoImpl;

  factory _ValidateDiscountRequestDto.fromJson(Map<String, dynamic> json) =
      _$ValidateDiscountRequestDtoImpl.fromJson;

  @override
  @JsonKey(name: 'codigo')
  String? get codigo;

  /// Create a copy of ValidateDiscountRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ValidateDiscountRequestDtoImplCopyWith<_$ValidateDiscountRequestDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
