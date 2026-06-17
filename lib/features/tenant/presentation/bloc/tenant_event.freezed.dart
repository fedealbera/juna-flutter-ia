// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tenant_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TenantEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadActiveTenant,
    required TResult Function(TenantEntity tenant) switchTenant,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadActiveTenant,
    TResult? Function(TenantEntity tenant)? switchTenant,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadActiveTenant,
    TResult Function(TenantEntity tenant)? switchTenant,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadActiveTenant value) loadActiveTenant,
    required TResult Function(SwitchTenant value) switchTenant,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadActiveTenant value)? loadActiveTenant,
    TResult? Function(SwitchTenant value)? switchTenant,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadActiveTenant value)? loadActiveTenant,
    TResult Function(SwitchTenant value)? switchTenant,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TenantEventCopyWith<$Res> {
  factory $TenantEventCopyWith(
          TenantEvent value, $Res Function(TenantEvent) then) =
      _$TenantEventCopyWithImpl<$Res, TenantEvent>;
}

/// @nodoc
class _$TenantEventCopyWithImpl<$Res, $Val extends TenantEvent>
    implements $TenantEventCopyWith<$Res> {
  _$TenantEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TenantEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadActiveTenantImplCopyWith<$Res> {
  factory _$$LoadActiveTenantImplCopyWith(_$LoadActiveTenantImpl value,
          $Res Function(_$LoadActiveTenantImpl) then) =
      __$$LoadActiveTenantImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadActiveTenantImplCopyWithImpl<$Res>
    extends _$TenantEventCopyWithImpl<$Res, _$LoadActiveTenantImpl>
    implements _$$LoadActiveTenantImplCopyWith<$Res> {
  __$$LoadActiveTenantImplCopyWithImpl(_$LoadActiveTenantImpl _value,
      $Res Function(_$LoadActiveTenantImpl) _then)
      : super(_value, _then);

  /// Create a copy of TenantEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadActiveTenantImpl implements LoadActiveTenant {
  const _$LoadActiveTenantImpl();

  @override
  String toString() {
    return 'TenantEvent.loadActiveTenant()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadActiveTenantImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadActiveTenant,
    required TResult Function(TenantEntity tenant) switchTenant,
  }) {
    return loadActiveTenant();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadActiveTenant,
    TResult? Function(TenantEntity tenant)? switchTenant,
  }) {
    return loadActiveTenant?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadActiveTenant,
    TResult Function(TenantEntity tenant)? switchTenant,
    required TResult orElse(),
  }) {
    if (loadActiveTenant != null) {
      return loadActiveTenant();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadActiveTenant value) loadActiveTenant,
    required TResult Function(SwitchTenant value) switchTenant,
  }) {
    return loadActiveTenant(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadActiveTenant value)? loadActiveTenant,
    TResult? Function(SwitchTenant value)? switchTenant,
  }) {
    return loadActiveTenant?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadActiveTenant value)? loadActiveTenant,
    TResult Function(SwitchTenant value)? switchTenant,
    required TResult orElse(),
  }) {
    if (loadActiveTenant != null) {
      return loadActiveTenant(this);
    }
    return orElse();
  }
}

abstract class LoadActiveTenant implements TenantEvent {
  const factory LoadActiveTenant() = _$LoadActiveTenantImpl;
}

/// @nodoc
abstract class _$$SwitchTenantImplCopyWith<$Res> {
  factory _$$SwitchTenantImplCopyWith(
          _$SwitchTenantImpl value, $Res Function(_$SwitchTenantImpl) then) =
      __$$SwitchTenantImplCopyWithImpl<$Res>;
  @useResult
  $Res call({TenantEntity tenant});
}

/// @nodoc
class __$$SwitchTenantImplCopyWithImpl<$Res>
    extends _$TenantEventCopyWithImpl<$Res, _$SwitchTenantImpl>
    implements _$$SwitchTenantImplCopyWith<$Res> {
  __$$SwitchTenantImplCopyWithImpl(
      _$SwitchTenantImpl _value, $Res Function(_$SwitchTenantImpl) _then)
      : super(_value, _then);

  /// Create a copy of TenantEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tenant = null,
  }) {
    return _then(_$SwitchTenantImpl(
      null == tenant
          ? _value.tenant
          : tenant // ignore: cast_nullable_to_non_nullable
              as TenantEntity,
    ));
  }
}

/// @nodoc

class _$SwitchTenantImpl implements SwitchTenant {
  const _$SwitchTenantImpl(this.tenant);

  @override
  final TenantEntity tenant;

  @override
  String toString() {
    return 'TenantEvent.switchTenant(tenant: $tenant)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SwitchTenantImpl &&
            (identical(other.tenant, tenant) || other.tenant == tenant));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tenant);

  /// Create a copy of TenantEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SwitchTenantImplCopyWith<_$SwitchTenantImpl> get copyWith =>
      __$$SwitchTenantImplCopyWithImpl<_$SwitchTenantImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadActiveTenant,
    required TResult Function(TenantEntity tenant) switchTenant,
  }) {
    return switchTenant(tenant);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadActiveTenant,
    TResult? Function(TenantEntity tenant)? switchTenant,
  }) {
    return switchTenant?.call(tenant);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadActiveTenant,
    TResult Function(TenantEntity tenant)? switchTenant,
    required TResult orElse(),
  }) {
    if (switchTenant != null) {
      return switchTenant(tenant);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadActiveTenant value) loadActiveTenant,
    required TResult Function(SwitchTenant value) switchTenant,
  }) {
    return switchTenant(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadActiveTenant value)? loadActiveTenant,
    TResult? Function(SwitchTenant value)? switchTenant,
  }) {
    return switchTenant?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadActiveTenant value)? loadActiveTenant,
    TResult Function(SwitchTenant value)? switchTenant,
    required TResult orElse(),
  }) {
    if (switchTenant != null) {
      return switchTenant(this);
    }
    return orElse();
  }
}

abstract class SwitchTenant implements TenantEvent {
  const factory SwitchTenant(final TenantEntity tenant) = _$SwitchTenantImpl;

  TenantEntity get tenant;

  /// Create a copy of TenantEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SwitchTenantImplCopyWith<_$SwitchTenantImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
