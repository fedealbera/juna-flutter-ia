// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kit_authorization_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

KitAuthorizationRequestDto _$KitAuthorizationRequestDtoFromJson(
    Map<String, dynamic> json) {
  return _KitAuthorizationRequestDto.fromJson(json);
}

/// @nodoc
mixin _$KitAuthorizationRequestDto {
  @JsonKey(name: 'dni')
  String? get dni => throw _privateConstructorUsedError;
  @JsonKey(name: 'ins_id')
  int? get insId => throw _privateConstructorUsedError;
  @JsonKey(name: 'idEvento')
  String? get idEvento => throw _privateConstructorUsedError;
  @JsonKey(name: 'idOrg')
  String? get idOrg => throw _privateConstructorUsedError;
  @JsonKey(name: 'autorizado_dni')
  String get autorizadoDni => throw _privateConstructorUsedError;
  @JsonKey(name: 'autorizado_nombre')
  String get autorizadoNombre => throw _privateConstructorUsedError;

  /// Serializes this KitAuthorizationRequestDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of KitAuthorizationRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $KitAuthorizationRequestDtoCopyWith<KitAuthorizationRequestDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KitAuthorizationRequestDtoCopyWith<$Res> {
  factory $KitAuthorizationRequestDtoCopyWith(KitAuthorizationRequestDto value,
          $Res Function(KitAuthorizationRequestDto) then) =
      _$KitAuthorizationRequestDtoCopyWithImpl<$Res,
          KitAuthorizationRequestDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'dni') String? dni,
      @JsonKey(name: 'ins_id') int? insId,
      @JsonKey(name: 'idEvento') String? idEvento,
      @JsonKey(name: 'idOrg') String? idOrg,
      @JsonKey(name: 'autorizado_dni') String autorizadoDni,
      @JsonKey(name: 'autorizado_nombre') String autorizadoNombre});
}

/// @nodoc
class _$KitAuthorizationRequestDtoCopyWithImpl<$Res,
        $Val extends KitAuthorizationRequestDto>
    implements $KitAuthorizationRequestDtoCopyWith<$Res> {
  _$KitAuthorizationRequestDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of KitAuthorizationRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dni = freezed,
    Object? insId = freezed,
    Object? idEvento = freezed,
    Object? idOrg = freezed,
    Object? autorizadoDni = null,
    Object? autorizadoNombre = null,
  }) {
    return _then(_value.copyWith(
      dni: freezed == dni
          ? _value.dni
          : dni // ignore: cast_nullable_to_non_nullable
              as String?,
      insId: freezed == insId
          ? _value.insId
          : insId // ignore: cast_nullable_to_non_nullable
              as int?,
      idEvento: freezed == idEvento
          ? _value.idEvento
          : idEvento // ignore: cast_nullable_to_non_nullable
              as String?,
      idOrg: freezed == idOrg
          ? _value.idOrg
          : idOrg // ignore: cast_nullable_to_non_nullable
              as String?,
      autorizadoDni: null == autorizadoDni
          ? _value.autorizadoDni
          : autorizadoDni // ignore: cast_nullable_to_non_nullable
              as String,
      autorizadoNombre: null == autorizadoNombre
          ? _value.autorizadoNombre
          : autorizadoNombre // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KitAuthorizationRequestDtoImplCopyWith<$Res>
    implements $KitAuthorizationRequestDtoCopyWith<$Res> {
  factory _$$KitAuthorizationRequestDtoImplCopyWith(
          _$KitAuthorizationRequestDtoImpl value,
          $Res Function(_$KitAuthorizationRequestDtoImpl) then) =
      __$$KitAuthorizationRequestDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'dni') String? dni,
      @JsonKey(name: 'ins_id') int? insId,
      @JsonKey(name: 'idEvento') String? idEvento,
      @JsonKey(name: 'idOrg') String? idOrg,
      @JsonKey(name: 'autorizado_dni') String autorizadoDni,
      @JsonKey(name: 'autorizado_nombre') String autorizadoNombre});
}

