// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'participant_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ParticipantState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ParticipantAuth auth) authenticated,
    required TResult Function(ParticipantDetail detail) detailLoaded,
    required TResult Function(UpdateEmergencyEntity result) emergencyUpdated,
    required TResult Function(UpdateContactEntity result) contactUpdated,
    required TResult Function(UpdateCircuitoEntity result) circuitoUpdated,
    required TResult Function(UpdateParticipantEntity result)
        participantUpdated,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ParticipantAuth auth)? authenticated,
    TResult? Function(ParticipantDetail detail)? detailLoaded,
    TResult? Function(UpdateEmergencyEntity result)? emergencyUpdated,
    TResult? Function(UpdateContactEntity result)? contactUpdated,
    TResult? Function(UpdateCircuitoEntity result)? circuitoUpdated,
    TResult? Function(UpdateParticipantEntity result)? participantUpdated,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ParticipantAuth auth)? authenticated,
    TResult Function(ParticipantDetail detail)? detailLoaded,
    TResult Function(UpdateEmergencyEntity result)? emergencyUpdated,
    TResult Function(UpdateContactEntity result)? contactUpdated,
    TResult Function(UpdateCircuitoEntity result)? circuitoUpdated,
    TResult Function(UpdateParticipantEntity result)? participantUpdated,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ParticipantInitial value) initial,
    required TResult Function(ParticipantLoading value) loading,
    required TResult Function(ParticipantAuthenticated value) authenticated,
    required TResult Function(ParticipantDetailLoaded value) detailLoaded,
    required TResult Function(ParticipantEmergencyUpdated value)
        emergencyUpdated,
    required TResult Function(ParticipantContactUpdated value) contactUpdated,
    required TResult Function(ParticipantCircuitoUpdated value) circuitoUpdated,
    required TResult Function(ParticipantUpdated value) participantUpdated,
    required TResult Function(ParticipantError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ParticipantInitial value)? initial,
    TResult? Function(ParticipantLoading value)? loading,
    TResult? Function(ParticipantAuthenticated value)? authenticated,
    TResult? Function(ParticipantDetailLoaded value)? detailLoaded,
    TResult? Function(ParticipantEmergencyUpdated value)? emergencyUpdated,
    TResult? Function(ParticipantContactUpdated value)? contactUpdated,
    TResult? Function(ParticipantCircuitoUpdated value)? circuitoUpdated,
    TResult? Function(ParticipantUpdated value)? participantUpdated,
    TResult? Function(ParticipantError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ParticipantInitial value)? initial,
    TResult Function(ParticipantLoading value)? loading,
    TResult Function(ParticipantAuthenticated value)? authenticated,
    TResult Function(ParticipantDetailLoaded value)? detailLoaded,
    TResult Function(ParticipantEmergencyUpdated value)? emergencyUpdated,
    TResult Function(ParticipantContactUpdated value)? contactUpdated,
    TResult Function(ParticipantCircuitoUpdated value)? circuitoUpdated,
    TResult Function(ParticipantUpdated value)? participantUpdated,
    TResult Function(ParticipantError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParticipantStateCopyWith<$Res> {
  factory $ParticipantStateCopyWith(
          ParticipantState value, $Res Function(ParticipantState) then) =
      _$ParticipantStateCopyWithImpl<$Res, ParticipantState>;
}

/// @nodoc
class _$ParticipantStateCopyWithImpl<$Res, $Val extends ParticipantState>
    implements $ParticipantStateCopyWith<$Res> {
  _$ParticipantStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ParticipantState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ParticipantInitialImplCopyWith<$Res> {
  factory _$$ParticipantInitialImplCopyWith(_$ParticipantInitialImpl value,
          $Res Function(_$ParticipantInitialImpl) then) =
      __$$ParticipantInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ParticipantInitialImplCopyWithImpl<$Res>
    extends _$ParticipantStateCopyWithImpl<$Res, _$ParticipantInitialImpl>
    implements _$$ParticipantInitialImplCopyWith<$Res> {
  __$$ParticipantInitialImplCopyWithImpl(_$ParticipantInitialImpl _value,
      $Res Function(_$ParticipantInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of ParticipantState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ParticipantInitialImpl implements ParticipantInitial {
  const _$ParticipantInitialImpl();

  @override
  String toString() {
    return 'ParticipantState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ParticipantInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ParticipantAuth auth) authenticated,
    required TResult Function(ParticipantDetail detail) detailLoaded,
    required TResult Function(UpdateEmergencyEntity result) emergencyUpdated,
    required TResult Function(UpdateContactEntity result) contactUpdated,
    required TResult Function(UpdateCircuitoEntity result) circuitoUpdated,
    required TResult Function(UpdateParticipantEntity result)
        participantUpdated,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ParticipantAuth auth)? authenticated,
    TResult? Function(ParticipantDetail detail)? detailLoaded,
    TResult? Function(UpdateEmergencyEntity result)? emergencyUpdated,
    TResult? Function(UpdateContactEntity result)? contactUpdated,
    TResult? Function(UpdateCircuitoEntity result)? circuitoUpdated,
    TResult? Function(UpdateParticipantEntity result)? participantUpdated,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ParticipantAuth auth)? authenticated,
    TResult Function(ParticipantDetail detail)? detailLoaded,
    TResult Function(UpdateEmergencyEntity result)? emergencyUpdated,
    TResult Function(UpdateContactEntity result)? contactUpdated,
    TResult Function(UpdateCircuitoEntity result)? circuitoUpdated,
    TResult Function(UpdateParticipantEntity result)? participantUpdated,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ParticipantInitial value) initial,
    required TResult Function(ParticipantLoading value) loading,
    required TResult Function(ParticipantAuthenticated value) authenticated,
    required TResult Function(ParticipantDetailLoaded value) detailLoaded,
    required TResult Function(ParticipantEmergencyUpdated value)
        emergencyUpdated,
    required TResult Function(ParticipantContactUpdated value) contactUpdated,
    required TResult Function(ParticipantCircuitoUpdated value) circuitoUpdated,
    required TResult Function(ParticipantUpdated value) participantUpdated,
    required TResult Function(ParticipantError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ParticipantInitial value)? initial,
    TResult? Function(ParticipantLoading value)? loading,
    TResult? Function(ParticipantAuthenticated value)? authenticated,
    TResult? Function(ParticipantDetailLoaded value)? detailLoaded,
    TResult? Function(ParticipantEmergencyUpdated value)? emergencyUpdated,
    TResult? Function(ParticipantContactUpdated value)? contactUpdated,
    TResult? Function(ParticipantCircuitoUpdated value)? circuitoUpdated,
    TResult? Function(ParticipantUpdated value)? participantUpdated,
    TResult? Function(ParticipantError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ParticipantInitial value)? initial,
    TResult Function(ParticipantLoading value)? loading,
    TResult Function(ParticipantAuthenticated value)? authenticated,
    TResult Function(ParticipantDetailLoaded value)? detailLoaded,
    TResult Function(ParticipantEmergencyUpdated value)? emergencyUpdated,
    TResult Function(ParticipantContactUpdated value)? contactUpdated,
    TResult Function(ParticipantCircuitoUpdated value)? circuitoUpdated,
    TResult Function(ParticipantUpdated value)? participantUpdated,
    TResult Function(ParticipantError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class ParticipantInitial implements ParticipantState {
  const factory ParticipantInitial() = _$ParticipantInitialImpl;
}

/// @nodoc
abstract class _$$ParticipantLoadingImplCopyWith<$Res> {
  factory _$$ParticipantLoadingImplCopyWith(_$ParticipantLoadingImpl value,
          $Res Function(_$ParticipantLoadingImpl) then) =
      __$$ParticipantLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ParticipantLoadingImplCopyWithImpl<$Res>
    extends _$ParticipantStateCopyWithImpl<$Res, _$ParticipantLoadingImpl>
    implements _$$ParticipantLoadingImplCopyWith<$Res> {
  __$$ParticipantLoadingImplCopyWithImpl(_$ParticipantLoadingImpl _value,
      $Res Function(_$ParticipantLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ParticipantState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ParticipantLoadingImpl implements ParticipantLoading {
  const _$ParticipantLoadingImpl();

  @override
  String toString() {
    return 'ParticipantState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ParticipantLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ParticipantAuth auth) authenticated,
    required TResult Function(ParticipantDetail detail) detailLoaded,
    required TResult Function(UpdateEmergencyEntity result) emergencyUpdated,
    required TResult Function(UpdateContactEntity result) contactUpdated,
    required TResult Function(UpdateCircuitoEntity result) circuitoUpdated,
    required TResult Function(UpdateParticipantEntity result)
        participantUpdated,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ParticipantAuth auth)? authenticated,
    TResult? Function(ParticipantDetail detail)? detailLoaded,
    TResult? Function(UpdateEmergencyEntity result)? emergencyUpdated,
    TResult? Function(UpdateContactEntity result)? contactUpdated,
    TResult? Function(UpdateCircuitoEntity result)? circuitoUpdated,
    TResult? Function(UpdateParticipantEntity result)? participantUpdated,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ParticipantAuth auth)? authenticated,
    TResult Function(ParticipantDetail detail)? detailLoaded,
    TResult Function(UpdateEmergencyEntity result)? emergencyUpdated,
    TResult Function(UpdateContactEntity result)? contactUpdated,
    TResult Function(UpdateCircuitoEntity result)? circuitoUpdated,
    TResult Function(UpdateParticipantEntity result)? participantUpdated,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ParticipantInitial value) initial,
    required TResult Function(ParticipantLoading value) loading,
    required TResult Function(ParticipantAuthenticated value) authenticated,
    required TResult Function(ParticipantDetailLoaded value) detailLoaded,
    required TResult Function(ParticipantEmergencyUpdated value)
        emergencyUpdated,
    required TResult Function(ParticipantContactUpdated value) contactUpdated,
    required TResult Function(ParticipantCircuitoUpdated value) circuitoUpdated,
    required TResult Function(ParticipantUpdated value) participantUpdated,
    required TResult Function(ParticipantError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ParticipantInitial value)? initial,
    TResult? Function(ParticipantLoading value)? loading,
    TResult? Function(ParticipantAuthenticated value)? authenticated,
    TResult? Function(ParticipantDetailLoaded value)? detailLoaded,
    TResult? Function(ParticipantEmergencyUpdated value)? emergencyUpdated,
    TResult? Function(ParticipantContactUpdated value)? contactUpdated,
    TResult? Function(ParticipantCircuitoUpdated value)? circuitoUpdated,
    TResult? Function(ParticipantUpdated value)? participantUpdated,
    TResult? Function(ParticipantError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ParticipantInitial value)? initial,
    TResult Function(ParticipantLoading value)? loading,
    TResult Function(ParticipantAuthenticated value)? authenticated,
    TResult Function(ParticipantDetailLoaded value)? detailLoaded,
    TResult Function(ParticipantEmergencyUpdated value)? emergencyUpdated,
    TResult Function(ParticipantContactUpdated value)? contactUpdated,
    TResult Function(ParticipantCircuitoUpdated value)? circuitoUpdated,
    TResult Function(ParticipantUpdated value)? participantUpdated,
    TResult Function(ParticipantError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ParticipantLoading implements ParticipantState {
  const factory ParticipantLoading() = _$ParticipantLoadingImpl;
}

/// @nodoc
abstract class _$$ParticipantAuthenticatedImplCopyWith<$Res> {
  factory _$$ParticipantAuthenticatedImplCopyWith(
          _$ParticipantAuthenticatedImpl value,
          $Res Function(_$ParticipantAuthenticatedImpl) then) =
      __$$ParticipantAuthenticatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ParticipantAuth auth});
}

/// @nodoc
class __$$ParticipantAuthenticatedImplCopyWithImpl<$Res>
    extends _$ParticipantStateCopyWithImpl<$Res, _$ParticipantAuthenticatedImpl>
    implements _$$ParticipantAuthenticatedImplCopyWith<$Res> {
  __$$ParticipantAuthenticatedImplCopyWithImpl(
      _$ParticipantAuthenticatedImpl _value,
      $Res Function(_$ParticipantAuthenticatedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ParticipantState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? auth = null,
  }) {
    return _then(_$ParticipantAuthenticatedImpl(
      null == auth
          ? _value.auth
          : auth // ignore: cast_nullable_to_non_nullable
              as ParticipantAuth,
    ));
  }
}

/// @nodoc

class _$ParticipantAuthenticatedImpl implements ParticipantAuthenticated {
  const _$ParticipantAuthenticatedImpl(this.auth);

  @override
  final ParticipantAuth auth;

  @override
  String toString() {
    return 'ParticipantState.authenticated(auth: $auth)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParticipantAuthenticatedImpl &&
            (identical(other.auth, auth) || other.auth == auth));
  }

  @override
  int get hashCode => Object.hash(runtimeType, auth);

  /// Create a copy of ParticipantState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ParticipantAuthenticatedImplCopyWith<_$ParticipantAuthenticatedImpl>
      get copyWith => __$$ParticipantAuthenticatedImplCopyWithImpl<
          _$ParticipantAuthenticatedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ParticipantAuth auth) authenticated,
    required TResult Function(ParticipantDetail detail) detailLoaded,
    required TResult Function(UpdateEmergencyEntity result) emergencyUpdated,
    required TResult Function(UpdateContactEntity result) contactUpdated,
    required TResult Function(UpdateCircuitoEntity result) circuitoUpdated,
    required TResult Function(UpdateParticipantEntity result)
        participantUpdated,
    required TResult Function(String message) error,
  }) {
    return authenticated(auth);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ParticipantAuth auth)? authenticated,
    TResult? Function(ParticipantDetail detail)? detailLoaded,
    TResult? Function(UpdateEmergencyEntity result)? emergencyUpdated,
    TResult? Function(UpdateContactEntity result)? contactUpdated,
    TResult? Function(UpdateCircuitoEntity result)? circuitoUpdated,
    TResult? Function(UpdateParticipantEntity result)? participantUpdated,
    TResult? Function(String message)? error,
  }) {
    return authenticated?.call(auth);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ParticipantAuth auth)? authenticated,
    TResult Function(ParticipantDetail detail)? detailLoaded,
    TResult Function(UpdateEmergencyEntity result)? emergencyUpdated,
    TResult Function(UpdateContactEntity result)? contactUpdated,
    TResult Function(UpdateCircuitoEntity result)? circuitoUpdated,
    TResult Function(UpdateParticipantEntity result)? participantUpdated,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(auth);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ParticipantInitial value) initial,
    required TResult Function(ParticipantLoading value) loading,
    required TResult Function(ParticipantAuthenticated value) authenticated,
    required TResult Function(ParticipantDetailLoaded value) detailLoaded,
    required TResult Function(ParticipantEmergencyUpdated value)
        emergencyUpdated,
    required TResult Function(ParticipantContactUpdated value) contactUpdated,
    required TResult Function(ParticipantCircuitoUpdated value) circuitoUpdated,
    required TResult Function(ParticipantUpdated value) participantUpdated,
    required TResult Function(ParticipantError value) error,
  }) {
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ParticipantInitial value)? initial,
    TResult? Function(ParticipantLoading value)? loading,
    TResult? Function(ParticipantAuthenticated value)? authenticated,
    TResult? Function(ParticipantDetailLoaded value)? detailLoaded,
    TResult? Function(ParticipantEmergencyUpdated value)? emergencyUpdated,
    TResult? Function(ParticipantContactUpdated value)? contactUpdated,
    TResult? Function(ParticipantCircuitoUpdated value)? circuitoUpdated,
    TResult? Function(ParticipantUpdated value)? participantUpdated,
    TResult? Function(ParticipantError value)? error,
  }) {
    return authenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ParticipantInitial value)? initial,
    TResult Function(ParticipantLoading value)? loading,
    TResult Function(ParticipantAuthenticated value)? authenticated,
    TResult Function(ParticipantDetailLoaded value)? detailLoaded,
    TResult Function(ParticipantEmergencyUpdated value)? emergencyUpdated,
    TResult Function(ParticipantContactUpdated value)? contactUpdated,
    TResult Function(ParticipantCircuitoUpdated value)? circuitoUpdated,
    TResult Function(ParticipantUpdated value)? participantUpdated,
    TResult Function(ParticipantError value)? error,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class ParticipantAuthenticated implements ParticipantState {
  const factory ParticipantAuthenticated(final ParticipantAuth auth) =
      _$ParticipantAuthenticatedImpl;

  ParticipantAuth get auth;

  /// Create a copy of ParticipantState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ParticipantAuthenticatedImplCopyWith<_$ParticipantAuthenticatedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ParticipantDetailLoadedImplCopyWith<$Res> {
  factory _$$ParticipantDetailLoadedImplCopyWith(
          _$ParticipantDetailLoadedImpl value,
          $Res Function(_$ParticipantDetailLoadedImpl) then) =
      __$$ParticipantDetailLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ParticipantDetail detail});
}

