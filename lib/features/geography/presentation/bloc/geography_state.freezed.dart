// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'geography_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GeographyState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Country> countries) countriesLoaded,
    required TResult Function(List<Province> states) statesLoaded,
    required TResult Function(List<City> cities) citiesLoaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Country> countries)? countriesLoaded,
    TResult? Function(List<Province> states)? statesLoaded,
    TResult? Function(List<City> cities)? citiesLoaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Country> countries)? countriesLoaded,
    TResult Function(List<Province> states)? statesLoaded,
    TResult Function(List<City> cities)? citiesLoaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GeographyInitial value) initial,
    required TResult Function(GeographyLoading value) loading,
    required TResult Function(CountriesLoaded value) countriesLoaded,
    required TResult Function(StatesLoaded value) statesLoaded,
    required TResult Function(CitiesLoaded value) citiesLoaded,
    required TResult Function(GeographyError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GeographyInitial value)? initial,
    TResult? Function(GeographyLoading value)? loading,
    TResult? Function(CountriesLoaded value)? countriesLoaded,
    TResult? Function(StatesLoaded value)? statesLoaded,
    TResult? Function(CitiesLoaded value)? citiesLoaded,
    TResult? Function(GeographyError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GeographyInitial value)? initial,
    TResult Function(GeographyLoading value)? loading,
    TResult Function(CountriesLoaded value)? countriesLoaded,
    TResult Function(StatesLoaded value)? statesLoaded,
    TResult Function(CitiesLoaded value)? citiesLoaded,
    TResult Function(GeographyError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeographyStateCopyWith<$Res> {
  factory $GeographyStateCopyWith(
          GeographyState value, $Res Function(GeographyState) then) =
      _$GeographyStateCopyWithImpl<$Res, GeographyState>;
}

/// @nodoc
class _$GeographyStateCopyWithImpl<$Res, $Val extends GeographyState>
    implements $GeographyStateCopyWith<$Res> {
  _$GeographyStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GeographyState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GeographyInitialImplCopyWith<$Res> {
  factory _$$GeographyInitialImplCopyWith(_$GeographyInitialImpl value,
          $Res Function(_$GeographyInitialImpl) then) =
      __$$GeographyInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GeographyInitialImplCopyWithImpl<$Res>
    extends _$GeographyStateCopyWithImpl<$Res, _$GeographyInitialImpl>
    implements _$$GeographyInitialImplCopyWith<$Res> {
  __$$GeographyInitialImplCopyWithImpl(_$GeographyInitialImpl _value,
      $Res Function(_$GeographyInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of GeographyState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GeographyInitialImpl implements GeographyInitial {
  const _$GeographyInitialImpl();

  @override
  String toString() {
    return 'GeographyState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GeographyInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Country> countries) countriesLoaded,
    required TResult Function(List<Province> states) statesLoaded,
    required TResult Function(List<City> cities) citiesLoaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Country> countries)? countriesLoaded,
    TResult? Function(List<Province> states)? statesLoaded,
    TResult? Function(List<City> cities)? citiesLoaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Country> countries)? countriesLoaded,
    TResult Function(List<Province> states)? statesLoaded,
    TResult Function(List<City> cities)? citiesLoaded,
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
    required TResult Function(GeographyInitial value) initial,
    required TResult Function(GeographyLoading value) loading,
    required TResult Function(CountriesLoaded value) countriesLoaded,
    required TResult Function(StatesLoaded value) statesLoaded,
    required TResult Function(CitiesLoaded value) citiesLoaded,
    required TResult Function(GeographyError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GeographyInitial value)? initial,
    TResult? Function(GeographyLoading value)? loading,
    TResult? Function(CountriesLoaded value)? countriesLoaded,
    TResult? Function(StatesLoaded value)? statesLoaded,
    TResult? Function(CitiesLoaded value)? citiesLoaded,
    TResult? Function(GeographyError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GeographyInitial value)? initial,
    TResult Function(GeographyLoading value)? loading,
    TResult Function(CountriesLoaded value)? countriesLoaded,
    TResult Function(StatesLoaded value)? statesLoaded,
    TResult Function(CitiesLoaded value)? citiesLoaded,
    TResult Function(GeographyError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class GeographyInitial implements GeographyState {
  const factory GeographyInitial() = _$GeographyInitialImpl;
}

/// @nodoc
abstract class _$$GeographyLoadingImplCopyWith<$Res> {
  factory _$$GeographyLoadingImplCopyWith(_$GeographyLoadingImpl value,
          $Res Function(_$GeographyLoadingImpl) then) =
      __$$GeographyLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GeographyLoadingImplCopyWithImpl<$Res>
    extends _$GeographyStateCopyWithImpl<$Res, _$GeographyLoadingImpl>
    implements _$$GeographyLoadingImplCopyWith<$Res> {
  __$$GeographyLoadingImplCopyWithImpl(_$GeographyLoadingImpl _value,
      $Res Function(_$GeographyLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of GeographyState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GeographyLoadingImpl implements GeographyLoading {
  const _$GeographyLoadingImpl();

  @override
  String toString() {
    return 'GeographyState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GeographyLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Country> countries) countriesLoaded,
    required TResult Function(List<Province> states) statesLoaded,
    required TResult Function(List<City> cities) citiesLoaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Country> countries)? countriesLoaded,
    TResult? Function(List<Province> states)? statesLoaded,
    TResult? Function(List<City> cities)? citiesLoaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Country> countries)? countriesLoaded,
    TResult Function(List<Province> states)? statesLoaded,
    TResult Function(List<City> cities)? citiesLoaded,
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
    required TResult Function(GeographyInitial value) initial,
    required TResult Function(GeographyLoading value) loading,
    required TResult Function(CountriesLoaded value) countriesLoaded,
    required TResult Function(StatesLoaded value) statesLoaded,
    required TResult Function(CitiesLoaded value) citiesLoaded,
    required TResult Function(GeographyError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GeographyInitial value)? initial,
    TResult? Function(GeographyLoading value)? loading,
    TResult? Function(CountriesLoaded value)? countriesLoaded,
    TResult? Function(StatesLoaded value)? statesLoaded,
    TResult? Function(CitiesLoaded value)? citiesLoaded,
    TResult? Function(GeographyError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GeographyInitial value)? initial,
    TResult Function(GeographyLoading value)? loading,
    TResult Function(CountriesLoaded value)? countriesLoaded,
    TResult Function(StatesLoaded value)? statesLoaded,
    TResult Function(CitiesLoaded value)? citiesLoaded,
    TResult Function(GeographyError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class GeographyLoading implements GeographyState {
  const factory GeographyLoading() = _$GeographyLoadingImpl;
}

/// @nodoc
abstract class _$$CountriesLoadedImplCopyWith<$Res> {
  factory _$$CountriesLoadedImplCopyWith(_$CountriesLoadedImpl value,
          $Res Function(_$CountriesLoadedImpl) then) =
      __$$CountriesLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Country> countries});
}

/// @nodoc
class __$$CountriesLoadedImplCopyWithImpl<$Res>
    extends _$GeographyStateCopyWithImpl<$Res, _$CountriesLoadedImpl>
    implements _$$CountriesLoadedImplCopyWith<$Res> {
  __$$CountriesLoadedImplCopyWithImpl(
      _$CountriesLoadedImpl _value, $Res Function(_$CountriesLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of GeographyState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? countries = null,
  }) {
    return _then(_$CountriesLoadedImpl(
      null == countries
          ? _value._countries
          : countries // ignore: cast_nullable_to_non_nullable
              as List<Country>,
    ));
  }
}

/// @nodoc

class _$CountriesLoadedImpl implements CountriesLoaded {
  const _$CountriesLoadedImpl(final List<Country> countries)
      : _countries = countries;

  final List<Country> _countries;
  @override
  List<Country> get countries {
    if (_countries is EqualUnmodifiableListView) return _countries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_countries);
  }

  @override
  String toString() {
    return 'GeographyState.countriesLoaded(countries: $countries)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CountriesLoadedImpl &&
            const DeepCollectionEquality()
                .equals(other._countries, _countries));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_countries));

  /// Create a copy of GeographyState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CountriesLoadedImplCopyWith<_$CountriesLoadedImpl> get copyWith =>
      __$$CountriesLoadedImplCopyWithImpl<_$CountriesLoadedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Country> countries) countriesLoaded,
    required TResult Function(List<Province> states) statesLoaded,
    required TResult Function(List<City> cities) citiesLoaded,
    required TResult Function(String message) error,
  }) {
    return countriesLoaded(countries);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Country> countries)? countriesLoaded,
    TResult? Function(List<Province> states)? statesLoaded,
    TResult? Function(List<City> cities)? citiesLoaded,
    TResult? Function(String message)? error,
  }) {
    return countriesLoaded?.call(countries);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Country> countries)? countriesLoaded,
    TResult Function(List<Province> states)? statesLoaded,
    TResult Function(List<City> cities)? citiesLoaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (countriesLoaded != null) {
      return countriesLoaded(countries);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GeographyInitial value) initial,
    required TResult Function(GeographyLoading value) loading,
    required TResult Function(CountriesLoaded value) countriesLoaded,
    required TResult Function(StatesLoaded value) statesLoaded,
    required TResult Function(CitiesLoaded value) citiesLoaded,
    required TResult Function(GeographyError value) error,
  }) {
    return countriesLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GeographyInitial value)? initial,
    TResult? Function(GeographyLoading value)? loading,
    TResult? Function(CountriesLoaded value)? countriesLoaded,
    TResult? Function(StatesLoaded value)? statesLoaded,
    TResult? Function(CitiesLoaded value)? citiesLoaded,
    TResult? Function(GeographyError value)? error,
  }) {
    return countriesLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GeographyInitial value)? initial,
    TResult Function(GeographyLoading value)? loading,
    TResult Function(CountriesLoaded value)? countriesLoaded,
    TResult Function(StatesLoaded value)? statesLoaded,
    TResult Function(CitiesLoaded value)? citiesLoaded,
    TResult Function(GeographyError value)? error,
    required TResult orElse(),
  }) {
    if (countriesLoaded != null) {
      return countriesLoaded(this);
    }
    return orElse();
  }
}

