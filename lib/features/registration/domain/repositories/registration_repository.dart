import '../entities/discount_result.dart';

abstract class RegistrationRepository {
  Future<DiscountResult> validateDiscount({
    required String insId,
    required String code,
  });
}