/// @nodoc
class __$$ParticipantDetailLoadedImplCopyWithImpl<$Res>
    extends _$ParticipantStateCopyWithImpl<$Res, _$ParticipantDetailLoadedImpl>
    implements _$$ParticipantDetailLoadedImplCopyWith<$Res> {
  __$$ParticipantDetailLoadedImplCopyWithImpl(
      _$ParticipantDetailLoadedImpl _value,
      $Res Function(_$ParticipantDetailLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ParticipantState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? detail = null,
  }) {
    return _then(_$ParticipantDetailLoadedImpl(
      null == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as ParticipantDetail,
    ));
  }
}

/// @nodoc

class _$ParticipantDetailLoadedImpl implements ParticipantDetailLoaded {
  const _$ParticipantDetailLoadedImpl(this.detail);

  @override
  final ParticipantDetail detail;

  @override
  String toString() {
    return 'ParticipantState.detailLoaded(detail: $detail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParticipantDetailLoadedImpl &&
            (identical(other.detail, detail) || other.detail == detail));
  }

  @override
  int get hashCode => Object.hash(runtimeType, detail);

  /// Create a copy of ParticipantState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ParticipantDetailLoadedImplCopyWith<_$ParticipantDetailLoadedImpl>
      get copyWith => __$$ParticipantDetailLoadedImplCopyWithImpl<
          _$ParticipantDetailLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ParticipantAuth auth) authenticated,
    required TResult Function(ParticipantDetail detail) detailLoaded,
    required TResult Function(UpdateEmergencyEntity result) emergencyUpdated,
    required TResult Function(UpdateContactEntity result) contactUpdated,
    required TResult Function(UpdateCircuitoEntity result) circuitoUpdated,
    required TResult Function(UpdateParticipantEntity result)
        participantUpdated,
    required TResult Function(String message) error,
  }) {
    return detailLoaded(detail);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ParticipantAuth auth)? authenticated,
    TResult? Function(ParticipantDetail detail)? detailLoaded,
    TResult? Function(UpdateEmergencyEntity result)? emergencyUpdated,
    TResult? Function(UpdateContactEntity result)? contactUpdated,
    TResult? Function(UpdateCircuitoEntity result)? circuitoUpdated,
    TResult? Function(UpdateParticipantEntity result)? participantUpdated,
    TResult? Function(String message)? error,
  }) {
    return detailLoaded?.call(detail);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ParticipantAuth auth)? authenticated,
    TResult Function(ParticipantDetail detail)? detailLoaded,
    TResult Function(UpdateEmergencyEntity result)? emergencyUpdated,
    TResult Function(UpdateContactEntity result)? contactUpdated,
    TResult Function(UpdateCircuitoEntity result)? circuitoUpdated,
    TResult Function(UpdateParticipantEntity result)? participantUpdated,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (detailLoaded != null) {
      return detailLoaded(detail);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ParticipantInitial value) initial,
    required TResult Function(ParticipantLoading value) loading,
    required TResult Function(ParticipantAuthenticated value) authenticated,
    required TResult Function(ParticipantDetailLoaded value) detailLoaded,
    required TResult Function(ParticipantEmergencyUpdated value)
        emergencyUpdated,
    required TResult Function(ParticipantContactUpdated value) contactUpdated,
    required TResult Function(ParticipantCircuitoUpdated value) circuitoUpdated,
    required TResult Function(ParticipantUpdated value) participantUpdated,
    required TResult Function(ParticipantError value) error,
  }) {
    return detailLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ParticipantInitial value)? initial,
    TResult? Function(ParticipantLoading value)? loading,
    TResult? Function(ParticipantAuthenticated value)? authenticated,
    TResult? Function(ParticipantDetailLoaded value)? detailLoaded,
    TResult? Function(ParticipantEmergencyUpdated value)? emergencyUpdated,
    TResult? Function(ParticipantContactUpdated value)? contactUpdated,
    TResult? Function(ParticipantCircuitoUpdated value)? circuitoUpdated,
    TResult? Function(ParticipantUpdated value)? participantUpdated,
    TResult? Function(ParticipantError value)? error,
  }) {
    return detailLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ParticipantInitial value)? initial,
    TResult Function(ParticipantLoading value)? loading,
    TResult Function(ParticipantAuthenticated value)? authenticated,
    TResult Function(ParticipantDetailLoaded value)? detailLoaded,
    TResult Function(ParticipantEmergencyUpdated value)? emergencyUpdated,
    TResult Function(ParticipantContactUpdated value)? contactUpdated,
    TResult Function(ParticipantCircuitoUpdated value)? circuitoUpdated,
    TResult Function(ParticipantUpdated value)? participantUpdated,
    TResult Function(ParticipantError value)? error,
    required TResult orElse(),
  }) {
    if (detailLoaded != null) {
      return detailLoaded(this);
    }
    return orElse();
  }
}