abstract class CountriesLoaded implements GeographyState {
  const factory CountriesLoaded(final List<Country> countries) =
      _$CountriesLoadedImpl;

  List<Country> get countries;

  /// Create a copy of GeographyState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CountriesLoadedImplCopyWith<_$CountriesLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StatesLoadedImplCopyWith<$Res> {
  factory _$$StatesLoadedImplCopyWith(
          _$StatesLoadedImpl value, $Res Function(_$StatesLoadedImpl) then) =
      __$$StatesLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Province> states});
}

/// @nodoc
class __$$StatesLoadedImplCopyWithImpl<$Res>
    extends _$GeographyStateCopyWithImpl<$Res, _$StatesLoadedImpl>
    implements _$$StatesLoadedImplCopyWith<$Res> {
  __$$StatesLoadedImplCopyWithImpl(
      _$StatesLoadedImpl _value, $Res Function(_$StatesLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of GeographyState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? states = null,
  }) {
    return _then(_$StatesLoadedImpl(
      null == states
          ? _value._states
          : states // ignore: cast_nullable_to_non_nullable
              as List<Province>,
    ));
  }
}

/// @nodoc

class _$StatesLoadedImpl implements StatesLoaded {
  const _$StatesLoadedImpl(final List<Province> states) : _states = states;

