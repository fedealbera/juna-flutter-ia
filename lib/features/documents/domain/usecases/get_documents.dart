import 'package:injectable/injectable.dart';
import '../entities/participant_file.dart';
import '../repositories/documents_repository.dart';

@lazySingleton
class GetDocuments {
  final DocumentsRepository _repository;

  GetDocuments(this._repository);

  Future<List<ParticipantFile>> call({required String partiId}) {
    return _repository.getParticipantFiles(partiId);
  }
}
