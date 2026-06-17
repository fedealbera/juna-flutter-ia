import 'package:injectable/injectable.dart';
import '../entities/participant_detail.dart';
import '../repositories/participant_repository.dart';

@lazySingleton
class GetParticipantDetail {
  final ParticipantRepository _repository;

  GetParticipantDetail(this._repository);

  Future<ParticipantDetail> call({
    required String dni,
    required String idOrg,
    required String eventoId,
    String? roundId,
  }) {
    return _repository.getParticipantDetail(
      dni: dni,
      idOrg: idOrg,
      eventoId: eventoId,
      roundId: roundId,
    );
  }
}
