// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notifications_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NotificationsEvent {
  String get documento => throw _privateConstructorUsedError;
  String get idEvento => throw _privateConstructorUsedError;
  String get idOrg => throw _privateConstructorUsedError;
  String get token => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String documento, String idEvento, String idOrg, String token)
        registerToken,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String documento, String idEvento, String idOrg, String token)?
        registerToken,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String documento, String idEvento, String idOrg, String token)?
        registerToken,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RegisterToken value) registerToken,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RegisterToken value)? registerToken,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegisterToken value)? registerToken,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of NotificationsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotificationsEventCopyWith<NotificationsEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationsEventCopyWith<$Res> {
  factory $NotificationsEventCopyWith(
          NotificationsEvent value, $Res Function(NotificationsEvent) then) =
      _$NotificationsEventCopyWithImpl<$Res, NotificationsEvent>;
  @useResult
  $Res call({String documento, String idEvento, String idOrg, String token});
}

/// @nodoc
class _$NotificationsEventCopyWithImpl<$Res, $Val extends NotificationsEvent>
    implements $NotificationsEventCopyWith<$Res> {
  _$NotificationsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotificationsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? documento = null,
    Object? idEvento = null,
    Object? idOrg = null,
    Object? token = null,
  }) {
    return _then(_value.copyWith(
      documento: null == documento
          ? _value.documento
          : documento // ignore: cast_nullable_to_non_nullable
              as String,
      idEvento: null == idEvento
          ? _value.idEvento
          : idEvento // ignore: cast_nullable_to_non_nullable
              as String,
      idOrg: null == idOrg
          ? _value.idOrg
          : idOrg // ignore: cast_nullable_to_non_nullable
              as String,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegisterTokenImplCopyWith<$Res>
    implements $NotificationsEventCopyWith<$Res> {
  factory _$$RegisterTokenImplCopyWith(
          _$RegisterTokenImpl value, $Res Function(_$RegisterTokenImpl) then) =
      __$$RegisterTokenImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String documento, String idEvento, String idOrg, String token});
}

/// @nodoc
class __$$RegisterTokenImplCopyWithImpl<$Res>
    extends _$NotificationsEventCopyWithImpl<$Res, _$RegisterTokenImpl>
    implements _$$RegisterTokenImplCopyWith<$Res> {
  __$$RegisterTokenImplCopyWithImpl(
      _$RegisterTokenImpl _value, $Res Function(_$RegisterTokenImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? documento = null,
    Object? idEvento = null,
    Object? idOrg = null,
    Object? token = null,
  }) {
    return _then(_$RegisterTokenImpl(
      documento: null == documento
          ? _value.documento
          : documento // ignore: cast_nullable_to_non_nullable
              as String,
      idEvento: null == idEvento
          ? _value.idEvento
          : idEvento // ignore: cast_nullable_to_non_nullable
              as String,
      idOrg: null == idOrg
          ? _value.idOrg
          : idOrg // ignore: cast_nullable_to_non_nullable
              as String,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RegisterTokenImpl implements RegisterToken {
  const _$RegisterTokenImpl(
      {required this.documento,
      required this.idEvento,
      required this.idOrg,
      required this.token});

  @override
  final String documento;
  @override
  final String idEvento;
  @override
  final String idOrg;
  @override
  final String token;

  @override
  String toString() {
    return 'NotificationsEvent.registerToken(documento: $documento, idEvento: $idEvento, idOrg: $idOrg, token: $token)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterTokenImpl &&
            (identical(other.documento, documento) ||
                other.documento == documento) &&
            (identical(other.idEvento, idEvento) ||
                other.idEvento == idEvento) &&
            (identical(other.idOrg, idOrg) || other.idOrg == idOrg) &&
            (identical(other.token, token) || other.token == token));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, documento, idEvento, idOrg, token);

  /// Create a copy of NotificationsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterTokenImplCopyWith<_$RegisterTokenImpl> get copyWith =>
      __$$RegisterTokenImplCopyWithImpl<_$RegisterTokenImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String documento, String idEvento, String idOrg, String token)
        registerToken,
  }) {
    return registerToken(documento, idEvento, idOrg, token);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String documento, String idEvento, String idOrg, String token)?
        registerToken,
  }) {
    return registerToken?.call(documento, idEvento, idOrg, token);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String documento, String idEvento, String idOrg, String token)?
        registerToken,
    required TResult orElse(),
  }) {
    if (registerToken != null) {
      return registerToken(documento, idEvento, idOrg, token);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RegisterToken value) registerToken,
  }) {
    return registerToken(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RegisterToken value)? registerToken,
  }) {
    return registerToken?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegisterToken value)? registerToken,
    required TResult orElse(),
  }) {
    if (registerToken != null) {
      return registerToken(this);
    }
    return orElse();
  }
}

abstract class RegisterToken implements NotificationsEvent {
  const factory RegisterToken(
      {required final String documento,
      required final String idEvento,
      required final String idOrg,
      required final String token}) = _$RegisterTokenImpl;

  @override
  String get documento;
  @override
  String get idEvento;
  @override
  String get idOrg;
  @override
  String get token;

  /// Create a copy of NotificationsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegisterTokenImplCopyWith<_$RegisterTokenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