abstract class ParticipantDetailLoaded implements ParticipantState {
  const factory ParticipantDetailLoaded(final ParticipantDetail detail) =
      _$ParticipantDetailLoadedImpl;

  ParticipantDetail get detail;

  /// Create a copy of ParticipantState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ParticipantDetailLoadedImplCopyWith<_$ParticipantDetailLoadedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ParticipantEmergencyUpdatedImplCopyWith<$Res> {
  factory _$$ParticipantEmergencyUpdatedImplCopyWith(
          _$ParticipantEmergencyUpdatedImpl value,
          $Res Function(_$ParticipantEmergencyUpdatedImpl) then) =
      __$$ParticipantEmergencyUpdatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UpdateEmergencyEntity result});
}

/// @nodoc
class __$$ParticipantEmergencyUpdatedImplCopyWithImpl<$Res>
    extends _$ParticipantStateCopyWithImpl<$Res,
        _$ParticipantEmergencyUpdatedImpl>
    implements _$$ParticipantEmergencyUpdatedImplCopyWith<$Res> {
  __$$ParticipantEmergencyUpdatedImplCopyWithImpl(
      _$ParticipantEmergencyUpdatedImpl _value,
      $Res Function(_$ParticipantEmergencyUpdatedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ParticipantState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
  }) {
    return _then(_$ParticipantEmergencyUpdatedImpl(
      null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as UpdateEmergencyEntity,
    ));
  }
}

