// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'about_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AboutEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadAboutInfo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadAboutInfo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadAboutInfo,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadAboutInfo value) loadAboutInfo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadAboutInfo value)? loadAboutInfo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadAboutInfo value)? loadAboutInfo,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AboutEventCopyWith<$Res> {
  factory $AboutEventCopyWith(
          AboutEvent value, $Res Function(AboutEvent) then) =
      _$AboutEventCopyWithImpl<$Res, AboutEvent>;
}

/// @nodoc
class _$AboutEventCopyWithImpl<$Res, $Val extends AboutEvent>
    implements $AboutEventCopyWith<$Res> {
  _$AboutEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AboutEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadAboutInfoImplCopyWith<$Res> {
  factory _$$LoadAboutInfoImplCopyWith(
          _$LoadAboutInfoImpl value, $Res Function(_$LoadAboutInfoImpl) then) =
      __$$LoadAboutInfoImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadAboutInfoImplCopyWithImpl<$Res>
    extends _$AboutEventCopyWithImpl<$Res, _$LoadAboutInfoImpl>
    implements _$$LoadAboutInfoImplCopyWith<$Res> {
  __$$LoadAboutInfoImplCopyWithImpl(
      _$LoadAboutInfoImpl _value, $Res Function(_$LoadAboutInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of AboutEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadAboutInfoImpl implements LoadAboutInfo {
  const _$LoadAboutInfoImpl();

  @override
  String toString() {
    return 'AboutEvent.loadAboutInfo()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadAboutInfoImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadAboutInfo,
  }) {
    return loadAboutInfo();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadAboutInfo,
  }) {
    return loadAboutInfo?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadAboutInfo,
    required TResult orElse(),
  }) {
    if (loadAboutInfo != null) {
      return loadAboutInfo();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadAboutInfo value) loadAboutInfo,
  }) {
    return loadAboutInfo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadAboutInfo value)? loadAboutInfo,
  }) {
    return loadAboutInfo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadAboutInfo value)? loadAboutInfo,
    required TResult orElse(),
  }) {
    if (loadAboutInfo != null) {
      return loadAboutInfo(this);
    }
    return orElse();
  }
}

abstract class LoadAboutInfo implements AboutEvent {
  const factory LoadAboutInfo() = _$LoadAboutInfoImpl;
}
