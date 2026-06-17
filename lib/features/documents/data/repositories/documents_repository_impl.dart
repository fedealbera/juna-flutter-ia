import 'dart:io';
import 'package:injectable/injectable.dart';
import '../../domain/entities/participant_file.dart';
import '../../domain/entities/upload_file_result.dart';
import '../../domain/repositories/documents_repository.dart';
import '../datasource/documents_remote_datasource.dart';
import '../mappers/documents_mapper.dart';

@LazySingleton(as: DocumentsRepository)
class DocumentsRepositoryImpl implements DocumentsRepository {
  final DocumentsRemoteDataSource _remoteDataSource;

  DocumentsRepositoryImpl(this._remoteDataSource);

  @override
  Future<List<ParticipantFile>> getParticipantFiles(String partiId) async {
    final responseList = await _remoteDataSource.getParticipantFiles(partiId);
    return responseList.map(DocumentsMapper.toFileEntity).toList();
  }

  @override
  Future<UploadFileResult> uploadFile({
    required String tipo,
    required String partiId,
    required File file,
  }) async {
    final response = await _remoteDataSource.uploadFile(tipo, partiId, file);
    return DocumentsMapper.toUploadEntity(response);
  }
}
