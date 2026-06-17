import 'package:injectable/injectable.dart';
import '../entities/update_emergency_entity.dart';
import '../repositories/participant_repository.dart';

@lazySingleton
class UpdateEmergency {
  final ParticipantRepository _repository;

  UpdateEmergency(this._repository);

  Future<UpdateEmergencyEntity> call({
    required String partiId,
    required String contNombre,
    required String contTel,
  }) {
    return _repository.updateEmergency(
      partiId: partiId,
      contNombre: contNombre,
      contTel: contTel,
    );
  }
}