/// @nodoc

class _$ParticipantEmergencyUpdatedImpl implements ParticipantEmergencyUpdated {
  const _$ParticipantEmergencyUpdatedImpl(this.result);

  @override
  final UpdateEmergencyEntity result;

  @override
  String toString() {
    return 'ParticipantState.emergencyUpdated(result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParticipantEmergencyUpdatedImpl &&
            (identical(other.result, result) || other.result == result));
  }

  @override
  int get hashCode => Object.hash(runtimeType, result);

  /// Create a copy of ParticipantState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ParticipantEmergencyUpdatedImplCopyWith<_$ParticipantEmergencyUpdatedImpl>
      get copyWith => __$$ParticipantEmergencyUpdatedImplCopyWithImpl<
          _$ParticipantEmergencyUpdatedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ParticipantAuth auth) authenticated,
    required TResult Function(ParticipantDetail detail) detailLoaded,
    required TResult Function(UpdateEmergencyEntity result) emergencyUpdated,
    required TResult Function(UpdateContactEntity result) contactUpdated,
    required TResult Function(UpdateCircuitoEntity result) circuitoUpdated,
    required TResult Function(UpdateParticipantEntity result)
        participantUpdated,
    required TResult Function(String message) error,
  }) {
    return emergencyUpdated(result);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ParticipantAuth auth)? authenticated,
    TResult? Function(ParticipantDetail detail)? detailLoaded,
    TResult? Function(UpdateEmergencyEntity result)? emergencyUpdated,
    TResult? Function(UpdateContactEntity result)? contactUpdated,
    TResult? Function(UpdateCircuitoEntity result)? circuitoUpdated,
    TResult? Function(UpdateParticipantEntity result)? participantUpdated,
    TResult? Function(String message)? error,
  }) {
    return emergencyUpdated?.call(result);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ParticipantAuth auth)? authenticated,
    TResult Function(ParticipantDetail detail)? detailLoaded,
    TResult Function(UpdateEmergencyEntity result)? emergencyUpdated,
    TResult Function(UpdateContactEntity result)? contactUpdated,
    TResult Function(UpdateCircuitoEntity result)? circuitoUpdated,
    TResult Function(UpdateParticipantEntity result)? participantUpdated,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (emergencyUpdated != null) {
      return emergencyUpdated(result);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ParticipantInitial value) initial,
    required TResult Function(ParticipantLoading value) loading,
    required TResult Function(ParticipantAuthenticated value) authenticated,
    required TResult Function(ParticipantDetailLoaded value) detailLoaded,
    required TResult Function(ParticipantEmergencyUpdated value)
        emergencyUpdated,
    required TResult Function(ParticipantContactUpdated value) contactUpdated,
    required TResult Function(ParticipantCircuitoUpdated value) circuitoUpdated,
    required TResult Function(ParticipantUpdated value) participantUpdated,
    required TResult Function(ParticipantError value) error,
  }) {
    return emergencyUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ParticipantInitial value)? initial,
    TResult? Function(ParticipantLoading value)? loading,
    TResult? Function(ParticipantAuthenticated value)? authenticated,
    TResult? Function(ParticipantDetailLoaded value)? detailLoaded,
    TResult? Function(ParticipantEmergencyUpdated value)? emergencyUpdated,
    TResult? Function(ParticipantContactUpdated value)? contactUpdated,
    TResult? Function(ParticipantCircuitoUpdated value)? circuitoUpdated,
    TResult? Function(ParticipantUpdated value)? participantUpdated,
    TResult? Function(ParticipantError value)? error,
  }) {
    return emergencyUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ParticipantInitial value)? initial,
    TResult Function(ParticipantLoading value)? loading,
    TResult Function(ParticipantAuthenticated value)? authenticated,
    TResult Function(ParticipantDetailLoaded value)? detailLoaded,
    TResult Function(ParticipantEmergencyUpdated value)? emergencyUpdated,
    TResult Function(ParticipantContactUpdated value)? contactUpdated,
    TResult Function(ParticipantCircuitoUpdated value)? circuitoUpdated,
    TResult Function(ParticipantUpdated value)? participantUpdated,
    TResult Function(ParticipantError value)? error,
    required TResult orElse(),
  }) {
    if (emergencyUpdated != null) {
      return emergencyUpdated(this);
    }
    return orElse();
  }
}

