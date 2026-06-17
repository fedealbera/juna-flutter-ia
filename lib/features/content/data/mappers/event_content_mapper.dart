import '../../../settings/data/dto/response/event_content_response_dto.dart';
import '../../domain/entities/event_content.dart';

class EventContentMapper {
  static EventContent toEntity(EventContentResponseDto dto) {
    return EventContent(dto.rawJson);
  }
}
