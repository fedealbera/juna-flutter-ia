import 'package:injectable/injectable.dart';
import '../entities/update_participant_entity.dart';
import '../repositories/participant_repository.dart';

@lazySingleton
class UpdateParticipant {
  final ParticipantRepository _repository;

  UpdateParticipant(this._repository);

  Future<UpdateParticipantEntity> call({
    required String partiId,
    String? contNombre,
    String? contTel,
    String? domCiudad,
    String? domCiudadNombre,
    String? domProvincia,
    String? domPais,
    String? contInstagram,
    String? contCelular,
    String? contEmail,
    String? insId,
    String? circuitoId,
    String? categoriaId,
    String? talleId,
  }) {
    return _repository.updateParticipant(
      partiId: partiId,
      contNombre: contNombre,
      contTel: contTel,
      domCiudad: domCiudad,
      domCiudadNombre: domCiudadNombre,
      domProvincia: domProvincia,
      domPais: domPais,
      contInstagram: contInstagram,
      contCelular: contCelular,
      contEmail: contEmail,
      insId: insId,
      circuitoId: circuitoId,
      categoriaId: categoriaId,
      talleId: talleId,
    );
  }
}
