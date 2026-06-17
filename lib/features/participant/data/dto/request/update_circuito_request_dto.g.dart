// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_circuito_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UpdateCircuitoRequestDtoImpl _$$UpdateCircuitoRequestDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdateCircuitoRequestDtoImpl(
      insId: json['insId'] as String?,
      circuitoId: json['circuitoId'] as String?,
      categoriaId: json['categoriaId'] as String?,
      talleId: json['talleId'] as String?,
    );

Map<String, dynamic> _$$UpdateCircuitoRequestDtoImplToJson(
        _$UpdateCircuitoRequestDtoImpl instance) =>
    <String, dynamic>{
      'insId': instance.insId,
      'circuitoId': instance.circuitoId,
      'categoriaId': instance.categoriaId,
      'talleId': instance.talleId,
    };
