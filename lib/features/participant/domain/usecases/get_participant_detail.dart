import 'package:injectable/injectable.dart';
import '../entities/participant_detail.dart';
import '../repositories/participant_repository.dart';

@lazySingleton
class GetParticipantDetail {
  final ParticipantRepository _repository;

  GetParticipantDetail(this._repository);

  Future<ParticipantDetail> call({
    required String dni,
  }) {
    return _repository.getParticipantDetail(
      dni: dni,
    );
  }
}
