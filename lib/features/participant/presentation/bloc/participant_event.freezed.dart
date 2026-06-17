// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'participant_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ParticipantEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String dni, String idEvento, String idOrg, String token)
        authenticate,
    required TResult Function(
            String dni, String idOrg, String eventoId, String? roundId)
        getDetail,
    required TResult Function(String partiId, String contNombre, String contTel)
        updateEmergency,
    required TResult Function(
            String partiId,
            String? domCiudad,
            String? domCiudadNombre,
            String? domProvincia,
            String? domPais,
            String? contInstagram,
            String? contCelular,
            String? contEmail)
        updateContact,
    required TResult Function(String partiId, String insId, String circuitoId,
            String categoriaId, String talleId)
        updateCircuito,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String dni, String idEvento, String idOrg, String token)?
        authenticate,
    TResult? Function(
            String dni, String idOrg, String eventoId, String? roundId)?
        getDetail,
    TResult? Function(String partiId, String contNombre, String contTel)?
        updateEmergency,
    TResult? Function(
            String partiId,
            String? domCiudad,
            String? domCiudadNombre,
            String? domProvincia,
            String? domPais,
            String? contInstagram,
            String? contCelular,
            String? contEmail)?
        updateContact,
    TResult? Function(String partiId, String insId, String circuitoId,
            String categoriaId, String talleId)?
        updateCircuito,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String dni, String idEvento, String idOrg, String token)?
        authenticate,
    TResult Function(
            String dni, String idOrg, String eventoId, String? roundId)?
        getDetail,
    TResult Function(String partiId, String contNombre, String contTel)?
        updateEmergency,
    TResult Function(
            String partiId,
            String? domCiudad,
            String? domCiudadNombre,
            String? domProvincia,
            String? domPais,
            String? contInstagram,
            String? contCelular,
            String? contEmail)?
        updateContact,
    TResult Function(String partiId, String insId, String circuitoId,
            String categoriaId, String talleId)?
        updateCircuito,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Authenticate value) authenticate,
    required TResult Function(GetDetail value) getDetail,
    required TResult Function(UpdateEmergencyEvent value) updateEmergency,
    required TResult Function(UpdateContactEvent value) updateContact,
    required TResult Function(UpdateCircuitoEvent value) updateCircuito,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Authenticate value)? authenticate,
    TResult? Function(GetDetail value)? getDetail,
    TResult? Function(UpdateEmergencyEvent value)? updateEmergency,
    TResult? Function(UpdateContactEvent value)? updateContact,
    TResult? Function(UpdateCircuitoEvent value)? updateCircuito,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Authenticate value)? authenticate,
    TResult Function(GetDetail value)? getDetail,
    TResult Function(UpdateEmergencyEvent value)? updateEmergency,
    TResult Function(UpdateContactEvent value)? updateContact,
    TResult Function(UpdateCircuitoEvent value)? updateCircuito,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParticipantEventCopyWith<$Res> {
  factory $ParticipantEventCopyWith(
          ParticipantEvent value, $Res Function(ParticipantEvent) then) =
      _$ParticipantEventCopyWithImpl<$Res, ParticipantEvent>;
}

/// @nodoc
class _$ParticipantEventCopyWithImpl<$Res, $Val extends ParticipantEvent>
    implements $ParticipantEventCopyWith<$Res> {
  _$ParticipantEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ParticipantEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$AuthenticateImplCopyWith<$Res> {
  factory _$$AuthenticateImplCopyWith(
          _$AuthenticateImpl value, $Res Function(_$AuthenticateImpl) then) =
      __$$AuthenticateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String dni, String idEvento, String idOrg, String token});
}

