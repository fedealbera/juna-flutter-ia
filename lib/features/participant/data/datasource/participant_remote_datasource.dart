import 'dart:io';
import 'package:injectable/injectable.dart';
import '../api/participant_api_service.dart';
import '../dto/request/auth_participant_request_dto.dart';
import '../dto/request/update_circuito_request_dto.dart';
import '../dto/request/update_contact_request_dto.dart';
import '../dto/request/update_emergency_request_dto.dart';
import '../dto/request/update_participant_request_dto.dart';
import '../dto/request/update_push_token_request_dto.dart';
import '../dto/response/auth_participant_response_dto.dart';
import '../dto/response/participant_detail_response_dto.dart';
import '../dto/response/update_circuito_response_dto.dart';
import '../dto/response/update_contact_response_dto.dart';
import '../dto/response/update_emergency_response_dto.dart';
import '../dto/response/update_participant_response_dto.dart';
import '../dto/response/update_push_token_response_dto.dart';

abstract class ParticipantRemoteDataSource {
  Future<AuthParticipantResponseDto> authParticipant(AuthParticipantRequestDto body);
  Future<ParticipantDetailResponseDto> getParticipantDetail(
    String dni,
    String idOrg,
    String eventoId,
    String? roundId,
  );
  Future<UpdateEmergencyResponseDto> updateEmergency(String partiId, UpdateEmergencyRequestDto body);
  Future<UpdateContactResponseDto> updateContact(String partiId, UpdateContactRequestDto body);
  Future<UpdateCircuitoResponseDto> updateCircuito(String partiId, UpdateCircuitoRequestDto body);
  Future<UpdateParticipantResponseDto> updateParticipant(String partiId, UpdateParticipantRequestDto body);
  Future<UpdatePushTokenResponseDto> updatePushToken(UpdatePushTokenRequestDto body);
  Future<Map<String, dynamic>> getParticipantDocuments(String partiId);
  Future<bool> uploadParticipantDocument({
    required String partiId,
    required String tipo,
    required String filePath,
  });
}

@LazySingleton(as: ParticipantRemoteDataSource)
class ParticipantRemoteDataSourceImpl implements ParticipantRemoteDataSource {
  final ParticipantApiService _apiService;

  ParticipantRemoteDataSourceImpl(this._apiService);

  @override
  Future<AuthParticipantResponseDto> authParticipant(AuthParticipantRequestDto body) {
    return _apiService.authParticipant(body);
  }

  @override
  Future<ParticipantDetailResponseDto> getParticipantDetail(
    String dni,
    String idOrg,
    String eventoId,
    String? roundId,
  ) {
    return _apiService.getParticipantDetail(dni, idOrg, eventoId, roundId);
  }

  @override
  Future<UpdateEmergencyResponseDto> updateEmergency(String partiId, UpdateEmergencyRequestDto body) {
    return _apiService.updateEmergency(partiId, body);
  }

  @override
  Future<UpdateContactResponseDto> updateContact(String partiId, UpdateContactRequestDto body) {
    return _apiService.updateContact(partiId, body);
  }

  @override
  Future<UpdateCircuitoResponseDto> updateCircuito(String partiId, UpdateCircuitoRequestDto body) {
    return _apiService.updateCircuito(partiId, body);
  }

  @override
  Future<UpdateParticipantResponseDto> updateParticipant(String partiId, UpdateParticipantRequestDto body) {
    return _apiService.updateParticipant(partiId, body);
  }

  @override
  Future<UpdatePushTokenResponseDto> updatePushToken(UpdatePushTokenRequestDto body) {
    return _apiService.updatePushToken(body);
  }

  @override
  Future<Map<String, dynamic>> getParticipantDocuments(String partiId) async {
    final response = await _apiService.getParticipantDocuments(partiId);
    if (response is Map) {
      return response.cast<String, dynamic>();
    }
    return <String, dynamic>{};
  }

  @override
  Future<bool> uploadParticipantDocument({
    required String partiId,
    required String tipo,
    required String filePath,
  }) async {
    try {
      final file = File(filePath);
      await _apiService.uploadParticipantDocument(partiId, tipo, file);
      return true;
    } catch (_) {
      return false;
    }
  }
}
