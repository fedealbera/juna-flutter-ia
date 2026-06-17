import 'dart:io';
import 'package:injectable/injectable.dart';
import '../api/documents_api_service.dart';
import '../dto/response/participant_file_response_dto.dart';
import '../dto/response/upload_file_response_dto.dart';

abstract class DocumentsRemoteDataSource {
  Future<List<ParticipantFileResponseDto>> getParticipantFiles(String partiId);
  Future<UploadFileResponseDto> uploadFile(
    String tipo,
    String partiId,
    File file,
  );
}

@LazySingleton(as: DocumentsRemoteDataSource)
class DocumentsRemoteDataSourceImpl implements DocumentsRemoteDataSource {
  final DocumentsApiService _apiService;

  DocumentsRemoteDataSourceImpl(this._apiService);

  @override
  Future<List<ParticipantFileResponseDto>> getParticipantFiles(String partiId) {
    return _apiService.getParticipantFiles(partiId);
  }

  @override
  Future<UploadFileResponseDto> uploadFile(
    String tipo,
    String partiId,
    File file,
  ) {
    return _apiService.uploadFile(tipo, partiId, file);
  }
}
