import '../../../catalog/data/dto/response/circuito_response_dto.dart';
import '../../domain/entities/circuit.dart';

class CircuitMapper {
  static Circuit toEntity(CircuitoResponseDto dto) {
    return Circuit(dto.rawJson);
  }
}
