// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_push_token_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UpdatePushTokenRequestDtoImpl _$$UpdatePushTokenRequestDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdatePushTokenRequestDtoImpl(
      documento: json['documento'] as String?,
      idEvento: json['idEvento'] as String?,
      idOrg: json['idOrg'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$$UpdatePushTokenRequestDtoImplToJson(
        _$UpdatePushTokenRequestDtoImpl instance) =>
    <String, dynamic>{
      'documento': instance.documento,
      'idEvento': instance.idEvento,
      'idOrg': instance.idOrg,
      'token': instance.token,
    };
