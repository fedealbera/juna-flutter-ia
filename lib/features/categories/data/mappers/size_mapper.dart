import '../../../catalog/data/dto/response/talle_response_dto.dart';
import '../../domain/entities/size_entity.dart';

class SizeMapper {
  static SizeEntity toEntity(TalleResponseDto dto) {
    return SizeEntity(dto.rawJson);
  }
}
