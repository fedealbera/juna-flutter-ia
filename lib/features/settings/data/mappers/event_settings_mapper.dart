import '../dto/response/event_settings_response_dto.dart';
import '../../domain/entities/event_settings.dart';

class EventSettingsMapper {
  static EventSettings toEntity(EventSettingsResponseDto dto) {
    return EventSettings(dto.rawJson);
  }
}
