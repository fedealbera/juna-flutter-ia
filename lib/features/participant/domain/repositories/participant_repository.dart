import '../entities/participant_auth.dart';
import '../entities/participant_detail.dart';
import '../entities/update_emergency_entity.dart';
import '../entities/update_contact_entity.dart';
import '../entities/update_circuito_entity.dart';
import '../entities/update_participant_entity.dart';

abstract class ParticipantRepository {
  Future<ParticipantAuth> authParticipant({
    required String dni,
    required String idEvento,
    required String idOrg,
    required String token,
  });

  Future<ParticipantDetail> getParticipantDetail({
    required String dni,
    required String idOrg,
    required String eventoId,
    String? roundId,
  });

  Future<UpdateEmergencyEntity> updateEmergency({
    required String partiId,
    required String contNombre,
    required String contTel,
  });

  Future<UpdateContactEntity> updateContact({
    required String partiId,
    String? domCiudad,
    String? domCiudadNombre,
    String? domProvincia,
    String? domPais,
    String? contInstagram,
    String? contCelular,
    String? contEmail,
  });

  Future<UpdateCircuitoEntity> updateCircuito({
    required String partiId,
    required String insId,
    required String circuitoId,
    required String categoriaId,
    required String talleId,
  });

  Future<UpdateParticipantEntity> updateParticipant({
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
  });

  Future<Map<String, dynamic>> getParticipantDocuments(String partiId);

  Future<bool> uploadParticipantDocument({
    required String partiId,
    required String tipo,
    required String filePath,
  });
}
