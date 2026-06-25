import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/participant_auth.dart';
import '../../domain/entities/participant_detail.dart';
import '../../domain/entities/update_circuito_entity.dart';
import '../../domain/entities/update_contact_entity.dart';
import '../../domain/entities/update_emergency_entity.dart';
import '../../domain/entities/update_participant_entity.dart';

part 'participant_state.freezed.dart';

@freezed
class ParticipantState with _$ParticipantState {
  const factory ParticipantState.initial() = ParticipantInitial;
  const factory ParticipantState.loading() = ParticipantLoading;
  const factory ParticipantState.authenticated(ParticipantAuth auth) = ParticipantAuthenticated;
  const factory ParticipantState.detailLoaded(ParticipantDetail detail) = ParticipantDetailLoaded;
  const factory ParticipantState.emergencyUpdated(UpdateEmergencyEntity result) = ParticipantEmergencyUpdated;
  const factory ParticipantState.contactUpdated(UpdateContactEntity result) = ParticipantContactUpdated;
  const factory ParticipantState.circuitoUpdated(UpdateCircuitoEntity result) = ParticipantCircuitoUpdated;
  const factory ParticipantState.participantUpdated(UpdateParticipantEntity result) = ParticipantUpdated;
  const factory ParticipantState.error(String message) = ParticipantError;
}
