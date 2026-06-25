import 'dart:io';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/network/dio_client.dart';
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

part 'participant_api_service.g.dart';

@RestApi()
abstract class ParticipantApiService {
  factory ParticipantApiService(Dio dio, {String baseUrl}) = _ParticipantApiService;

  @POST('/api/participantes/auth')
  Future<AuthParticipantResponseDto> authParticipant(
    @Body() AuthParticipantRequestDto body,
  );

  @GET('/api/participantes/{dni}/detalle')
  Future<ParticipantDetailResponseDto> getParticipantDetail(
    @Path('dni') String dni,
    @Query('idOrg') String idOrg,
    @Query('eventoId') String eventoId,
    @Query('roundId') String? roundId,
  );

  @PUT('/api/participantes/emergencia')
  Future<UpdateEmergencyResponseDto> updateEmergency(
    @Query('parti_id') String partiId,
    @Body() UpdateEmergencyRequestDto body,
  );

  @PUT('/api/participantes/contacto')
  Future<UpdateContactResponseDto> updateContact(
    @Query('parti_id') String partiId,
    @Body() UpdateContactRequestDto body,
  );

  @PUT('/api/participantes/circuito')
  Future<UpdateCircuitoResponseDto> updateCircuito(
    @Query('parti_id') String partiId,
    @Body() UpdateCircuitoRequestDto body,
  );

  @PUT('/api/participantes/{partiId}')
  Future<UpdateParticipantResponseDto> updateParticipant(
    @Path('partiId') String partiId,
    @Body() UpdateParticipantRequestDto body,
  );

  @POST('/api/participantes/token')
  Future<UpdatePushTokenResponseDto> updatePushToken(
    @Body() UpdatePushTokenRequestDto body,
  );

  @GET('/api/participantes/{id}/archivos')
  Future<dynamic> getParticipantDocuments(
    @Path('id') String partiId,
  );

  @POST('/api/participantes/archivos')
  @MultiPart()
  Future<dynamic> uploadParticipantDocument(
    @Part(name: 'parti_id') String partiId,
    @Part(name: 'tipo') String tipo,
    @Part(name: 'file') File file,
  );
}

@module
abstract class ParticipantApiModule {
  @lazySingleton
  ParticipantApiService provideParticipantApiService(DioClient dioClient) {
    return ParticipantApiService(dioClient.dio);
  }
}