abstract class ParticipantEmergencyUpdated implements ParticipantState {
  const factory ParticipantEmergencyUpdated(
      final UpdateEmergencyEntity result) = _$ParticipantEmergencyUpdatedImpl;

  UpdateEmergencyEntity get result;

  /// Create a copy of ParticipantState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ParticipantEmergencyUpdatedImplCopyWith<_$ParticipantEmergencyUpdatedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ParticipantContactUpdatedImplCopyWith<$Res> {
  factory _$$ParticipantContactUpdatedImplCopyWith(
          _$ParticipantContactUpdatedImpl value,
          $Res Function(_$ParticipantContactUpdatedImpl) then) =
      __$$ParticipantContactUpdatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UpdateContactEntity result});
}

/// @nodoc
class __$$ParticipantContactUpdatedImplCopyWithImpl<$Res>
    extends _$ParticipantStateCopyWithImpl<$Res,
        _$ParticipantContactUpdatedImpl>
    implements _$$ParticipantContactUpdatedImplCopyWith<$Res> {
  __$$ParticipantContactUpdatedImplCopyWithImpl(
      _$ParticipantContactUpdatedImpl _value,
      $Res Function(_$ParticipantContactUpdatedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ParticipantState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
  }) {
    return _then(_$ParticipantContactUpdatedImpl(
      null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as UpdateContactEntity,
    ));
  }
}

/// @nodoc

class _$ParticipantContactUpdatedImpl implements ParticipantContactUpdated {
  const _$ParticipantContactUpdatedImpl(this.result);

  @override
  final UpdateContactEntity result;

