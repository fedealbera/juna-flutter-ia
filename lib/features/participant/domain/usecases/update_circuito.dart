import 'package:injectable/injectable.dart';
import '../entities/update_circuito_entity.dart';
import '../repositories/participant_repository.dart';

@lazySingleton
class UpdateCircuito {
  final ParticipantRepository _repository;

  UpdateCircuito(this._repository);

  Future<UpdateCircuitoEntity> call({
    required String partiId,
    required String insId,
    required String circuitoId,
    required String categoriaId,
    required String talleId,
  }) {
    return _repository.updateCircuito(
      partiId: partiId,
      insId: insId,
      circuitoId: circuitoId,
      categoriaId: categoriaId,
      talleId: talleId,
    );
  }
}
