import 'dart:io';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/network/dio_client.dart';
import '../dto/response/participant_file_response_dto.dart';
import '../dto/response/upload_file_response_dto.dart';

part 'documents_api_service.g.dart';

@RestApi()
abstract class DocumentsApiService {
  factory DocumentsApiService(Dio dio, {String baseUrl}) = _DocumentsApiService;

  @GET('/api/participantes/{parti_id}/archivos')
  Future<List<ParticipantFileResponseDto>> getParticipantFiles(
    @Path('parti_id') String partiId,
  );

  @POST('/api/participantes/archivos')
  @MultiPart()
  Future<UploadFileResponseDto> uploadFile(
    @Part(name: 'tipo') String tipo,
    @Part(name: 'parti_id') String partiId,
    @Part(name: 'file') File file,
  );
}

@module
abstract class DocumentsApiModule {
  @lazySingleton
  DocumentsApiService provideDocumentsApiService(DioClient dioClient) {
    return DocumentsApiService(dioClient.dio);
  }
}
