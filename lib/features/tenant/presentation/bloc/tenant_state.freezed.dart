// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tenant_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TenantState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(TenantEntity tenant) loaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(TenantEntity tenant)? loaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(TenantEntity tenant)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TenantInitial value) initial,
    required TResult Function(TenantLoading value) loading,
    required TResult Function(TenantLoaded value) loaded,
    required TResult Function(TenantError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TenantInitial value)? initial,
    TResult? Function(TenantLoading value)? loading,
    TResult? Function(TenantLoaded value)? loaded,
    TResult? Function(TenantError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TenantInitial value)? initial,
    TResult Function(TenantLoading value)? loading,
    TResult Function(TenantLoaded value)? loaded,
    TResult Function(TenantError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TenantStateCopyWith<$Res> {
  factory $TenantStateCopyWith(
          TenantState value, $Res Function(TenantState) then) =
      _$TenantStateCopyWithImpl<$Res, TenantState>;
}

/// @nodoc
class _$TenantStateCopyWithImpl<$Res, $Val extends TenantState>
    implements $TenantStateCopyWith<$Res> {
  _$TenantStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TenantState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$TenantInitialImplCopyWith<$Res> {
  factory _$$TenantInitialImplCopyWith(
          _$TenantInitialImpl value, $Res Function(_$TenantInitialImpl) then) =
      __$$TenantInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TenantInitialImplCopyWithImpl<$Res>
    extends _$TenantStateCopyWithImpl<$Res, _$TenantInitialImpl>
    implements _$$TenantInitialImplCopyWith<$Res> {
  __$$TenantInitialImplCopyWithImpl(
      _$TenantInitialImpl _value, $Res Function(_$TenantInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of TenantState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TenantInitialImpl implements TenantInitial {
  const _$TenantInitialImpl();

  @override
  String toString() {
    return 'TenantState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TenantInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(TenantEntity tenant) loaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(TenantEntity tenant)? loaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(TenantEntity tenant)? loaded,
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
    required TResult Function(TenantInitial value) initial,
    required TResult Function(TenantLoading value) loading,
    required TResult Function(TenantLoaded value) loaded,
    required TResult Function(TenantError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TenantInitial value)? initial,
    TResult? Function(TenantLoading value)? loading,
    TResult? Function(TenantLoaded value)? loaded,
    TResult? Function(TenantError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TenantInitial value)? initial,
    TResult Function(TenantLoading value)? loading,
    TResult Function(TenantLoaded value)? loaded,
    TResult Function(TenantError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class TenantInitial implements TenantState {
  const factory TenantInitial() = _$TenantInitialImpl;
}

/// @nodoc
abstract class _$$TenantLoadingImplCopyWith<$Res> {
  factory _$$TenantLoadingImplCopyWith(
          _$TenantLoadingImpl value, $Res Function(_$TenantLoadingImpl) then) =
      __$$TenantLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TenantLoadingImplCopyWithImpl<$Res>
    extends _$TenantStateCopyWithImpl<$Res, _$TenantLoadingImpl>
    implements _$$TenantLoadingImplCopyWith<$Res> {
  __$$TenantLoadingImplCopyWithImpl(
      _$TenantLoadingImpl _value, $Res Function(_$TenantLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of TenantState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TenantLoadingImpl implements TenantLoading {
  const _$TenantLoadingImpl();

  @override
  String toString() {
    return 'TenantState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TenantLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(TenantEntity tenant) loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(TenantEntity tenant)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(TenantEntity tenant)? loaded,
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
    required TResult Function(TenantInitial value) initial,
    required TResult Function(TenantLoading value) loading,
    required TResult Function(TenantLoaded value) loaded,
    required TResult Function(TenantError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TenantInitial value)? initial,
    TResult? Function(TenantLoading value)? loading,
    TResult? Function(TenantLoaded value)? loaded,
    TResult? Function(TenantError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TenantInitial value)? initial,
    TResult Function(TenantLoading value)? loading,
    TResult Function(TenantLoaded value)? loaded,
    TResult Function(TenantError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class TenantLoading implements TenantState {
  const factory TenantLoading() = _$TenantLoadingImpl;
}

/// @nodoc
abstract class _$$TenantLoadedImplCopyWith<$Res> {
  factory _$$TenantLoadedImplCopyWith(
          _$TenantLoadedImpl value, $Res Function(_$TenantLoadedImpl) then) =
      __$$TenantLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({TenantEntity tenant});
}

/// @nodoc
class __$$TenantLoadedImplCopyWithImpl<$Res>
    extends _$TenantStateCopyWithImpl<$Res, _$TenantLoadedImpl>
    implements _$$TenantLoadedImplCopyWith<$Res> {
  __$$TenantLoadedImplCopyWithImpl(
      _$TenantLoadedImpl _value, $Res Function(_$TenantLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of TenantState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tenant = null,
  }) {
    return _then(_$TenantLoadedImpl(
      null == tenant
          ? _value.tenant
          : tenant // ignore: cast_nullable_to_non_nullable
              as TenantEntity,
    ));
  }
}

/// @nodoc

class _$TenantLoadedImpl implements TenantLoaded {
  const _$TenantLoadedImpl(this.tenant);

  @override
  final TenantEntity tenant;

  @override
  String toString() {
    return 'TenantState.loaded(tenant: $tenant)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TenantLoadedImpl &&
            (identical(other.tenant, tenant) || other.tenant == tenant));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tenant);

  /// Create a copy of TenantState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TenantLoadedImplCopyWith<_$TenantLoadedImpl> get copyWith =>
      __$$TenantLoadedImplCopyWithImpl<_$TenantLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(TenantEntity tenant) loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(tenant);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(TenantEntity tenant)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(tenant);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(TenantEntity tenant)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(tenant);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TenantInitial value) initial,
    required TResult Function(TenantLoading value) loading,
    required TResult Function(TenantLoaded value) loaded,
    required TResult Function(TenantError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TenantInitial value)? initial,
    TResult? Function(TenantLoading value)? loading,
    TResult? Function(TenantLoaded value)? loaded,
    TResult? Function(TenantError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TenantInitial value)? initial,
    TResult Function(TenantLoading value)? loading,
    TResult Function(TenantLoaded value)? loaded,
    TResult Function(TenantError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class TenantLoaded implements TenantState {
  const factory TenantLoaded(final TenantEntity tenant) = _$TenantLoadedImpl;

  TenantEntity get tenant;

  /// Create a copy of TenantState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TenantLoadedImplCopyWith<_$TenantLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TenantErrorImplCopyWith<$Res> {
  factory _$$TenantErrorImplCopyWith(
          _$TenantErrorImpl value, $Res Function(_$TenantErrorImpl) then) =
      __$$TenantErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$TenantErrorImplCopyWithImpl<$Res>
    extends _$TenantStateCopyWithImpl<$Res, _$TenantErrorImpl>
    implements _$$TenantErrorImplCopyWith<$Res> {
  __$$TenantErrorImplCopyWithImpl(
      _$TenantErrorImpl _value, $Res Function(_$TenantErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of TenantState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$TenantErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TenantErrorImpl implements TenantError {
  const _$TenantErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'TenantState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TenantErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of TenantState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TenantErrorImplCopyWith<_$TenantErrorImpl> get copyWith =>
      __$$TenantErrorImplCopyWithImpl<_$TenantErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(TenantEntity tenant) loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(TenantEntity tenant)? loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(TenantEntity tenant)? loaded,
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
    required TResult Function(TenantInitial value) initial,
    required TResult Function(TenantLoading value) loading,
    required TResult Function(TenantLoaded value) loaded,
    required TResult Function(TenantError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TenantInitial value)? initial,
    TResult? Function(TenantLoading value)? loading,
    TResult? Function(TenantLoaded value)? loaded,
    TResult? Function(TenantError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TenantInitial value)? initial,
    TResult Function(TenantLoading value)? loading,
    TResult Function(TenantLoaded value)? loaded,
    TResult Function(TenantError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class TenantError implements TenantState {
  const factory TenantError(final String message) = _$TenantErrorImpl;

  String get message;

  /// Create a copy of TenantState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TenantErrorImplCopyWith<_$TenantErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
