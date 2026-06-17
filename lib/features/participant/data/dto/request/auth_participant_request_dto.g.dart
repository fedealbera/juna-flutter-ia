// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_participant_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthParticipantRequestDtoImpl _$$AuthParticipantRequestDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$AuthParticipantRequestDtoImpl(
      dni: json['dni'] as String?,
      idEvento: json['idEvento'] as String?,
      idOrg: json['idOrg'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$$AuthParticipantRequestDtoImplToJson(
        _$AuthParticipantRequestDtoImpl instance) =>
    <String, dynamic>{
      'dni': instance.dni,
      'idEvento': instance.idEvento,
      'idOrg': instance.idOrg,
      'token': instance.token,
    };
