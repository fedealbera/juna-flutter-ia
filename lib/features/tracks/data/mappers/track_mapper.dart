import '../../../settings/data/dto/response/track_response_dto.dart';
import '../../domain/entities/track.dart';

class TrackMapper {
  static Track toEntity(TrackResponseDto dto) {
    return Track(dto.rawJson);
  }
}
