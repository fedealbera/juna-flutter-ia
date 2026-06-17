import 'package:injectable/injectable.dart';
import '../entities/update_contact_entity.dart';
import '../repositories/participant_repository.dart';

@lazySingleton
class UpdateContact {
  final ParticipantRepository _repository;

  UpdateContact(this._repository);

  Future<UpdateContactEntity> call({
    required String partiId,
    String? domCiudad,
    String? domCiudadNombre,
    String? domProvincia,
    String? domPais,
    String? contInstagram,
    String? contCelular,
    String? contEmail,
  }) {
    return _repository.updateContact(
      partiId: partiId,
      domCiudad: domCiudad,
      domCiudadNombre: domCiudadNombre,
      domProvincia: domProvincia,
      domPais: domPais,
      contInstagram: contInstagram,
      contCelular: contCelular,
      contEmail: contEmail,
    );
  }
}
