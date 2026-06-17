import '../dto/response/send_sos_response_dto.dart';
import '../../domain/entities/sos_result.dart';

class EmergencyMapper {
  static SosResult toEntity(SendSosResponseDto dto) {
    return SosResult(dto.rawJson);
  }
}