/// @nodoc
class __$$AuthenticateImplCopyWithImpl<$Res>
    extends _$ParticipantEventCopyWithImpl<$Res, _$AuthenticateImpl>
    implements _$$AuthenticateImplCopyWith<$Res> {
  __$$AuthenticateImplCopyWithImpl(
      _$AuthenticateImpl _value, $Res Function(_$AuthenticateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ParticipantEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dni = null,
    Object? idEvento = null,
    Object? idOrg = null,
    Object? token = null,
  }) {
    return _then(_$AuthenticateImpl(
      dni: null == dni
          ? _value.dni
          : dni // ignore: cast_nullable_to_non_nullable
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

class _$AuthenticateImpl implements Authenticate {
  const _$AuthenticateImpl(
      {required this.dni,
      required this.idEvento,
      required this.idOrg,
      required this.token});

  @override
  final String dni;
  @override
  final String idEvento;
  @override
  final String idOrg;
  @override
  final String token;

  @override
  String toString() {
    return 'ParticipantEvent.authenticate(dni: $dni, idEvento: $idEvento, idOrg: $idOrg, token: $token)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthenticateImpl &&
            (identical(other.dni, dni) || other.dni == dni) &&
            (identical(other.idEvento, idEvento) ||
                other.idEvento == idEvento) &&
            (identical(other.idOrg, idOrg) || other.idOrg == idOrg) &&
            (identical(other.token, token) || other.token == token));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dni, idEvento, idOrg, token);

  /// Create a copy of ParticipantEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthenticateImplCopyWith<_$AuthenticateImpl> get copyWith =>
      __$$AuthenticateImplCopyWithImpl<_$AuthenticateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String dni, String idEvento, String idOrg, String token)
        authenticate,
    required TResult Function(
            String dni, String idOrg, String eventoId, String? roundId)
        getDetail,
    required TResult Function(String partiId, String contNombre, String contTel)
        updateEmergency,
    required TResult Function(
            String partiId,
            String? domCiudad,
            String? domCiudadNombre,
            String? domProvincia,
            String? domPais,
            String? contInstagram,
            String? contCelular,
            String? contEmail)
        updateContact,
    required TResult Function(String partiId, String insId, String circuitoId,
            String categoriaId, String talleId)
        updateCircuito,
  }) {
    return authenticate(dni, idEvento, idOrg, token);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String dni, String idEvento, String idOrg, String token)?
        authenticate,
    TResult? Function(
            String dni, String idOrg, String eventoId, String? roundId)?
        getDetail,
    TResult? Function(String partiId, String contNombre, String contTel)?
        updateEmergency,
    TResult? Function(
            String partiId,
            String? domCiudad,
            String? domCiudadNombre,
            String? domProvincia,
            String? domPais,
            String? contInstagram,
            String? contCelular,
            String? contEmail)?
        updateContact,
    TResult? Function(String partiId, String insId, String circuitoId,
            String categoriaId, String talleId)?
        updateCircuito,
  }) {
    return authenticate?.call(dni, idEvento, idOrg, token);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String dni, String idEvento, String idOrg, String token)?
        authenticate,
    TResult Function(
            String dni, String idOrg, String eventoId, String? roundId)?
        getDetail,
    TResult Function(String partiId, String contNombre, String contTel)?
        updateEmergency,
    TResult Function(
            String partiId,
            String? domCiudad,
            String? domCiudadNombre,
            String? domProvincia,
            String? domPais,
            String? contInstagram,
            String? contCelular,
            String? contEmail)?
        updateContact,
    TResult Function(String partiId, String insId, String circuitoId,
            String categoriaId, String talleId)?
        updateCircuito,
    required TResult orElse(),
  }) {
    if (authenticate != null) {
      return authenticate(dni, idEvento, idOrg, token);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Authenticate value) authenticate,
    required TResult Function(GetDetail value) getDetail,
    required TResult Function(UpdateEmergencyEvent value) updateEmergency,
    required TResult Function(UpdateContactEvent value) updateContact,
    required TResult Function(UpdateCircuitoEvent value) updateCircuito,
  }) {
    return authenticate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Authenticate value)? authenticate,
    TResult? Function(GetDetail value)? getDetail,
    TResult? Function(UpdateEmergencyEvent value)? updateEmergency,
    TResult? Function(UpdateContactEvent value)? updateContact,
    TResult? Function(UpdateCircuitoEvent value)? updateCircuito,
  }) {
    return authenticate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Authenticate value)? authenticate,
    TResult Function(GetDetail value)? getDetail,
    TResult Function(UpdateEmergencyEvent value)? updateEmergency,
    TResult Function(UpdateContactEvent value)? updateContact,
    TResult Function(UpdateCircuitoEvent value)? updateCircuito,
    required TResult orElse(),
  }) {
    if (authenticate != null) {
      return authenticate(this);
    }
    return orElse();
  }
}

abstract class Authenticate implements ParticipantEvent {
  const factory Authenticate(
      {required final String dni,
      required final String idEvento,
      required final String idOrg,
      required final String token}) = _$AuthenticateImpl;

  String get dni;
  String get idEvento;
  String get idOrg;
  String get token;

  /// Create a copy of ParticipantEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthenticateImplCopyWith<_$AuthenticateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetDetailImplCopyWith<$Res> {
  factory _$$GetDetailImplCopyWith(
          _$GetDetailImpl value, $Res Function(_$GetDetailImpl) then) =
      __$$GetDetailImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String dni, String idOrg, String eventoId, String? roundId});
}