/// @nodoc
class __$$KitAuthorizationRequestDtoImplCopyWithImpl<$Res>
    extends _$KitAuthorizationRequestDtoCopyWithImpl<$Res,
        _$KitAuthorizationRequestDtoImpl>
    implements _$$KitAuthorizationRequestDtoImplCopyWith<$Res> {
  __$$KitAuthorizationRequestDtoImplCopyWithImpl(
      _$KitAuthorizationRequestDtoImpl _value,
      $Res Function(_$KitAuthorizationRequestDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of KitAuthorizationRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dni = freezed,
    Object? insId = freezed,
    Object? idEvento = freezed,
    Object? idOrg = freezed,
    Object? autorizadoDni = null,
    Object? autorizadoNombre = null,
  }) {
    return _then(_$KitAuthorizationRequestDtoImpl(
      dni: freezed == dni
          ? _value.dni
          : dni // ignore: cast_nullable_to_non_nullable
              as String?,
      insId: freezed == insId
          ? _value.insId
          : insId // ignore: cast_nullable_to_non_nullable
              as int?,
      idEvento: freezed == idEvento
          ? _value.idEvento
          : idEvento // ignore: cast_nullable_to_non_nullable
              as String?,
      idOrg: freezed == idOrg
          ? _value.idOrg
          : idOrg // ignore: cast_nullable_to_non_nullable
              as String?,
      autorizadoDni: null == autorizadoDni
          ? _value.autorizadoDni
          : autorizadoDni // ignore: cast_nullable_to_non_nullable
              as String,
      autorizadoNombre: null == autorizadoNombre
          ? _value.autorizadoNombre
          : autorizadoNombre // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KitAuthorizationRequestDtoImpl implements _KitAuthorizationRequestDto {
  const _$KitAuthorizationRequestDtoImpl(
      {@JsonKey(name: 'dni') this.dni,
      @JsonKey(name: 'ins_id') this.insId,
      @JsonKey(name: 'idEvento') this.idEvento,
      @JsonKey(name: 'idOrg') this.idOrg,
      @JsonKey(name: 'autorizado_dni') required this.autorizadoDni,
      @JsonKey(name: 'autorizado_nombre') required this.autorizadoNombre});

  factory _$KitAuthorizationRequestDtoImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$KitAuthorizationRequestDtoImplFromJson(json);

  @override
  @JsonKey(name: 'dni')
  final String? dni;
  @override
  @JsonKey(name: 'ins_id')
  final int? insId;
  @override
  @JsonKey(name: 'idEvento')
  final String? idEvento;
  @override
  @JsonKey(name: 'idOrg')
  final String? idOrg;
  @override
  @JsonKey(name: 'autorizado_dni')
  final String autorizadoDni;
  @override
  @JsonKey(name: 'autorizado_nombre')
  final String autorizadoNombre;

  @override
  String toString() {
    return 'KitAuthorizationRequestDto(dni: $dni, insId: $insId, idEvento: $idEvento, idOrg: $idOrg, autorizadoDni: $autorizadoDni, autorizadoNombre: $autorizadoNombre)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KitAuthorizationRequestDtoImpl &&
            (identical(other.dni, dni) || other.dni == dni) &&
            (identical(other.insId, insId) || other.insId == insId) &&
            (identical(other.idEvento, idEvento) ||
                other.idEvento == idEvento) &&
            (identical(other.idOrg, idOrg) || other.idOrg == idOrg) &&
            (identical(other.autorizadoDni, autorizadoDni) ||
                other.autorizadoDni == autorizadoDni) &&
            (identical(other.autorizadoNombre, autorizadoNombre) ||
                other.autorizadoNombre == autorizadoNombre));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, dni, insId, idEvento, idOrg,
      autorizadoDni, autorizadoNombre);

  /// Create a copy of KitAuthorizationRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$KitAuthorizationRequestDtoImplCopyWith<_$KitAuthorizationRequestDtoImpl>
      get copyWith => __$$KitAuthorizationRequestDtoImplCopyWithImpl<
          _$KitAuthorizationRequestDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KitAuthorizationRequestDtoImplToJson(
      this,
    );
  }
}

abstract class _KitAuthorizationRequestDto
    implements KitAuthorizationRequestDto {
  const factory _KitAuthorizationRequestDto(
          {@JsonKey(name: 'dni') final String? dni,
          @JsonKey(name: 'ins_id') final int? insId,
          @JsonKey(name: 'idEvento') final String? idEvento,
          @JsonKey(name: 'idOrg') final String? idOrg,
          @JsonKey(name: 'autorizado_dni') required final String autorizadoDni,
          @JsonKey(name: 'autorizado_nombre')
          required final String autorizadoNombre}) =
      _$KitAuthorizationRequestDtoImpl;

  factory _KitAuthorizationRequestDto.fromJson(Map<String, dynamic> json) =
      _$KitAuthorizationRequestDtoImpl.fromJson;

  @override
  @JsonKey(name: 'dni')
  String? get dni;
  @override
  @JsonKey(name: 'ins_id')
  int? get insId;
  @override
  @JsonKey(name: 'idEvento')
  String? get idEvento;
  @override
  @JsonKey(name: 'idOrg')
  String? get idOrg;
  @override
  @JsonKey(name: 'autorizado_dni')
  String get autorizadoDni;
  @override
  @JsonKey(name: 'autorizado_nombre')
  String get autorizadoNombre;

  /// Create a copy of KitAuthorizationRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$KitAuthorizationRequestDtoImplCopyWith<_$KitAuthorizationRequestDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
