// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_sos_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SendSosRequestDtoImpl _$$SendSosRequestDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$SendSosRequestDtoImpl(
      partiId: json['parti_id'] as String?,
      eventoId: json['evento_id'] as String?,
      orgId: json['org_id'] as String?,
      latitud: json['latitud'] as String?,
      longitud: json['longitud'] as String?,
    );

Map<String, dynamic> _$$SendSosRequestDtoImplToJson(
        _$SendSosRequestDtoImpl instance) =>
    <String, dynamic>{
      'parti_id': instance.partiId,
      'evento_id': instance.eventoId,
      'org_id': instance.orgId,
      'latitud': instance.latitud,
      'longitud': instance.longitud,
    };