/// @nodoc
class __$$GetDetailImplCopyWithImpl<$Res>
    extends _$ParticipantEventCopyWithImpl<$Res, _$GetDetailImpl>
    implements _$$GetDetailImplCopyWith<$Res> {
  __$$GetDetailImplCopyWithImpl(
      _$GetDetailImpl _value, $Res Function(_$GetDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of ParticipantEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dni = null,
    Object? idOrg = null,
    Object? eventoId = null,
    Object? roundId = freezed,
  }) {
    return _then(_$GetDetailImpl(
      dni: null == dni
          ? _value.dni
          : dni // ignore: cast_nullable_to_non_nullable
              as String,
      idOrg: null == idOrg
          ? _value.idOrg
          : idOrg // ignore: cast_nullable_to_non_nullable
              as String,
      eventoId: null == eventoId
          ? _value.eventoId
          : eventoId // ignore: cast_nullable_to_non_nullable
              as String,
      roundId: freezed == roundId
          ? _value.roundId
          : roundId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$GetDetailImpl implements GetDetail {
  const _$GetDetailImpl(
      {required this.dni,
      required this.idOrg,
      required this.eventoId,
      this.roundId});

  @override
  final String dni;
  @override
  final String idOrg;
  @override
  final String eventoId;
  @override
  final String? roundId;

  @override
  String toString() {
    return 'ParticipantEvent.getDetail(dni: $dni, idOrg: $idOrg, eventoId: $eventoId, roundId: $roundId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetDetailImpl &&
            (identical(other.dni, dni) || other.dni == dni) &&
            (identical(other.idOrg, idOrg) || other.idOrg == idOrg) &&
            (identical(other.eventoId, eventoId) ||
                other.eventoId == eventoId) &&
            (identical(other.roundId, roundId) || other.roundId == roundId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dni, idOrg, eventoId, roundId);

  /// Create a copy of ParticipantEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetDetailImplCopyWith<_$GetDetailImpl> get copyWith =>
      __$$GetDetailImplCopyWithImpl<_$GetDetailImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String dni, String idEvento, String idOrg, String token)
        authenticate,
    required TResult Function(
            String dni, String idOrg, String eventoId, String? roundId)
        getDetail,
    required TResult Function(String partiId, String contNombre, String contTel)
        updateEmergency,
    required TResult Function(
            String partiId,
            String? domCiudad,
            String? domCiudadNombre,
            String? domProvincia,
            String? domPais,
            String? contInstagram,
            String? contCelular,
            String? contEmail)
        updateContact,
    required TResult Function(String partiId, String insId, String circuitoId,
            String categoriaId, String talleId)
        updateCircuito,
  }) {
    return getDetail(dni, idOrg, eventoId, roundId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String dni, String idEvento, String idOrg, String token)?
        authenticate,
    TResult? Function(
            String dni, String idOrg, String eventoId, String? roundId)?
        getDetail,
    TResult? Function(String partiId, String contNombre, String contTel)?
        updateEmergency,
    TResult? Function(
            String partiId,
            String? domCiudad,
            String? domCiudadNombre,
            String? domProvincia,
            String? domPais,
            String? contInstagram,
            String? contCelular,
            String? contEmail)?
        updateContact,
    TResult? Function(String partiId, String insId, String circuitoId,
            String categoriaId, String talleId)?
        updateCircuito,
  }) {
    return getDetail?.call(dni, idOrg, eventoId, roundId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String dni, String idEvento, String idOrg, String token)?
        authenticate,
    TResult Function(
            String dni, String idOrg, String eventoId, String? roundId)?
        getDetail,
    TResult Function(String partiId, String contNombre, String contTel)?
        updateEmergency,
    TResult Function(
            String partiId,
            String? domCiudad,
            String? domCiudadNombre,
            String? domProvincia,
            String? domPais,
            String? contInstagram,
            String? contCelular,
            String? contEmail)?
        updateContact,
    TResult Function(String partiId, String insId, String circuitoId,
            String categoriaId, String talleId)?
        updateCircuito,
    required TResult orElse(),
  }) {
    if (getDetail != null) {
      return getDetail(dni, idOrg, eventoId, roundId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Authenticate value) authenticate,
    required TResult Function(GetDetail value) getDetail,
    required TResult Function(UpdateEmergencyEvent value) updateEmergency,
    required TResult Function(UpdateContactEvent value) updateContact,
    required TResult Function(UpdateCircuitoEvent value) updateCircuito,
  }) {
    return getDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Authenticate value)? authenticate,
    TResult? Function(GetDetail value)? getDetail,
    TResult? Function(UpdateEmergencyEvent value)? updateEmergency,
    TResult? Function(UpdateContactEvent value)? updateContact,
    TResult? Function(UpdateCircuitoEvent value)? updateCircuito,
  }) {
    return getDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Authenticate value)? authenticate,
    TResult Function(GetDetail value)? getDetail,
    TResult Function(UpdateEmergencyEvent value)? updateEmergency,
    TResult Function(UpdateContactEvent value)? updateContact,
    TResult Function(UpdateCircuitoEvent value)? updateCircuito,
    required TResult orElse(),
  }) {
    if (getDetail != null) {
      return getDetail(this);
    }
    return orElse();
  }
}