  final List<Province> _states;
  @override
  List<Province> get states {
    if (_states is EqualUnmodifiableListView) return _states;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_states);
  }

  @override
  String toString() {
    return 'GeographyState.statesLoaded(states: $states)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatesLoadedImpl &&
            const DeepCollectionEquality().equals(other._states, _states));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_states));

  /// Create a copy of GeographyState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StatesLoadedImplCopyWith<_$StatesLoadedImpl> get copyWith =>
      __$$StatesLoadedImplCopyWithImpl<_$StatesLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Country> countries) countriesLoaded,
    required TResult Function(List<Province> states) statesLoaded,
    required TResult Function(List<City> cities) citiesLoaded,
    required TResult Function(String message) error,
  }) {
    return statesLoaded(states);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Country> countries)? countriesLoaded,
    TResult? Function(List<Province> states)? statesLoaded,
    TResult? Function(List<City> cities)? citiesLoaded,
    TResult? Function(String message)? error,
  }) {
    return statesLoaded?.call(states);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Country> countries)? countriesLoaded,
    TResult Function(List<Province> states)? statesLoaded,
    TResult Function(List<City> cities)? citiesLoaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (statesLoaded != null) {
      return statesLoaded(states);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GeographyInitial value) initial,
    required TResult Function(GeographyLoading value) loading,
    required TResult Function(CountriesLoaded value) countriesLoaded,
    required TResult Function(StatesLoaded value) statesLoaded,
    required TResult Function(CitiesLoaded value) citiesLoaded,
    required TResult Function(GeographyError value) error,
  }) {
    return statesLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GeographyInitial value)? initial,
    TResult? Function(GeographyLoading value)? loading,
    TResult? Function(CountriesLoaded value)? countriesLoaded,
    TResult? Function(StatesLoaded value)? statesLoaded,
    TResult? Function(CitiesLoaded value)? citiesLoaded,
    TResult? Function(GeographyError value)? error,
  }) {
    return statesLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GeographyInitial value)? initial,
    TResult Function(GeographyLoading value)? loading,
    TResult Function(CountriesLoaded value)? countriesLoaded,
    TResult Function(StatesLoaded value)? statesLoaded,
    TResult Function(CitiesLoaded value)? citiesLoaded,
    TResult Function(GeographyError value)? error,
    required TResult orElse(),
  }) {
    if (statesLoaded != null) {
      return statesLoaded(this);
    }
    return orElse();
  }
}

