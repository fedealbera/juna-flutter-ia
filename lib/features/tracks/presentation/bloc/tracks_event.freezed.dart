// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tracks_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TracksEvent {
  String get eventId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String eventId) getTracks,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String eventId)? getTracks,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String eventId)? getTracks,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchTracks value) getTracks,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchTracks value)? getTracks,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchTracks value)? getTracks,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of TracksEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TracksEventCopyWith<TracksEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TracksEventCopyWith<$Res> {
  factory $TracksEventCopyWith(
          TracksEvent value, $Res Function(TracksEvent) then) =
      _$TracksEventCopyWithImpl<$Res, TracksEvent>;
  @useResult
  $Res call({String eventId});
}

/// @nodoc
class _$TracksEventCopyWithImpl<$Res, $Val extends TracksEvent>
    implements $TracksEventCopyWith<$Res> {
  _$TracksEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TracksEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
  }) {
    return _then(_value.copyWith(
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FetchTracksImplCopyWith<$Res>
    implements $TracksEventCopyWith<$Res> {
  factory _$$FetchTracksImplCopyWith(
          _$FetchTracksImpl value, $Res Function(_$FetchTracksImpl) then) =
      __$$FetchTracksImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String eventId});
}

/// @nodoc
class __$$FetchTracksImplCopyWithImpl<$Res>
    extends _$TracksEventCopyWithImpl<$Res, _$FetchTracksImpl>
    implements _$$FetchTracksImplCopyWith<$Res> {
  __$$FetchTracksImplCopyWithImpl(
      _$FetchTracksImpl _value, $Res Function(_$FetchTracksImpl) _then)
      : super(_value, _then);

  /// Create a copy of TracksEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
  }) {
    return _then(_$FetchTracksImpl(
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FetchTracksImpl implements FetchTracks {
  const _$FetchTracksImpl({required this.eventId});

  @override
  final String eventId;

  @override
  String toString() {
    return 'TracksEvent.getTracks(eventId: $eventId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchTracksImpl &&
            (identical(other.eventId, eventId) || other.eventId == eventId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, eventId);

  /// Create a copy of TracksEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchTracksImplCopyWith<_$FetchTracksImpl> get copyWith =>
      __$$FetchTracksImplCopyWithImpl<_$FetchTracksImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String eventId) getTracks,
  }) {
    return getTracks(eventId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String eventId)? getTracks,
  }) {
    return getTracks?.call(eventId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String eventId)? getTracks,
    required TResult orElse(),
  }) {
    if (getTracks != null) {
      return getTracks(eventId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchTracks value) getTracks,
  }) {
    return getTracks(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchTracks value)? getTracks,
  }) {
    return getTracks?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchTracks value)? getTracks,
    required TResult orElse(),
  }) {
    if (getTracks != null) {
      return getTracks(this);
    }
    return orElse();
  }
}

abstract class FetchTracks implements TracksEvent {
  const factory FetchTracks({required final String eventId}) =
      _$FetchTracksImpl;

  @override
  String get eventId;

  /// Create a copy of TracksEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchTracksImplCopyWith<_$FetchTracksImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
