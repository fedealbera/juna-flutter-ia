// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kit_authorization_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$KitAuthorizationRequestDtoImpl _$$KitAuthorizationRequestDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$KitAuthorizationRequestDtoImpl(
      dni: json['dni'] as String?,
      insId: (json['ins_id'] as num?)?.toInt(),
      idEvento: json['idEvento'] as String?,
      idOrg: json['idOrg'] as String?,
      autorizadoDni: json['autorizado_dni'] as String,
      autorizadoNombre: json['autorizado_nombre'] as String,
    );

Map<String, dynamic> _$$KitAuthorizationRequestDtoImplToJson(
        _$KitAuthorizationRequestDtoImpl instance) =>
    <String, dynamic>{
      'dni': instance.dni,
      'ins_id': instance.insId,
      'idEvento': instance.idEvento,
      'idOrg': instance.idOrg,
      'autorizado_dni': instance.autorizadoDni,
      'autorizado_nombre': instance.autorizadoNombre,
    };