abstract class StatesLoaded implements GeographyState {
  const factory StatesLoaded(final List<Province> states) = _$StatesLoadedImpl;

  List<Province> get states;

  /// Create a copy of GeographyState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StatesLoadedImplCopyWith<_$StatesLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CitiesLoadedImplCopyWith<$Res> {
  factory _$$CitiesLoadedImplCopyWith(
          _$CitiesLoadedImpl value, $Res Function(_$CitiesLoadedImpl) then) =
      __$$CitiesLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<City> cities});
}

/// @nodoc
class __$$CitiesLoadedImplCopyWithImpl<$Res>
    extends _$GeographyStateCopyWithImpl<$Res, _$CitiesLoadedImpl>
    implements _$$CitiesLoadedImplCopyWith<$Res> {
  __$$CitiesLoadedImplCopyWithImpl(
      _$CitiesLoadedImpl _value, $Res Function(_$CitiesLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of GeographyState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cities = null,
  }) {
    return _then(_$CitiesLoadedImpl(
      null == cities
          ? _value._cities
          : cities // ignore: cast_nullable_to_non_nullable
              as List<City>,
    ));
  }
}

/// @nodoc

class _$CitiesLoadedImpl implements CitiesLoaded {
  const _$CitiesLoadedImpl(final List<City> cities) : _cities = cities;

