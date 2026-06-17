import '../dto/response/validate_discount_response_dto.dart';
import '../../domain/entities/discount_result.dart';

class RegistrationMapper {
  static DiscountResult toEntity(ValidateDiscountResponseDto dto) {
    return DiscountResult(dto.rawJson);
  }
}
