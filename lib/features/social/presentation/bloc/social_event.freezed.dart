// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'social_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SocialEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadSocialLinks,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadSocialLinks,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadSocialLinks,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadSocialLinks value) loadSocialLinks,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadSocialLinks value)? loadSocialLinks,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadSocialLinks value)? loadSocialLinks,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SocialEventCopyWith<$Res> {
  factory $SocialEventCopyWith(
          SocialEvent value, $Res Function(SocialEvent) then) =
      _$SocialEventCopyWithImpl<$Res, SocialEvent>;
}

/// @nodoc
class _$SocialEventCopyWithImpl<$Res, $Val extends SocialEvent>
    implements $SocialEventCopyWith<$Res> {
  _$SocialEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SocialEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadSocialLinksImplCopyWith<$Res> {
  factory _$$LoadSocialLinksImplCopyWith(_$LoadSocialLinksImpl value,
          $Res Function(_$LoadSocialLinksImpl) then) =
      __$$LoadSocialLinksImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadSocialLinksImplCopyWithImpl<$Res>
    extends _$SocialEventCopyWithImpl<$Res, _$LoadSocialLinksImpl>
    implements _$$LoadSocialLinksImplCopyWith<$Res> {
  __$$LoadSocialLinksImplCopyWithImpl(
      _$LoadSocialLinksImpl _value, $Res Function(_$LoadSocialLinksImpl) _then)
      : super(_value, _then);

  /// Create a copy of SocialEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadSocialLinksImpl implements LoadSocialLinks {
  const _$LoadSocialLinksImpl();

  @override
  String toString() {
    return 'SocialEvent.loadSocialLinks()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadSocialLinksImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadSocialLinks,
  }) {
    return loadSocialLinks();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadSocialLinks,
  }) {
    return loadSocialLinks?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadSocialLinks,
    required TResult orElse(),
  }) {
    if (loadSocialLinks != null) {
      return loadSocialLinks();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadSocialLinks value) loadSocialLinks,
  }) {
    return loadSocialLinks(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadSocialLinks value)? loadSocialLinks,
  }) {
    return loadSocialLinks?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadSocialLinks value)? loadSocialLinks,
    required TResult orElse(),
  }) {
    if (loadSocialLinks != null) {
      return loadSocialLinks(this);
    }
    return orElse();
  }
}

abstract class LoadSocialLinks implements SocialEvent {
  const factory LoadSocialLinks() = _$LoadSocialLinksImpl;
}