  final List<City> _cities;
  @override
  List<City> get cities {
    if (_cities is EqualUnmodifiableListView) return _cities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cities);
  }

  @override
  String toString() {
    return 'GeographyState.citiesLoaded(cities: $cities)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CitiesLoadedImpl &&
            const DeepCollectionEquality().equals(other._cities, _cities));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_cities));

  /// Create a copy of GeographyState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CitiesLoadedImplCopyWith<_$CitiesLoadedImpl> get copyWith =>
      __$$CitiesLoadedImplCopyWithImpl<_$CitiesLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Country> countries) countriesLoaded,
    required TResult Function(List<Province> states) statesLoaded,
    required TResult Function(List<City> cities) citiesLoaded,
    required TResult Function(String message) error,
  }) {
    return citiesLoaded(cities);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Country> countries)? countriesLoaded,
    TResult? Function(List<Province> states)? statesLoaded,
    TResult? Function(List<City> cities)? citiesLoaded,
    TResult? Function(String message)? error,
  }) {
    return citiesLoaded?.call(cities);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Country> countries)? countriesLoaded,
    TResult Function(List<Province> states)? statesLoaded,
    TResult Function(List<City> cities)? citiesLoaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (citiesLoaded != null) {
      return citiesLoaded(cities);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GeographyInitial value) initial,
    required TResult Function(GeographyLoading value) loading,
    required TResult Function(CountriesLoaded value) countriesLoaded,
    required TResult Function(StatesLoaded value) statesLoaded,
    required TResult Function(CitiesLoaded value) citiesLoaded,
    required TResult Function(GeographyError value) error,
  }) {
    return citiesLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GeographyInitial value)? initial,
    TResult? Function(GeographyLoading value)? loading,
    TResult? Function(CountriesLoaded value)? countriesLoaded,
    TResult? Function(StatesLoaded value)? statesLoaded,
    TResult? Function(CitiesLoaded value)? citiesLoaded,
    TResult? Function(GeographyError value)? error,
  }) {
    return citiesLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GeographyInitial value)? initial,
    TResult Function(GeographyLoading value)? loading,
    TResult Function(CountriesLoaded value)? countriesLoaded,
    TResult Function(StatesLoaded value)? statesLoaded,
    TResult Function(CitiesLoaded value)? citiesLoaded,
    TResult Function(GeographyError value)? error,
    required TResult orElse(),
  }) {
    if (citiesLoaded != null) {
      return citiesLoaded(this);
    }
    return orElse();
  }
}

abstract class CitiesLoaded implements GeographyState {
  const factory CitiesLoaded(final List<City> cities) = _$CitiesLoadedImpl;

  List<City> get cities;

  /// Create a copy of GeographyState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CitiesLoadedImplCopyWith<_$CitiesLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GeographyErrorImplCopyWith<$Res> {
  factory _$$GeographyErrorImplCopyWith(_$GeographyErrorImpl value,
          $Res Function(_$GeographyErrorImpl) then) =
      __$$GeographyErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$GeographyErrorImplCopyWithImpl<$Res>
    extends _$GeographyStateCopyWithImpl<$Res, _$GeographyErrorImpl>
    implements _$$GeographyErrorImplCopyWith<$Res> {
  __$$GeographyErrorImplCopyWithImpl(
      _$GeographyErrorImpl _value, $Res Function(_$GeographyErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of GeographyState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$GeographyErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GeographyErrorImpl implements GeographyError {
  const _$GeographyErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'GeographyState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeographyErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of GeographyState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GeographyErrorImplCopyWith<_$GeographyErrorImpl> get copyWith =>
      __$$GeographyErrorImplCopyWithImpl<_$GeographyErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Country> countries) countriesLoaded,
    required TResult Function(List<Province> states) statesLoaded,
    required TResult Function(List<City> cities) citiesLoaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Country> countries)? countriesLoaded,
    TResult? Function(List<Province> states)? statesLoaded,
    TResult? Function(List<City> cities)? citiesLoaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Country> countries)? countriesLoaded,
    TResult Function(List<Province> states)? statesLoaded,
    TResult Function(List<City> cities)? citiesLoaded,
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
    required TResult Function(GeographyInitial value) initial,
    required TResult Function(GeographyLoading value) loading,
    required TResult Function(CountriesLoaded value) countriesLoaded,
    required TResult Function(StatesLoaded value) statesLoaded,
    required TResult Function(CitiesLoaded value) citiesLoaded,
    required TResult Function(GeographyError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GeographyInitial value)? initial,
    TResult? Function(GeographyLoading value)? loading,
    TResult? Function(CountriesLoaded value)? countriesLoaded,
    TResult? Function(StatesLoaded value)? statesLoaded,
    TResult? Function(CitiesLoaded value)? citiesLoaded,
    TResult? Function(GeographyError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GeographyInitial value)? initial,
    TResult Function(GeographyLoading value)? loading,
    TResult Function(CountriesLoaded value)? countriesLoaded,
    TResult Function(StatesLoaded value)? statesLoaded,
    TResult Function(CitiesLoaded value)? citiesLoaded,
    TResult Function(GeographyError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class GeographyError implements GeographyState {
  const factory GeographyError(final String message) = _$GeographyErrorImpl;

  String get message;

  /// Create a copy of GeographyState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GeographyErrorImplCopyWith<_$GeographyErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
