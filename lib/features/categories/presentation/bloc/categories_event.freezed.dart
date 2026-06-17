// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'categories_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CategoriesEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String circuitoId, String dni) getCategories,
    required TResult Function() getSizes,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String circuitoId, String dni)? getCategories,
    TResult? Function()? getSizes,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String circuitoId, String dni)? getCategories,
    TResult Function()? getSizes,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchCategories value) getCategories,
    required TResult Function(FetchSizes value) getSizes,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchCategories value)? getCategories,
    TResult? Function(FetchSizes value)? getSizes,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchCategories value)? getCategories,
    TResult Function(FetchSizes value)? getSizes,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoriesEventCopyWith<$Res> {
  factory $CategoriesEventCopyWith(
          CategoriesEvent value, $Res Function(CategoriesEvent) then) =
      _$CategoriesEventCopyWithImpl<$Res, CategoriesEvent>;
}

/// @nodoc
class _$CategoriesEventCopyWithImpl<$Res, $Val extends CategoriesEvent>
    implements $CategoriesEventCopyWith<$Res> {
  _$CategoriesEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoriesEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$FetchCategoriesImplCopyWith<$Res> {
  factory _$$FetchCategoriesImplCopyWith(_$FetchCategoriesImpl value,
          $Res Function(_$FetchCategoriesImpl) then) =
      __$$FetchCategoriesImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String circuitoId, String dni});
}

/// @nodoc
class __$$FetchCategoriesImplCopyWithImpl<$Res>
    extends _$CategoriesEventCopyWithImpl<$Res, _$FetchCategoriesImpl>
    implements _$$FetchCategoriesImplCopyWith<$Res> {
  __$$FetchCategoriesImplCopyWithImpl(
      _$FetchCategoriesImpl _value, $Res Function(_$FetchCategoriesImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoriesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? circuitoId = null,
    Object? dni = null,
  }) {
    return _then(_$FetchCategoriesImpl(
      circuitoId: null == circuitoId
          ? _value.circuitoId
          : circuitoId // ignore: cast_nullable_to_non_nullable
              as String,
      dni: null == dni
          ? _value.dni
          : dni // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FetchCategoriesImpl implements FetchCategories {
  const _$FetchCategoriesImpl({required this.circuitoId, required this.dni});

  @override
  final String circuitoId;
  @override
  final String dni;

  @override
  String toString() {
    return 'CategoriesEvent.getCategories(circuitoId: $circuitoId, dni: $dni)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchCategoriesImpl &&
            (identical(other.circuitoId, circuitoId) ||
                other.circuitoId == circuitoId) &&
            (identical(other.dni, dni) || other.dni == dni));
  }

  @override
  int get hashCode => Object.hash(runtimeType, circuitoId, dni);

  /// Create a copy of CategoriesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchCategoriesImplCopyWith<_$FetchCategoriesImpl> get copyWith =>
      __$$FetchCategoriesImplCopyWithImpl<_$FetchCategoriesImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String circuitoId, String dni) getCategories,
    required TResult Function() getSizes,
  }) {
    return getCategories(circuitoId, dni);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String circuitoId, String dni)? getCategories,
    TResult? Function()? getSizes,
  }) {
    return getCategories?.call(circuitoId, dni);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String circuitoId, String dni)? getCategories,
    TResult Function()? getSizes,
    required TResult orElse(),
  }) {
    if (getCategories != null) {
      return getCategories(circuitoId, dni);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchCategories value) getCategories,
    required TResult Function(FetchSizes value) getSizes,
  }) {
    return getCategories(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchCategories value)? getCategories,
    TResult? Function(FetchSizes value)? getSizes,
  }) {
    return getCategories?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchCategories value)? getCategories,
    TResult Function(FetchSizes value)? getSizes,
    required TResult orElse(),
  }) {
    if (getCategories != null) {
      return getCategories(this);
    }
    return orElse();
  }
}

abstract class FetchCategories implements CategoriesEvent {
  const factory FetchCategories(
      {required final String circuitoId,
      required final String dni}) = _$FetchCategoriesImpl;

  String get circuitoId;
  String get dni;

  /// Create a copy of CategoriesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchCategoriesImplCopyWith<_$FetchCategoriesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchSizesImplCopyWith<$Res> {
  factory _$$FetchSizesImplCopyWith(
          _$FetchSizesImpl value, $Res Function(_$FetchSizesImpl) then) =
      __$$FetchSizesImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchSizesImplCopyWithImpl<$Res>
    extends _$CategoriesEventCopyWithImpl<$Res, _$FetchSizesImpl>
    implements _$$FetchSizesImplCopyWith<$Res> {
  __$$FetchSizesImplCopyWithImpl(
      _$FetchSizesImpl _value, $Res Function(_$FetchSizesImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoriesEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FetchSizesImpl implements FetchSizes {
  const _$FetchSizesImpl();

  @override
  String toString() {
    return 'CategoriesEvent.getSizes()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchSizesImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String circuitoId, String dni) getCategories,
    required TResult Function() getSizes,
  }) {
    return getSizes();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String circuitoId, String dni)? getCategories,
    TResult? Function()? getSizes,
  }) {
    return getSizes?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String circuitoId, String dni)? getCategories,
    TResult Function()? getSizes,
    required TResult orElse(),
  }) {
    if (getSizes != null) {
      return getSizes();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchCategories value) getCategories,
    required TResult Function(FetchSizes value) getSizes,
  }) {
    return getSizes(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchCategories value)? getCategories,
    TResult? Function(FetchSizes value)? getSizes,
  }) {
    return getSizes?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchCategories value)? getCategories,
    TResult Function(FetchSizes value)? getSizes,
    required TResult orElse(),
  }) {
    if (getSizes != null) {
      return getSizes(this);
    }
    return orElse();
  }
}

abstract class FetchSizes implements CategoriesEvent {
  const factory FetchSizes() = _$FetchSizesImpl;
}
