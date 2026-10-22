// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'runners_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RunnersEvent {
  String get eventId => throw _privateConstructorUsedError;
  String get orgId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String eventId, String orgId) getRunners,
    required TResult Function(String eventId, String orgId) refresh,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String eventId, String orgId)? getRunners,
    TResult? Function(String eventId, String orgId)? refresh,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String eventId, String orgId)? getRunners,
    TResult Function(String eventId, String orgId)? refresh,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetRunnersEvent value) getRunners,
    required TResult Function(RefreshRunnersEvent value) refresh,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetRunnersEvent value)? getRunners,
    TResult? Function(RefreshRunnersEvent value)? refresh,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetRunnersEvent value)? getRunners,
    TResult Function(RefreshRunnersEvent value)? refresh,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of RunnersEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RunnersEventCopyWith<RunnersEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RunnersEventCopyWith<$Res> {
  factory $RunnersEventCopyWith(
          RunnersEvent value, $Res Function(RunnersEvent) then) =
      _$RunnersEventCopyWithImpl<$Res, RunnersEvent>;
  @useResult
  $Res call({String eventId, String orgId});
}

/// @nodoc
class _$RunnersEventCopyWithImpl<$Res, $Val extends RunnersEvent>
    implements $RunnersEventCopyWith<$Res> {
  _$RunnersEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RunnersEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? orgId = null,
  }) {
    return _then(_value.copyWith(
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      orgId: null == orgId
          ? _value.orgId
          : orgId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetRunnersEventImplCopyWith<$Res>
    implements $RunnersEventCopyWith<$Res> {
  factory _$$GetRunnersEventImplCopyWith(_$GetRunnersEventImpl value,
          $Res Function(_$GetRunnersEventImpl) then) =
      __$$GetRunnersEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String eventId, String orgId});
}

/// @nodoc
class __$$GetRunnersEventImplCopyWithImpl<$Res>
    extends _$RunnersEventCopyWithImpl<$Res, _$GetRunnersEventImpl>
    implements _$$GetRunnersEventImplCopyWith<$Res> {
  __$$GetRunnersEventImplCopyWithImpl(
      _$GetRunnersEventImpl _value, $Res Function(_$GetRunnersEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of RunnersEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? orgId = null,
  }) {
    return _then(_$GetRunnersEventImpl(
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      orgId: null == orgId
          ? _value.orgId
          : orgId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetRunnersEventImpl implements GetRunnersEvent {
  const _$GetRunnersEventImpl({required this.eventId, required this.orgId});

  @override
  final String eventId;
  @override
  final String orgId;

  @override
  String toString() {
    return 'RunnersEvent.getRunners(eventId: $eventId, orgId: $orgId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetRunnersEventImpl &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.orgId, orgId) || other.orgId == orgId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, eventId, orgId);

  /// Create a copy of RunnersEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetRunnersEventImplCopyWith<_$GetRunnersEventImpl> get copyWith =>
      __$$GetRunnersEventImplCopyWithImpl<_$GetRunnersEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String eventId, String orgId) getRunners,
    required TResult Function(String eventId, String orgId) refresh,
  }) {
    return getRunners(eventId, orgId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String eventId, String orgId)? getRunners,
    TResult? Function(String eventId, String orgId)? refresh,
  }) {
    return getRunners?.call(eventId, orgId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String eventId, String orgId)? getRunners,
    TResult Function(String eventId, String orgId)? refresh,
    required TResult orElse(),
  }) {
    if (getRunners != null) {
      return getRunners(eventId, orgId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetRunnersEvent value) getRunners,
    required TResult Function(RefreshRunnersEvent value) refresh,
  }) {
    return getRunners(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetRunnersEvent value)? getRunners,
    TResult? Function(RefreshRunnersEvent value)? refresh,
  }) {
    return getRunners?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetRunnersEvent value)? getRunners,
    TResult Function(RefreshRunnersEvent value)? refresh,
    required TResult orElse(),
  }) {
    if (getRunners != null) {
      return getRunners(this);
    }
    return orElse();
  }
}

abstract class GetRunnersEvent implements RunnersEvent {
  const factory GetRunnersEvent(
      {required final String eventId,
      required final String orgId}) = _$GetRunnersEventImpl;

  @override
  String get eventId;
  @override
  String get orgId;

  /// Create a copy of RunnersEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetRunnersEventImplCopyWith<_$GetRunnersEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RefreshRunnersEventImplCopyWith<$Res>
    implements $RunnersEventCopyWith<$Res> {
  factory _$$RefreshRunnersEventImplCopyWith(_$RefreshRunnersEventImpl value,
          $Res Function(_$RefreshRunnersEventImpl) then) =
      __$$RefreshRunnersEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String eventId, String orgId});
}

/// @nodoc
class __$$RefreshRunnersEventImplCopyWithImpl<$Res>
    extends _$RunnersEventCopyWithImpl<$Res, _$RefreshRunnersEventImpl>
    implements _$$RefreshRunnersEventImplCopyWith<$Res> {
  __$$RefreshRunnersEventImplCopyWithImpl(_$RefreshRunnersEventImpl _value,
      $Res Function(_$RefreshRunnersEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of RunnersEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? orgId = null,
  }) {
    return _then(_$RefreshRunnersEventImpl(
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      orgId: null == orgId
          ? _value.orgId
          : orgId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RefreshRunnersEventImpl implements RefreshRunnersEvent {
  const _$RefreshRunnersEventImpl({required this.eventId, required this.orgId});

  @override
  final String eventId;
  @override
  final String orgId;

  @override
  String toString() {
    return 'RunnersEvent.refresh(eventId: $eventId, orgId: $orgId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefreshRunnersEventImpl &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.orgId, orgId) || other.orgId == orgId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, eventId, orgId);

  /// Create a copy of RunnersEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RefreshRunnersEventImplCopyWith<_$RefreshRunnersEventImpl> get copyWith =>
      __$$RefreshRunnersEventImplCopyWithImpl<_$RefreshRunnersEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String eventId, String orgId) getRunners,
    required TResult Function(String eventId, String orgId) refresh,
  }) {
    return refresh(eventId, orgId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String eventId, String orgId)? getRunners,
    TResult? Function(String eventId, String orgId)? refresh,
  }) {
    return refresh?.call(eventId, orgId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String eventId, String orgId)? getRunners,
    TResult Function(String eventId, String orgId)? refresh,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh(eventId, orgId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetRunnersEvent value) getRunners,
    required TResult Function(RefreshRunnersEvent value) refresh,
  }) {
    return refresh(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetRunnersEvent value)? getRunners,
    TResult? Function(RefreshRunnersEvent value)? refresh,
  }) {
    return refresh?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetRunnersEvent value)? getRunners,
    TResult Function(RefreshRunnersEvent value)? refresh,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh(this);
    }
    return orElse();
  }
}

abstract class RefreshRunnersEvent implements RunnersEvent {
  const factory RefreshRunnersEvent(
      {required final String eventId,
      required final String orgId}) = _$RefreshRunnersEventImpl;

  @override
  String get eventId;
  @override
  String get orgId;

  /// Create a copy of RunnersEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RefreshRunnersEventImplCopyWith<_$RefreshRunnersEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