  @override
  String toString() {
    return 'ParticipantState.contactUpdated(result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParticipantContactUpdatedImpl &&
            (identical(other.result, result) || other.result == result));
  }

  @override
  int get hashCode => Object.hash(runtimeType, result);

  /// Create a copy of ParticipantState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ParticipantContactUpdatedImplCopyWith<_$ParticipantContactUpdatedImpl>
      get copyWith => __$$ParticipantContactUpdatedImplCopyWithImpl<
          _$ParticipantContactUpdatedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ParticipantAuth auth) authenticated,
    required TResult Function(ParticipantDetail detail) detailLoaded,
    required TResult Function(UpdateEmergencyEntity result) emergencyUpdated,
    required TResult Function(UpdateContactEntity result) contactUpdated,
    required TResult Function(UpdateCircuitoEntity result) circuitoUpdated,
    required TResult Function(UpdateParticipantEntity result)
        participantUpdated,
    required TResult Function(String message) error,
  }) {
    return contactUpdated(result);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ParticipantAuth auth)? authenticated,
    TResult? Function(ParticipantDetail detail)? detailLoaded,
    TResult? Function(UpdateEmergencyEntity result)? emergencyUpdated,
    TResult? Function(UpdateContactEntity result)? contactUpdated,
    TResult? Function(UpdateCircuitoEntity result)? circuitoUpdated,
    TResult? Function(UpdateParticipantEntity result)? participantUpdated,
    TResult? Function(String message)? error,
  }) {
    return contactUpdated?.call(result);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ParticipantAuth auth)? authenticated,
    TResult Function(ParticipantDetail detail)? detailLoaded,
    TResult Function(UpdateEmergencyEntity result)? emergencyUpdated,
    TResult Function(UpdateContactEntity result)? contactUpdated,
    TResult Function(UpdateCircuitoEntity result)? circuitoUpdated,
    TResult Function(UpdateParticipantEntity result)? participantUpdated,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (contactUpdated != null) {
      return contactUpdated(result);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ParticipantInitial value) initial,
    required TResult Function(ParticipantLoading value) loading,
    required TResult Function(ParticipantAuthenticated value) authenticated,
    required TResult Function(ParticipantDetailLoaded value) detailLoaded,
    required TResult Function(ParticipantEmergencyUpdated value)
        emergencyUpdated,
    required TResult Function(ParticipantContactUpdated value) contactUpdated,
    required TResult Function(ParticipantCircuitoUpdated value) circuitoUpdated,
    required TResult Function(ParticipantUpdated value) participantUpdated,
    required TResult Function(ParticipantError value) error,
  }) {
    return contactUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ParticipantInitial value)? initial,
    TResult? Function(ParticipantLoading value)? loading,
    TResult? Function(ParticipantAuthenticated value)? authenticated,
    TResult? Function(ParticipantDetailLoaded value)? detailLoaded,
    TResult? Function(ParticipantEmergencyUpdated value)? emergencyUpdated,
    TResult? Function(ParticipantContactUpdated value)? contactUpdated,
    TResult? Function(ParticipantCircuitoUpdated value)? circuitoUpdated,
    TResult? Function(ParticipantUpdated value)? participantUpdated,
    TResult? Function(ParticipantError value)? error,
  }) {
    return contactUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ParticipantInitial value)? initial,
    TResult Function(ParticipantLoading value)? loading,
    TResult Function(ParticipantAuthenticated value)? authenticated,
    TResult Function(ParticipantDetailLoaded value)? detailLoaded,
    TResult Function(ParticipantEmergencyUpdated value)? emergencyUpdated,
    TResult Function(ParticipantContactUpdated value)? contactUpdated,
    TResult Function(ParticipantCircuitoUpdated value)? circuitoUpdated,
    TResult Function(ParticipantUpdated value)? participantUpdated,
    TResult Function(ParticipantError value)? error,
    required TResult orElse(),
  }) {
    if (contactUpdated != null) {
      return contactUpdated(this);
    }
    return orElse();
  }
}

abstract class ParticipantContactUpdated implements ParticipantState {
  const factory ParticipantContactUpdated(final UpdateContactEntity result) =
      _$ParticipantContactUpdatedImpl;

  UpdateContactEntity get result;

  /// Create a copy of ParticipantState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ParticipantContactUpdatedImplCopyWith<_$ParticipantContactUpdatedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ParticipantCircuitoUpdatedImplCopyWith<$Res> {
  factory _$$ParticipantCircuitoUpdatedImplCopyWith(
          _$ParticipantCircuitoUpdatedImpl value,
          $Res Function(_$ParticipantCircuitoUpdatedImpl) then) =
      __$$ParticipantCircuitoUpdatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UpdateCircuitoEntity result});
}

/// @nodoc
class __$$ParticipantCircuitoUpdatedImplCopyWithImpl<$Res>
    extends _$ParticipantStateCopyWithImpl<$Res,
        _$ParticipantCircuitoUpdatedImpl>
    implements _$$ParticipantCircuitoUpdatedImplCopyWith<$Res> {
  __$$ParticipantCircuitoUpdatedImplCopyWithImpl(
      _$ParticipantCircuitoUpdatedImpl _value,
      $Res Function(_$ParticipantCircuitoUpdatedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ParticipantState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
  }) {
    return _then(_$ParticipantCircuitoUpdatedImpl(
      null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as UpdateCircuitoEntity,
    ));
  }
}

/// @nodoc

class _$ParticipantCircuitoUpdatedImpl implements ParticipantCircuitoUpdated {
  const _$ParticipantCircuitoUpdatedImpl(this.result);

  @override
  final UpdateCircuitoEntity result;

