// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'geography_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GeographyEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getCountries,
    required TResult Function(String countryId) getStates,
    required TResult Function(String stateId) getCities,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getCountries,
    TResult? Function(String countryId)? getStates,
    TResult? Function(String stateId)? getCities,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getCountries,
    TResult Function(String countryId)? getStates,
    TResult Function(String stateId)? getCities,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchCountries value) getCountries,
    required TResult Function(FetchStates value) getStates,
    required TResult Function(FetchCities value) getCities,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchCountries value)? getCountries,
    TResult? Function(FetchStates value)? getStates,
    TResult? Function(FetchCities value)? getCities,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchCountries value)? getCountries,
    TResult Function(FetchStates value)? getStates,
    TResult Function(FetchCities value)? getCities,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeographyEventCopyWith<$Res> {
  factory $GeographyEventCopyWith(
          GeographyEvent value, $Res Function(GeographyEvent) then) =
      _$GeographyEventCopyWithImpl<$Res, GeographyEvent>;
}

/// @nodoc
class _$GeographyEventCopyWithImpl<$Res, $Val extends GeographyEvent>
    implements $GeographyEventCopyWith<$Res> {
  _$GeographyEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GeographyEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$FetchCountriesImplCopyWith<$Res> {
  factory _$$FetchCountriesImplCopyWith(_$FetchCountriesImpl value,
          $Res Function(_$FetchCountriesImpl) then) =
      __$$FetchCountriesImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchCountriesImplCopyWithImpl<$Res>
    extends _$GeographyEventCopyWithImpl<$Res, _$FetchCountriesImpl>
    implements _$$FetchCountriesImplCopyWith<$Res> {
  __$$FetchCountriesImplCopyWithImpl(
      _$FetchCountriesImpl _value, $Res Function(_$FetchCountriesImpl) _then)
      : super(_value, _then);

  /// Create a copy of GeographyEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FetchCountriesImpl implements FetchCountries {
  const _$FetchCountriesImpl();

  @override
  String toString() {
    return 'GeographyEvent.getCountries()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchCountriesImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getCountries,
    required TResult Function(String countryId) getStates,
    required TResult Function(String stateId) getCities,
  }) {
    return getCountries();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getCountries,
    TResult? Function(String countryId)? getStates,
    TResult? Function(String stateId)? getCities,
  }) {
    return getCountries?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getCountries,
    TResult Function(String countryId)? getStates,
    TResult Function(String stateId)? getCities,
    required TResult orElse(),
  }) {
    if (getCountries != null) {
      return getCountries();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchCountries value) getCountries,
    required TResult Function(FetchStates value) getStates,
    required TResult Function(FetchCities value) getCities,
  }) {
    return getCountries(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchCountries value)? getCountries,
    TResult? Function(FetchStates value)? getStates,
    TResult? Function(FetchCities value)? getCities,
  }) {
    return getCountries?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchCountries value)? getCountries,
    TResult Function(FetchStates value)? getStates,
    TResult Function(FetchCities value)? getCities,
    required TResult orElse(),
  }) {
    if (getCountries != null) {
      return getCountries(this);
    }
    return orElse();
  }
}

abstract class FetchCountries implements GeographyEvent {
  const factory FetchCountries() = _$FetchCountriesImpl;
}

/// @nodoc
abstract class _$$FetchStatesImplCopyWith<$Res> {
  factory _$$FetchStatesImplCopyWith(
          _$FetchStatesImpl value, $Res Function(_$FetchStatesImpl) then) =
      __$$FetchStatesImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String countryId});
}