abstract class GetDetail implements ParticipantEvent {
  const factory GetDetail(
      {required final String dni,
      required final String idOrg,
      required final String eventoId,
      final String? roundId}) = _$GetDetailImpl;

  String get dni;
  String get idOrg;
  String get eventoId;
  String? get roundId;

  /// Create a copy of ParticipantEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetDetailImplCopyWith<_$GetDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateEmergencyEventImplCopyWith<$Res> {
  factory _$$UpdateEmergencyEventImplCopyWith(_$UpdateEmergencyEventImpl value,
          $Res Function(_$UpdateEmergencyEventImpl) then) =
      __$$UpdateEmergencyEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String partiId, String contNombre, String contTel});
}

/// @nodoc
class __$$UpdateEmergencyEventImplCopyWithImpl<$Res>
    extends _$ParticipantEventCopyWithImpl<$Res, _$UpdateEmergencyEventImpl>
    implements _$$UpdateEmergencyEventImplCopyWith<$Res> {
  __$$UpdateEmergencyEventImplCopyWithImpl(_$UpdateEmergencyEventImpl _value,
      $Res Function(_$UpdateEmergencyEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of ParticipantEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? partiId = null,
    Object? contNombre = null,
    Object? contTel = null,
  }) {
    return _then(_$UpdateEmergencyEventImpl(
      partiId: null == partiId
          ? _value.partiId
          : partiId // ignore: cast_nullable_to_non_nullable
              as String,
      contNombre: null == contNombre
          ? _value.contNombre
          : contNombre // ignore: cast_nullable_to_non_nullable
              as String,
      contTel: null == contTel
          ? _value.contTel
          : contTel // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UpdateEmergencyEventImpl implements UpdateEmergencyEvent {
  const _$UpdateEmergencyEventImpl(
      {required this.partiId, required this.contNombre, required this.contTel});

  @override
  final String partiId;
  @override
  final String contNombre;
  @override
  final String contTel;

  @override
  String toString() {
    return 'ParticipantEvent.updateEmergency(partiId: $partiId, contNombre: $contNombre, contTel: $contTel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateEmergencyEventImpl &&
            (identical(other.partiId, partiId) || other.partiId == partiId) &&
            (identical(other.contNombre, contNombre) ||
                other.contNombre == contNombre) &&
            (identical(other.contTel, contTel) || other.contTel == contTel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, partiId, contNombre, contTel);

  /// Create a copy of ParticipantEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateEmergencyEventImplCopyWith<_$UpdateEmergencyEventImpl>
      get copyWith =>
          __$$UpdateEmergencyEventImplCopyWithImpl<_$UpdateEmergencyEventImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String dni, String idEvento, String idOrg, String token)
        authenticate,
    required TResult Function(
            String dni, String idOrg, String eventoId, String? roundId)
        getDetail,
    required TResult Function(String partiId, String contNombre, String contTel)
        updateEmergency,
    required TResult Function(
            String partiId,
            String? domCiudad,
            String? domCiudadNombre,
            String? domProvincia,
            String? domPais,
            String? contInstagram,
            String? contCelular,
            String? contEmail)
        updateContact,
    required TResult Function(String partiId, String insId, String circuitoId,
            String categoriaId, String talleId)
        updateCircuito,
  }) {
    return updateEmergency(partiId, contNombre, contTel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String dni, String idEvento, String idOrg, String token)?
        authenticate,
    TResult? Function(
            String dni, String idOrg, String eventoId, String? roundId)?
        getDetail,
    TResult? Function(String partiId, String contNombre, String contTel)?
        updateEmergency,
    TResult? Function(
            String partiId,
            String? domCiudad,
            String? domCiudadNombre,
            String? domProvincia,
            String? domPais,
            String? contInstagram,
            String? contCelular,
            String? contEmail)?
        updateContact,
    TResult? Function(String partiId, String insId, String circuitoId,
            String categoriaId, String talleId)?
        updateCircuito,
  }) {
    return updateEmergency?.call(partiId, contNombre, contTel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String dni, String idEvento, String idOrg, String token)?
        authenticate,
    TResult Function(
            String dni, String idOrg, String eventoId, String? roundId)?
        getDetail,
    TResult Function(String partiId, String contNombre, String contTel)?
        updateEmergency,
    TResult Function(
            String partiId,
            String? domCiudad,
            String? domCiudadNombre,
            String? domProvincia,
            String? domPais,
            String? contInstagram,
            String? contCelular,
            String? contEmail)?
        updateContact,
    TResult Function(String partiId, String insId, String circuitoId,
            String categoriaId, String talleId)?
        updateCircuito,
    required TResult orElse(),
  }) {
    if (updateEmergency != null) {
      return updateEmergency(partiId, contNombre, contTel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Authenticate value) authenticate,
    required TResult Function(GetDetail value) getDetail,
    required TResult Function(UpdateEmergencyEvent value) updateEmergency,
    required TResult Function(UpdateContactEvent value) updateContact,
    required TResult Function(UpdateCircuitoEvent value) updateCircuito,
  }) {
    return updateEmergency(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Authenticate value)? authenticate,
    TResult? Function(GetDetail value)? getDetail,
    TResult? Function(UpdateEmergencyEvent value)? updateEmergency,
    TResult? Function(UpdateContactEvent value)? updateContact,
    TResult? Function(UpdateCircuitoEvent value)? updateCircuito,
  }) {
    return updateEmergency?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Authenticate value)? authenticate,
    TResult Function(GetDetail value)? getDetail,
    TResult Function(UpdateEmergencyEvent value)? updateEmergency,
    TResult Function(UpdateContactEvent value)? updateContact,
    TResult Function(UpdateCircuitoEvent value)? updateCircuito,
    required TResult orElse(),
  }) {
    if (updateEmergency != null) {
      return updateEmergency(this);
    }
    return orElse();
  }
}