  @override
  String toString() {
    return 'ParticipantState.circuitoUpdated(result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParticipantCircuitoUpdatedImpl &&
            (identical(other.result, result) || other.result == result));
  }

  @override
  int get hashCode => Object.hash(runtimeType, result);

  /// Create a copy of ParticipantState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ParticipantCircuitoUpdatedImplCopyWith<_$ParticipantCircuitoUpdatedImpl>
      get copyWith => __$$ParticipantCircuitoUpdatedImplCopyWithImpl<
          _$ParticipantCircuitoUpdatedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ParticipantAuth auth) authenticated,
    required TResult Function(ParticipantDetail detail) detailLoaded,
    required TResult Function(UpdateEmergencyEntity result) emergencyUpdated,
    required TResult Function(UpdateContactEntity result) contactUpdated,
    required TResult Function(UpdateCircuitoEntity result) circuitoUpdated,
    required TResult Function(UpdateParticipantEntity result)
        participantUpdated,
    required TResult Function(String message) error,
  }) {
    return circuitoUpdated(result);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ParticipantAuth auth)? authenticated,
    TResult? Function(ParticipantDetail detail)? detailLoaded,
    TResult? Function(UpdateEmergencyEntity result)? emergencyUpdated,
    TResult? Function(UpdateContactEntity result)? contactUpdated,
    TResult? Function(UpdateCircuitoEntity result)? circuitoUpdated,
    TResult? Function(UpdateParticipantEntity result)? participantUpdated,
    TResult? Function(String message)? error,
  }) {
    return circuitoUpdated?.call(result);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ParticipantAuth auth)? authenticated,
    TResult Function(ParticipantDetail detail)? detailLoaded,
    TResult Function(UpdateEmergencyEntity result)? emergencyUpdated,
    TResult Function(UpdateContactEntity result)? contactUpdated,
    TResult Function(UpdateCircuitoEntity result)? circuitoUpdated,
    TResult Function(UpdateParticipantEntity result)? participantUpdated,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (circuitoUpdated != null) {
      return circuitoUpdated(result);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ParticipantInitial value) initial,
    required TResult Function(ParticipantLoading value) loading,
    required TResult Function(ParticipantAuthenticated value) authenticated,
    required TResult Function(ParticipantDetailLoaded value) detailLoaded,
    required TResult Function(ParticipantEmergencyUpdated value)
        emergencyUpdated,
    required TResult Function(ParticipantContactUpdated value) contactUpdated,
    required TResult Function(ParticipantCircuitoUpdated value) circuitoUpdated,
    required TResult Function(ParticipantUpdated value) participantUpdated,
    required TResult Function(ParticipantError value) error,
  }) {
    return circuitoUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ParticipantInitial value)? initial,
    TResult? Function(ParticipantLoading value)? loading,
    TResult? Function(ParticipantAuthenticated value)? authenticated,
    TResult? Function(ParticipantDetailLoaded value)? detailLoaded,
    TResult? Function(ParticipantEmergencyUpdated value)? emergencyUpdated,
    TResult? Function(ParticipantContactUpdated value)? contactUpdated,
    TResult? Function(ParticipantCircuitoUpdated value)? circuitoUpdated,
    TResult? Function(ParticipantUpdated value)? participantUpdated,
    TResult? Function(ParticipantError value)? error,
  }) {
    return circuitoUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ParticipantInitial value)? initial,
    TResult Function(ParticipantLoading value)? loading,
    TResult Function(ParticipantAuthenticated value)? authenticated,
    TResult Function(ParticipantDetailLoaded value)? detailLoaded,
    TResult Function(ParticipantEmergencyUpdated value)? emergencyUpdated,
    TResult Function(ParticipantContactUpdated value)? contactUpdated,
    TResult Function(ParticipantCircuitoUpdated value)? circuitoUpdated,
    TResult Function(ParticipantUpdated value)? participantUpdated,
    TResult Function(ParticipantError value)? error,
    required TResult orElse(),
  }) {
    if (circuitoUpdated != null) {
      return circuitoUpdated(this);
    }
    return orElse();
  }
}

abstract class ParticipantCircuitoUpdated implements ParticipantState {
  const factory ParticipantCircuitoUpdated(final UpdateCircuitoEntity result) =
      _$ParticipantCircuitoUpdatedImpl;

  UpdateCircuitoEntity get result;

  /// Create a copy of ParticipantState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ParticipantCircuitoUpdatedImplCopyWith<_$ParticipantCircuitoUpdatedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ParticipantUpdatedImplCopyWith<$Res> {
  factory _$$ParticipantUpdatedImplCopyWith(_$ParticipantUpdatedImpl value,
          $Res Function(_$ParticipantUpdatedImpl) then) =
      __$$ParticipantUpdatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UpdateParticipantEntity result});
}

/// @nodoc
class __$$ParticipantUpdatedImplCopyWithImpl<$Res>
    extends _$ParticipantStateCopyWithImpl<$Res, _$ParticipantUpdatedImpl>
    implements _$$ParticipantUpdatedImplCopyWith<$Res> {
  __$$ParticipantUpdatedImplCopyWithImpl(_$ParticipantUpdatedImpl _value,
      $Res Function(_$ParticipantUpdatedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ParticipantState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
  }) {
    return _then(_$ParticipantUpdatedImpl(
      null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as UpdateParticipantEntity,
    ));
  }
}

/// @nodoc

class _$ParticipantUpdatedImpl implements ParticipantUpdated {
  const _$ParticipantUpdatedImpl(this.result);

  @override
  final UpdateParticipantEntity result;

  @override
  String toString() {
    return 'ParticipantState.participantUpdated(result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParticipantUpdatedImpl &&
            (identical(other.result, result) || other.result == result));
  }

  @override
  int get hashCode => Object.hash(runtimeType, result);

  /// Create a copy of ParticipantState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ParticipantUpdatedImplCopyWith<_$ParticipantUpdatedImpl> get copyWith =>
      __$$ParticipantUpdatedImplCopyWithImpl<_$ParticipantUpdatedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ParticipantAuth auth) authenticated,
    required TResult Function(ParticipantDetail detail) detailLoaded,
    required TResult Function(UpdateEmergencyEntity result) emergencyUpdated,
    required TResult Function(UpdateContactEntity result) contactUpdated,
    required TResult Function(UpdateCircuitoEntity result) circuitoUpdated,
    required TResult Function(UpdateParticipantEntity result)
        participantUpdated,
    required TResult Function(String message) error,
  }) {
    return participantUpdated(result);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ParticipantAuth auth)? authenticated,
    TResult? Function(ParticipantDetail detail)? detailLoaded,
    TResult? Function(UpdateEmergencyEntity result)? emergencyUpdated,
    TResult? Function(UpdateContactEntity result)? contactUpdated,
    TResult? Function(UpdateCircuitoEntity result)? circuitoUpdated,
    TResult? Function(UpdateParticipantEntity result)? participantUpdated,
    TResult? Function(String message)? error,
  }) {
    return participantUpdated?.call(result);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ParticipantAuth auth)? authenticated,
    TResult Function(ParticipantDetail detail)? detailLoaded,
    TResult Function(UpdateEmergencyEntity result)? emergencyUpdated,
    TResult Function(UpdateContactEntity result)? contactUpdated,
    TResult Function(UpdateCircuitoEntity result)? circuitoUpdated,
    TResult Function(UpdateParticipantEntity result)? participantUpdated,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (participantUpdated != null) {
      return participantUpdated(result);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ParticipantInitial value) initial,
    required TResult Function(ParticipantLoading value) loading,
    required TResult Function(ParticipantAuthenticated value) authenticated,
    required TResult Function(ParticipantDetailLoaded value) detailLoaded,
    required TResult Function(ParticipantEmergencyUpdated value)
        emergencyUpdated,
    required TResult Function(ParticipantContactUpdated value) contactUpdated,
    required TResult Function(ParticipantCircuitoUpdated value) circuitoUpdated,
    required TResult Function(ParticipantUpdated value) participantUpdated,
    required TResult Function(ParticipantError value) error,
  }) {
    return participantUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ParticipantInitial value)? initial,
    TResult? Function(ParticipantLoading value)? loading,
    TResult? Function(ParticipantAuthenticated value)? authenticated,
    TResult? Function(ParticipantDetailLoaded value)? detailLoaded,
    TResult? Function(ParticipantEmergencyUpdated value)? emergencyUpdated,
    TResult? Function(ParticipantContactUpdated value)? contactUpdated,
    TResult? Function(ParticipantCircuitoUpdated value)? circuitoUpdated,
    TResult? Function(ParticipantUpdated value)? participantUpdated,
    TResult? Function(ParticipantError value)? error,
  }) {
    return participantUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ParticipantInitial value)? initial,
    TResult Function(ParticipantLoading value)? loading,
    TResult Function(ParticipantAuthenticated value)? authenticated,
    TResult Function(ParticipantDetailLoaded value)? detailLoaded,
    TResult Function(ParticipantEmergencyUpdated value)? emergencyUpdated,
    TResult Function(ParticipantContactUpdated value)? contactUpdated,
    TResult Function(ParticipantCircuitoUpdated value)? circuitoUpdated,
    TResult Function(ParticipantUpdated value)? participantUpdated,
    TResult Function(ParticipantError value)? error,
    required TResult orElse(),
  }) {
    if (participantUpdated != null) {
      return participantUpdated(this);
    }
    return orElse();
  }
}