/// @nodoc
class __$$FetchStatesImplCopyWithImpl<$Res>
    extends _$GeographyEventCopyWithImpl<$Res, _$FetchStatesImpl>
    implements _$$FetchStatesImplCopyWith<$Res> {
  __$$FetchStatesImplCopyWithImpl(
      _$FetchStatesImpl _value, $Res Function(_$FetchStatesImpl) _then)
      : super(_value, _then);

  /// Create a copy of GeographyEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? countryId = null,
  }) {
    return _then(_$FetchStatesImpl(
      countryId: null == countryId
          ? _value.countryId
          : countryId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FetchStatesImpl implements FetchStates {
  const _$FetchStatesImpl({required this.countryId});

  @override
  final String countryId;

  @override
  String toString() {
    return 'GeographyEvent.getStates(countryId: $countryId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchStatesImpl &&
            (identical(other.countryId, countryId) ||
                other.countryId == countryId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, countryId);

  /// Create a copy of GeographyEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchStatesImplCopyWith<_$FetchStatesImpl> get copyWith =>
      __$$FetchStatesImplCopyWithImpl<_$FetchStatesImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getCountries,
    required TResult Function(String countryId) getStates,
    required TResult Function(String stateId) getCities,
  }) {
    return getStates(countryId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getCountries,
    TResult? Function(String countryId)? getStates,
    TResult? Function(String stateId)? getCities,
  }) {
    return getStates?.call(countryId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getCountries,
    TResult Function(String countryId)? getStates,
    TResult Function(String stateId)? getCities,
    required TResult orElse(),
  }) {
    if (getStates != null) {
      return getStates(countryId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchCountries value) getCountries,
    required TResult Function(FetchStates value) getStates,
    required TResult Function(FetchCities value) getCities,
  }) {
    return getStates(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchCountries value)? getCountries,
    TResult? Function(FetchStates value)? getStates,
    TResult? Function(FetchCities value)? getCities,
  }) {
    return getStates?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchCountries value)? getCountries,
    TResult Function(FetchStates value)? getStates,
    TResult Function(FetchCities value)? getCities,
    required TResult orElse(),
  }) {
    if (getStates != null) {
      return getStates(this);
    }
    return orElse();
  }
}

abstract class FetchStates implements GeographyEvent {
  const factory FetchStates({required final String countryId}) =
      _$FetchStatesImpl;

  String get countryId;

  /// Create a copy of GeographyEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchStatesImplCopyWith<_$FetchStatesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchCitiesImplCopyWith<$Res> {
  factory _$$FetchCitiesImplCopyWith(
          _$FetchCitiesImpl value, $Res Function(_$FetchCitiesImpl) then) =
      __$$FetchCitiesImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String stateId});
}

/// @nodoc
class __$$FetchCitiesImplCopyWithImpl<$Res>
    extends _$GeographyEventCopyWithImpl<$Res, _$FetchCitiesImpl>
    implements _$$FetchCitiesImplCopyWith<$Res> {
  __$$FetchCitiesImplCopyWithImpl(
      _$FetchCitiesImpl _value, $Res Function(_$FetchCitiesImpl) _then)
      : super(_value, _then);

  /// Create a copy of GeographyEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stateId = null,
  }) {
    return _then(_$FetchCitiesImpl(
      stateId: null == stateId
          ? _value.stateId
          : stateId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FetchCitiesImpl implements FetchCities {
  const _$FetchCitiesImpl({required this.stateId});

  @override
  final String stateId;

  @override
  String toString() {
    return 'GeographyEvent.getCities(stateId: $stateId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchCitiesImpl &&
            (identical(other.stateId, stateId) || other.stateId == stateId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, stateId);

  /// Create a copy of GeographyEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchCitiesImplCopyWith<_$FetchCitiesImpl> get copyWith =>
      __$$FetchCitiesImplCopyWithImpl<_$FetchCitiesImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getCountries,
    required TResult Function(String countryId) getStates,
    required TResult Function(String stateId) getCities,
  }) {
    return getCities(stateId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getCountries,
    TResult? Function(String countryId)? getStates,
    TResult? Function(String stateId)? getCities,
  }) {
    return getCities?.call(stateId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getCountries,
    TResult Function(String countryId)? getStates,
    TResult Function(String stateId)? getCities,
    required TResult orElse(),
  }) {
    if (getCities != null) {
      return getCities(stateId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchCountries value) getCountries,
    required TResult Function(FetchStates value) getStates,
    required TResult Function(FetchCities value) getCities,
  }) {
    return getCities(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchCountries value)? getCountries,
    TResult? Function(FetchStates value)? getStates,
    TResult? Function(FetchCities value)? getCities,
  }) {
    return getCities?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchCountries value)? getCountries,
    TResult Function(FetchStates value)? getStates,
    TResult Function(FetchCities value)? getCities,
    required TResult orElse(),
  }) {
    if (getCities != null) {
      return getCities(this);
    }
    return orElse();
  }
}

abstract class FetchCities implements GeographyEvent {
  const factory FetchCities({required final String stateId}) =
      _$FetchCitiesImpl;

  String get stateId;

  /// Create a copy of GeographyEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchCitiesImplCopyWith<_$FetchCitiesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
