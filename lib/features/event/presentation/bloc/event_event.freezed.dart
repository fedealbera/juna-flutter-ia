// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EventEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getCircuits,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getCircuits,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getCircuits,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchCircuits value) getCircuits,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchCircuits value)? getCircuits,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchCircuits value)? getCircuits,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventEventCopyWith<$Res> {
  factory $EventEventCopyWith(
          EventEvent value, $Res Function(EventEvent) then) =
      _$EventEventCopyWithImpl<$Res, EventEvent>;
}

/// @nodoc
class _$EventEventCopyWithImpl<$Res, $Val extends EventEvent>
    implements $EventEventCopyWith<$Res> {
  _$EventEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EventEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$FetchCircuitsImplCopyWith<$Res> {
  factory _$$FetchCircuitsImplCopyWith(
          _$FetchCircuitsImpl value, $Res Function(_$FetchCircuitsImpl) then) =
      __$$FetchCircuitsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchCircuitsImplCopyWithImpl<$Res>
    extends _$EventEventCopyWithImpl<$Res, _$FetchCircuitsImpl>
    implements _$$FetchCircuitsImplCopyWith<$Res> {
  __$$FetchCircuitsImplCopyWithImpl(
      _$FetchCircuitsImpl _value, $Res Function(_$FetchCircuitsImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FetchCircuitsImpl implements FetchCircuits {
  const _$FetchCircuitsImpl();

  @override
  String toString() {
    return 'EventEvent.getCircuits()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchCircuitsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getCircuits,
  }) {
    return getCircuits();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getCircuits,
  }) {
    return getCircuits?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getCircuits,
    required TResult orElse(),
  }) {
    if (getCircuits != null) {
      return getCircuits();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchCircuits value) getCircuits,
  }) {
    return getCircuits(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchCircuits value)? getCircuits,
  }) {
    return getCircuits?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchCircuits value)? getCircuits,
    required TResult orElse(),
  }) {
    if (getCircuits != null) {
      return getCircuits(this);
    }
    return orElse();
  }
}

abstract class FetchCircuits implements EventEvent {
  const factory FetchCircuits() = _$FetchCircuitsImpl;
}