abstract class UpdateEmergencyEvent implements ParticipantEvent {
  const factory UpdateEmergencyEvent(
      {required final String partiId,
      required final String contNombre,
      required final String contTel}) = _$UpdateEmergencyEventImpl;

  String get partiId;
  String get contNombre;
  String get contTel;

  /// Create a copy of ParticipantEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateEmergencyEventImplCopyWith<_$UpdateEmergencyEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateContactEventImplCopyWith<$Res> {
  factory _$$UpdateContactEventImplCopyWith(_$UpdateContactEventImpl value,
          $Res Function(_$UpdateContactEventImpl) then) =
      __$$UpdateContactEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String partiId,
      String? domCiudad,
      String? domCiudadNombre,
      String? domProvincia,
      String? domPais,
      String? contInstagram,
      String? contCelular,
      String? contEmail});
}

/// @nodoc
class __$$UpdateContactEventImplCopyWithImpl<$Res>
    extends _$ParticipantEventCopyWithImpl<$Res, _$UpdateContactEventImpl>
    implements _$$UpdateContactEventImplCopyWith<$Res> {
  __$$UpdateContactEventImplCopyWithImpl(_$UpdateContactEventImpl _value,
      $Res Function(_$UpdateContactEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of ParticipantEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? partiId = null,
    Object? domCiudad = freezed,
    Object? domCiudadNombre = freezed,
    Object? domProvincia = freezed,
    Object? domPais = freezed,
    Object? contInstagram = freezed,
    Object? contCelular = freezed,
    Object? contEmail = freezed,
  }) {
    return _then(_$UpdateContactEventImpl(
      partiId: null == partiId
          ? _value.partiId
          : partiId // ignore: cast_nullable_to_non_nullable
              as String,
      domCiudad: freezed == domCiudad
          ? _value.domCiudad
          : domCiudad // ignore: cast_nullable_to_non_nullable
              as String?,
      domCiudadNombre: freezed == domCiudadNombre
          ? _value.domCiudadNombre
          : domCiudadNombre // ignore: cast_nullable_to_non_nullable
              as String?,
      domProvincia: freezed == domProvincia
          ? _value.domProvincia
          : domProvincia // ignore: cast_nullable_to_non_nullable
              as String?,
      domPais: freezed == domPais
          ? _value.domPais
          : domPais // ignore: cast_nullable_to_non_nullable
              as String?,
      contInstagram: freezed == contInstagram
          ? _value.contInstagram
          : contInstagram // ignore: cast_nullable_to_non_nullable
              as String?,
      contCelular: freezed == contCelular
          ? _value.contCelular
          : contCelular // ignore: cast_nullable_to_non_nullable
              as String?,
      contEmail: freezed == contEmail
          ? _value.contEmail
          : contEmail // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UpdateContactEventImpl implements UpdateContactEvent {
  const _$UpdateContactEventImpl(
      {required this.partiId,
      this.domCiudad,
      this.domCiudadNombre,
      this.domProvincia,
      this.domPais,
      this.contInstagram,
      this.contCelular,
      this.contEmail});

  @override
  final String partiId;
  @override
  final String? domCiudad;
  @override
  final String? domCiudadNombre;
  @override
  final String? domProvincia;
  @override
  final String? domPais;
  @override
  final String? contInstagram;
  @override
  final String? contCelular;
  @override
  final String? contEmail;

  @override
  String toString() {
    return 'ParticipantEvent.updateContact(partiId: $partiId, domCiudad: $domCiudad, domCiudadNombre: $domCiudadNombre, domProvincia: $domProvincia, domPais: $domPais, contInstagram: $contInstagram, contCelular: $contCelular, contEmail: $contEmail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateContactEventImpl &&
            (identical(other.partiId, partiId) || other.partiId == partiId) &&
            (identical(other.domCiudad, domCiudad) ||
                other.domCiudad == domCiudad) &&
            (identical(other.domCiudadNombre, domCiudadNombre) ||
                other.domCiudadNombre == domCiudadNombre) &&
            (identical(other.domProvincia, domProvincia) ||
                other.domProvincia == domProvincia) &&
            (identical(other.domPais, domPais) || other.domPais == domPais) &&
            (identical(other.contInstagram, contInstagram) ||
                other.contInstagram == contInstagram) &&
            (identical(other.contCelular, contCelular) ||
                other.contCelular == contCelular) &&
            (identical(other.contEmail, contEmail) ||
                other.contEmail == contEmail));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      partiId,
      domCiudad,
      domCiudadNombre,
      domProvincia,
      domPais,
      contInstagram,
      contCelular,
      contEmail);

  /// Create a copy of ParticipantEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateContactEventImplCopyWith<_$UpdateContactEventImpl> get copyWith =>
      __$$UpdateContactEventImplCopyWithImpl<_$UpdateContactEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String dni, String idEvento, String idOrg, String token)
        authenticate,
    required TResult Function(
            String dni, String idOrg, String eventoId, String? roundId)
        getDetail,
    required TResult Function(String partiId, String contNombre, String contTel)
        updateEmergency,
    required TResult Function(
            String partiId,
            String? domCiudad,
            String? domCiudadNombre,
            String? domProvincia,
            String? domPais,
            String? contInstagram,
            String? contCelular,
            String? contEmail)
        updateContact,
    required TResult Function(String partiId, String insId, String circuitoId,
            String categoriaId, String talleId)
        updateCircuito,
  }) {
    return updateContact(partiId, domCiudad, domCiudadNombre, domProvincia,
        domPais, contInstagram, contCelular, contEmail);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String dni, String idEvento, String idOrg, String token)?
        authenticate,
    TResult? Function(
            String dni, String idOrg, String eventoId, String? roundId)?
        getDetail,
    TResult? Function(String partiId, String contNombre, String contTel)?
        updateEmergency,
    TResult? Function(
            String partiId,
            String? domCiudad,
            String? domCiudadNombre,
            String? domProvincia,
            String? domPais,
            String? contInstagram,
            String? contCelular,
            String? contEmail)?
        updateContact,
    TResult? Function(String partiId, String insId, String circuitoId,
            String categoriaId, String talleId)?
        updateCircuito,
  }) {
    return updateContact?.call(partiId, domCiudad, domCiudadNombre,
        domProvincia, domPais, contInstagram, contCelular, contEmail);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String dni, String idEvento, String idOrg, String token)?
        authenticate,
    TResult Function(
            String dni, String idOrg, String eventoId, String? roundId)?
        getDetail,
    TResult Function(String partiId, String contNombre, String contTel)?
        updateEmergency,
    TResult Function(
            String partiId,
            String? domCiudad,
            String? domCiudadNombre,
            String? domProvincia,
            String? domPais,
            String? contInstagram,
            String? contCelular,
            String? contEmail)?
        updateContact,
    TResult Function(String partiId, String insId, String circuitoId,
            String categoriaId, String talleId)?
        updateCircuito,
    required TResult orElse(),
  }) {
    if (updateContact != null) {
      return updateContact(partiId, domCiudad, domCiudadNombre, domProvincia,
          domPais, contInstagram, contCelular, contEmail);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Authenticate value) authenticate,
    required TResult Function(GetDetail value) getDetail,
    required TResult Function(UpdateEmergencyEvent value) updateEmergency,
    required TResult Function(UpdateContactEvent value) updateContact,
    required TResult Function(UpdateCircuitoEvent value) updateCircuito,
  }) {
    return updateContact(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Authenticate value)? authenticate,
    TResult? Function(GetDetail value)? getDetail,
    TResult? Function(UpdateEmergencyEvent value)? updateEmergency,
    TResult? Function(UpdateContactEvent value)? updateContact,
    TResult? Function(UpdateCircuitoEvent value)? updateCircuito,
  }) {
    return updateContact?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Authenticate value)? authenticate,
    TResult Function(GetDetail value)? getDetail,
    TResult Function(UpdateEmergencyEvent value)? updateEmergency,
    TResult Function(UpdateContactEvent value)? updateContact,
    TResult Function(UpdateCircuitoEvent value)? updateCircuito,
    required TResult orElse(),
  }) {
    if (updateContact != null) {
      return updateContact(this);
    }
    return orElse();
  }
}

