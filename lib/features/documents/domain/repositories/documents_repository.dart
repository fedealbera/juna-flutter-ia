import 'dart:io';
import '../entities/participant_file.dart';
import '../entities/upload_file_result.dart';

abstract class DocumentsRepository {
  Future<List<ParticipantFile>> getParticipantFiles(String partiId);
  Future<UploadFileResult> uploadFile({
    required String tipo,
    required String partiId,
    required File file,
  });
}
