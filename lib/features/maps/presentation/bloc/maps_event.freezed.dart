// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'maps_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MapsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadMapSettings,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadMapSettings,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadMapSettings,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadMapSettings value) loadMapSettings,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadMapSettings value)? loadMapSettings,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadMapSettings value)? loadMapSettings,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapsEventCopyWith<$Res> {
  factory $MapsEventCopyWith(MapsEvent value, $Res Function(MapsEvent) then) =
      _$MapsEventCopyWithImpl<$Res, MapsEvent>;
}

/// @nodoc
class _$MapsEventCopyWithImpl<$Res, $Val extends MapsEvent>
    implements $MapsEventCopyWith<$Res> {
  _$MapsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MapsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadMapSettingsImplCopyWith<$Res> {
  factory _$$LoadMapSettingsImplCopyWith(_$LoadMapSettingsImpl value,
          $Res Function(_$LoadMapSettingsImpl) then) =
      __$$LoadMapSettingsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadMapSettingsImplCopyWithImpl<$Res>
    extends _$MapsEventCopyWithImpl<$Res, _$LoadMapSettingsImpl>
    implements _$$LoadMapSettingsImplCopyWith<$Res> {
  __$$LoadMapSettingsImplCopyWithImpl(
      _$LoadMapSettingsImpl _value, $Res Function(_$LoadMapSettingsImpl) _then)
      : super(_value, _then);

  /// Create a copy of MapsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadMapSettingsImpl implements LoadMapSettings {
  const _$LoadMapSettingsImpl();

  @override
  String toString() {
    return 'MapsEvent.loadMapSettings()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadMapSettingsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadMapSettings,
  }) {
    return loadMapSettings();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadMapSettings,
  }) {
    return loadMapSettings?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadMapSettings,
    required TResult orElse(),
  }) {
    if (loadMapSettings != null) {
      return loadMapSettings();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadMapSettings value) loadMapSettings,
  }) {
    return loadMapSettings(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadMapSettings value)? loadMapSettings,
  }) {
    return loadMapSettings?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadMapSettings value)? loadMapSettings,
    required TResult orElse(),
  }) {
    if (loadMapSettings != null) {
      return loadMapSettings(this);
    }
    return orElse();
  }
}

abstract class LoadMapSettings implements MapsEvent {
  const factory LoadMapSettings() = _$LoadMapSettingsImpl;
}