abstract class UpdateContactEvent implements ParticipantEvent {
  const factory UpdateContactEvent(
      {required final String partiId,
      final String? domCiudad,
      final String? domCiudadNombre,
      final String? domProvincia,
      final String? domPais,
      final String? contInstagram,
      final String? contCelular,
      final String? contEmail}) = _$UpdateContactEventImpl;

  String get partiId;
  String? get domCiudad;
  String? get domCiudadNombre;
  String? get domProvincia;
  String? get domPais;
  String? get contInstagram;
  String? get contCelular;
  String? get contEmail;

  /// Create a copy of ParticipantEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateContactEventImplCopyWith<_$UpdateContactEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateCircuitoEventImplCopyWith<$Res> {
  factory _$$UpdateCircuitoEventImplCopyWith(_$UpdateCircuitoEventImpl value,
          $Res Function(_$UpdateCircuitoEventImpl) then) =
      __$$UpdateCircuitoEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String partiId,
      String insId,
      String circuitoId,
      String categoriaId,
      String talleId});
}

/// @nodoc
class __$$UpdateCircuitoEventImplCopyWithImpl<$Res>
    extends _$ParticipantEventCopyWithImpl<$Res, _$UpdateCircuitoEventImpl>
    implements _$$UpdateCircuitoEventImplCopyWith<$Res> {
  __$$UpdateCircuitoEventImplCopyWithImpl(_$UpdateCircuitoEventImpl _value,
      $Res Function(_$UpdateCircuitoEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of ParticipantEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? partiId = null,
    Object? insId = null,
    Object? circuitoId = null,
    Object? categoriaId = null,
    Object? talleId = null,
  }) {
    return _then(_$UpdateCircuitoEventImpl(
      partiId: null == partiId
          ? _value.partiId
          : partiId // ignore: cast_nullable_to_non_nullable
              as String,
      insId: null == insId
          ? _value.insId
          : insId // ignore: cast_nullable_to_non_nullable
              as String,
      circuitoId: null == circuitoId
          ? _value.circuitoId
          : circuitoId // ignore: cast_nullable_to_non_nullable
              as String,
      categoriaId: null == categoriaId
          ? _value.categoriaId
          : categoriaId // ignore: cast_nullable_to_non_nullable
              as String,
      talleId: null == talleId
          ? _value.talleId
          : talleId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UpdateCircuitoEventImpl implements UpdateCircuitoEvent {
  const _$UpdateCircuitoEventImpl(
      {required this.partiId,
      required this.insId,
      required this.circuitoId,
      required this.categoriaId,
      required this.talleId});

  @override
  final String partiId;
  @override
  final String insId;
  @override
  final String circuitoId;
  @override
  final String categoriaId;
  @override
  final String talleId;

  @override
  String toString() {
    return 'ParticipantEvent.updateCircuito(partiId: $partiId, insId: $insId, circuitoId: $circuitoId, categoriaId: $categoriaId, talleId: $talleId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateCircuitoEventImpl &&
            (identical(other.partiId, partiId) || other.partiId == partiId) &&
            (identical(other.insId, insId) || other.insId == insId) &&
            (identical(other.circuitoId, circuitoId) ||
                other.circuitoId == circuitoId) &&
            (identical(other.categoriaId, categoriaId) ||
                other.categoriaId == categoriaId) &&
            (identical(other.talleId, talleId) || other.talleId == talleId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, partiId, insId, circuitoId, categoriaId, talleId);

  /// Create a copy of ParticipantEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateCircuitoEventImplCopyWith<_$UpdateCircuitoEventImpl> get copyWith =>
      __$$UpdateCircuitoEventImplCopyWithImpl<_$UpdateCircuitoEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String dni, String idEvento, String idOrg, String token)
        authenticate,
    required TResult Function(
            String dni, String idOrg, String eventoId, String? roundId)
        getDetail,
    required TResult Function(String partiId, String contNombre, String contTel)
        updateEmergency,
    required TResult Function(
            String partiId,
            String? domCiudad,
            String? domCiudadNombre,
            String? domProvincia,
            String? domPais,
            String? contInstagram,
            String? contCelular,
            String? contEmail)
        updateContact,
    required TResult Function(String partiId, String insId, String circuitoId,
            String categoriaId, String talleId)
        updateCircuito,
  }) {
    return updateCircuito(partiId, insId, circuitoId, categoriaId, talleId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String dni, String idEvento, String idOrg, String token)?
        authenticate,
    TResult? Function(
            String dni, String idOrg, String eventoId, String? roundId)?
        getDetail,
    TResult? Function(String partiId, String contNombre, String contTel)?
        updateEmergency,
    TResult? Function(
            String partiId,
            String? domCiudad,
            String? domCiudadNombre,
            String? domProvincia,
            String? domPais,
            String? contInstagram,
            String? contCelular,
            String? contEmail)?
        updateContact,
    TResult? Function(String partiId, String insId, String circuitoId,
            String categoriaId, String talleId)?
        updateCircuito,
  }) {
    return updateCircuito?.call(
        partiId, insId, circuitoId, categoriaId, talleId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String dni, String idEvento, String idOrg, String token)?
        authenticate,
    TResult Function(
            String dni, String idOrg, String eventoId, String? roundId)?
        getDetail,
    TResult Function(String partiId, String contNombre, String contTel)?
        updateEmergency,
    TResult Function(
            String partiId,
            String? domCiudad,
            String? domCiudadNombre,
            String? domProvincia,
            String? domPais,
            String? contInstagram,
            String? contCelular,
            String? contEmail)?
        updateContact,
    TResult Function(String partiId, String insId, String circuitoId,
            String categoriaId, String talleId)?
        updateCircuito,
    required TResult orElse(),
  }) {
    if (updateCircuito != null) {
      return updateCircuito(partiId, insId, circuitoId, categoriaId, talleId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Authenticate value) authenticate,
    required TResult Function(GetDetail value) getDetail,
    required TResult Function(UpdateEmergencyEvent value) updateEmergency,
    required TResult Function(UpdateContactEvent value) updateContact,
    required TResult Function(UpdateCircuitoEvent value) updateCircuito,
  }) {
    return updateCircuito(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Authenticate value)? authenticate,
    TResult? Function(GetDetail value)? getDetail,
    TResult? Function(UpdateEmergencyEvent value)? updateEmergency,
    TResult? Function(UpdateContactEvent value)? updateContact,
    TResult? Function(UpdateCircuitoEvent value)? updateCircuito,
  }) {
    return updateCircuito?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Authenticate value)? authenticate,
    TResult Function(GetDetail value)? getDetail,
    TResult Function(UpdateEmergencyEvent value)? updateEmergency,
    TResult Function(UpdateContactEvent value)? updateContact,
    TResult Function(UpdateCircuitoEvent value)? updateCircuito,
    required TResult orElse(),
  }) {
    if (updateCircuito != null) {
      return updateCircuito(this);
    }
    return orElse();
  }
}

abstract class UpdateCircuitoEvent implements ParticipantEvent {
  const factory UpdateCircuitoEvent(
      {required final String partiId,
      required final String insId,
      required final String circuitoId,
      required final String categoriaId,
      required final String talleId}) = _$UpdateCircuitoEventImpl;

  String get partiId;
  String get insId;
  String get circuitoId;
  String get categoriaId;
  String get talleId;

  /// Create a copy of ParticipantEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateCircuitoEventImplCopyWith<_$UpdateCircuitoEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
