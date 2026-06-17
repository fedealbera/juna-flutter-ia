// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'registration_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RegistrationEvent {
  String get insId => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String insId, String code) validateDiscount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String insId, String code)? validateDiscount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String insId, String code)? validateDiscount,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ValidateDiscountEvent value) validateDiscount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ValidateDiscountEvent value)? validateDiscount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ValidateDiscountEvent value)? validateDiscount,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of RegistrationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RegistrationEventCopyWith<RegistrationEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegistrationEventCopyWith<$Res> {
  factory $RegistrationEventCopyWith(
          RegistrationEvent value, $Res Function(RegistrationEvent) then) =
      _$RegistrationEventCopyWithImpl<$Res, RegistrationEvent>;
  @useResult
  $Res call({String insId, String code});
}

/// @nodoc
class _$RegistrationEventCopyWithImpl<$Res, $Val extends RegistrationEvent>
    implements $RegistrationEventCopyWith<$Res> {
  _$RegistrationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegistrationEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? insId = null,
    Object? code = null,
  }) {
    return _then(_value.copyWith(
      insId: null == insId
          ? _value.insId
          : insId // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ValidateDiscountEventImplCopyWith<$Res>
    implements $RegistrationEventCopyWith<$Res> {
  factory _$$ValidateDiscountEventImplCopyWith(
          _$ValidateDiscountEventImpl value,
          $Res Function(_$ValidateDiscountEventImpl) then) =
      __$$ValidateDiscountEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String insId, String code});
}

/// @nodoc
class __$$ValidateDiscountEventImplCopyWithImpl<$Res>
    extends _$RegistrationEventCopyWithImpl<$Res, _$ValidateDiscountEventImpl>
    implements _$$ValidateDiscountEventImplCopyWith<$Res> {
  __$$ValidateDiscountEventImplCopyWithImpl(_$ValidateDiscountEventImpl _value,
      $Res Function(_$ValidateDiscountEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of RegistrationEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? insId = null,
    Object? code = null,
  }) {
    return _then(_$ValidateDiscountEventImpl(
      insId: null == insId
          ? _value.insId
          : insId // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ValidateDiscountEventImpl implements ValidateDiscountEvent {
  const _$ValidateDiscountEventImpl({required this.insId, required this.code});

  @override
  final String insId;
  @override
  final String code;

  @override
  String toString() {
    return 'RegistrationEvent.validateDiscount(insId: $insId, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ValidateDiscountEventImpl &&
            (identical(other.insId, insId) || other.insId == insId) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, insId, code);

  /// Create a copy of RegistrationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ValidateDiscountEventImplCopyWith<_$ValidateDiscountEventImpl>
      get copyWith => __$$ValidateDiscountEventImplCopyWithImpl<
          _$ValidateDiscountEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String insId, String code) validateDiscount,
  }) {
    return validateDiscount(insId, code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String insId, String code)? validateDiscount,
  }) {
    return validateDiscount?.call(insId, code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String insId, String code)? validateDiscount,
    required TResult orElse(),
  }) {
    if (validateDiscount != null) {
      return validateDiscount(insId, code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ValidateDiscountEvent value) validateDiscount,
  }) {
    return validateDiscount(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ValidateDiscountEvent value)? validateDiscount,
  }) {
    return validateDiscount?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ValidateDiscountEvent value)? validateDiscount,
    required TResult orElse(),
  }) {
    if (validateDiscount != null) {
      return validateDiscount(this);
    }
    return orElse();
  }
}

abstract class ValidateDiscountEvent implements RegistrationEvent {
  const factory ValidateDiscountEvent(
      {required final String insId,
      required final String code}) = _$ValidateDiscountEventImpl;

  @override
  String get insId;
  @override
  String get code;

  /// Create a copy of RegistrationEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ValidateDiscountEventImplCopyWith<_$ValidateDiscountEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}
