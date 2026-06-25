import 'package:freezed_annotation/freezed_annotation.dart';

part 'participant_event.freezed.dart';

@freezed
class ParticipantEvent with _$ParticipantEvent {
  const factory ParticipantEvent.authenticate({
    required String dni,
    required String idEvento,
    required String idOrg,
    required String token,
  }) = Authenticate;

  const factory ParticipantEvent.getDetail({
    required String dni,
    required String idOrg,
    required String eventoId,
    String? roundId,
  }) = GetDetail;

  const factory ParticipantEvent.updateEmergency({
    required String partiId,
    required String contNombre,
    required String contTel,
  }) = UpdateEmergencyEvent;

  const factory ParticipantEvent.updateContact({
    required String partiId,
    String? domCiudad,
    String? domCiudadNombre,
    String? domProvincia,
    String? domPais,
    String? contInstagram,
    String? contCelular,
    String? contEmail,
  }) = UpdateContactEvent;

  const factory ParticipantEvent.updateCircuito({
    required String partiId,
    required String insId,
    required String circuitoId,
    required String categoriaId,
    required String talleId,
  }) = UpdateCircuitoEvent;

  const factory ParticipantEvent.updateParticipant({
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
  }) = UpdateParticipantEvent;
}