abstract class ParticipantUpdated implements ParticipantState {
  const factory ParticipantUpdated(final UpdateParticipantEntity result) =
      _$ParticipantUpdatedImpl;

  UpdateParticipantEntity get result;

  /// Create a copy of ParticipantState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ParticipantUpdatedImplCopyWith<_$ParticipantUpdatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ParticipantErrorImplCopyWith<$Res> {
  factory _$$ParticipantErrorImplCopyWith(_$ParticipantErrorImpl value,
          $Res Function(_$ParticipantErrorImpl) then) =
      __$$ParticipantErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ParticipantErrorImplCopyWithImpl<$Res>
    extends _$ParticipantStateCopyWithImpl<$Res, _$ParticipantErrorImpl>
    implements _$$ParticipantErrorImplCopyWith<$Res> {
  __$$ParticipantErrorImplCopyWithImpl(_$ParticipantErrorImpl _value,
      $Res Function(_$ParticipantErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of ParticipantState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ParticipantErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ParticipantErrorImpl implements ParticipantError {
  const _$ParticipantErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'ParticipantState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParticipantErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of ParticipantState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ParticipantErrorImplCopyWith<_$ParticipantErrorImpl> get copyWith =>
      __$$ParticipantErrorImplCopyWithImpl<_$ParticipantErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ParticipantAuth auth) authenticated,
    required TResult Function(ParticipantDetail detail) detailLoaded,
    required TResult Function(UpdateEmergencyEntity result) emergencyUpdated,
    required TResult Function(UpdateContactEntity result) contactUpdated,
    required TResult Function(UpdateCircuitoEntity result) circuitoUpdated,
    required TResult Function(UpdateParticipantEntity result)
        participantUpdated,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ParticipantAuth auth)? authenticated,
    TResult? Function(ParticipantDetail detail)? detailLoaded,
    TResult? Function(UpdateEmergencyEntity result)? emergencyUpdated,
    TResult? Function(UpdateContactEntity result)? contactUpdated,
    TResult? Function(UpdateCircuitoEntity result)? circuitoUpdated,
    TResult? Function(UpdateParticipantEntity result)? participantUpdated,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ParticipantAuth auth)? authenticated,
    TResult Function(ParticipantDetail detail)? detailLoaded,
    TResult Function(UpdateEmergencyEntity result)? emergencyUpdated,
    TResult Function(UpdateContactEntity result)? contactUpdated,
    TResult Function(UpdateCircuitoEntity result)? circuitoUpdated,
    TResult Function(UpdateParticipantEntity result)? participantUpdated,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ParticipantInitial value) initial,
    required TResult Function(ParticipantLoading value) loading,
    required TResult Function(ParticipantAuthenticated value) authenticated,
    required TResult Function(ParticipantDetailLoaded value) detailLoaded,
    required TResult Function(ParticipantEmergencyUpdated value)
        emergencyUpdated,
    required TResult Function(ParticipantContactUpdated value) contactUpdated,
    required TResult Function(ParticipantCircuitoUpdated value) circuitoUpdated,
    required TResult Function(ParticipantUpdated value) participantUpdated,
    required TResult Function(ParticipantError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ParticipantInitial value)? initial,
    TResult? Function(ParticipantLoading value)? loading,
    TResult? Function(ParticipantAuthenticated value)? authenticated,
    TResult? Function(ParticipantDetailLoaded value)? detailLoaded,
    TResult? Function(ParticipantEmergencyUpdated value)? emergencyUpdated,
    TResult? Function(ParticipantContactUpdated value)? contactUpdated,
    TResult? Function(ParticipantCircuitoUpdated value)? circuitoUpdated,
    TResult? Function(ParticipantUpdated value)? participantUpdated,
    TResult? Function(ParticipantError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ParticipantInitial value)? initial,
    TResult Function(ParticipantLoading value)? loading,
    TResult Function(ParticipantAuthenticated value)? authenticated,
    TResult Function(ParticipantDetailLoaded value)? detailLoaded,
    TResult Function(ParticipantEmergencyUpdated value)? emergencyUpdated,
    TResult Function(ParticipantContactUpdated value)? contactUpdated,
    TResult Function(ParticipantCircuitoUpdated value)? circuitoUpdated,
    TResult Function(ParticipantUpdated value)? participantUpdated,
    TResult Function(ParticipantError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ParticipantError implements ParticipantState {
  const factory ParticipantError(final String message) = _$ParticipantErrorImpl;

  String get message;

  /// Create a copy of ParticipantState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ParticipantErrorImplCopyWith<_$ParticipantErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
