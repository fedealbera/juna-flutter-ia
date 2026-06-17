// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_contact_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UpdateContactRequestDtoImpl _$$UpdateContactRequestDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdateContactRequestDtoImpl(
      domCiudad: json['domCiudad'] as String?,
      domCiudadNombre: json['domCiudadNombre'] as String?,
      domProvincia: json['domProvincia'] as String?,
      domPais: json['domPais'] as String?,
      contInstagram: json['contInstagram'] as String?,
      contCelular: json['contCelular'] as String?,
      contEmail: json['contEmail'] as String?,
    );

Map<String, dynamic> _$$UpdateContactRequestDtoImplToJson(
        _$UpdateContactRequestDtoImpl instance) =>
    <String, dynamic>{
      'domCiudad': instance.domCiudad,
      'domCiudadNombre': instance.domCiudadNombre,
      'domProvincia': instance.domProvincia,
      'domPais': instance.domPais,
      'contInstagram': instance.contInstagram,
      'contCelular': instance.contCelular,
      'contEmail': instance.contEmail,
    };
