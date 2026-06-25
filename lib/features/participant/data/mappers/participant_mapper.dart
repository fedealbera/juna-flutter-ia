import '../dto/response/auth_participant_response_dto.dart';
import '../dto/response/participant_detail_response_dto.dart';
import '../dto/response/update_circuito_response_dto.dart';
import '../dto/response/update_contact_response_dto.dart';
import '../dto/response/update_emergency_response_dto.dart';
import '../dto/response/update_participant_response_dto.dart';

import '../../domain/entities/participant_auth.dart';
import '../../domain/entities/participant_detail.dart';
import '../../domain/entities/update_circuito_entity.dart';
import '../../domain/entities/update_contact_entity.dart';
import '../../domain/entities/update_emergency_entity.dart';
import '../../domain/entities/update_participant_entity.dart';

class ParticipantMapper {
  static ParticipantAuth toAuthEntity(AuthParticipantResponseDto dto) {
    return ParticipantAuth(dto.rawJson);
  }

  static ParticipantDetail toDetailEntity(ParticipantDetailResponseDto dto) {
    return ParticipantDetail(dto.rawJson);
  }

  static UpdateEmergencyEntity toEmergencyEntity(UpdateEmergencyResponseDto dto) {
    return UpdateEmergencyEntity(dto.rawJson);
  }

  static UpdateContactEntity toContactEntity(UpdateContactResponseDto dto) {
    return UpdateContactEntity(dto.rawJson);
  }

  static UpdateCircuitoEntity toCircuitoEntity(UpdateCircuitoResponseDto dto) {
    return UpdateCircuitoEntity(dto.rawJson);
  }

  static UpdateParticipantEntity toParticipantEntity(UpdateParticipantResponseDto dto) {
    return UpdateParticipantEntity(dto.rawJson);
  }
}
