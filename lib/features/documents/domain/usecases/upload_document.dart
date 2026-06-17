import 'dart:io';
import 'package:injectable/injectable.dart';
import '../entities/upload_file_result.dart';
import '../repositories/documents_repository.dart';

@lazySingleton
class UploadDocument {
  final DocumentsRepository _repository;

  UploadDocument(this._repository);

  Future<UploadFileResult> call({
    required String tipo,
    required String partiId,
    required File file,
  }) {
    return _repository.uploadFile(tipo: tipo, partiId: partiId, file: file);
  }
}
