import 'package:injectable/injectable.dart';
import '../entities/discount_result.dart';
import '../repositories/registration_repository.dart';

@lazySingleton
class ValidateDiscount {
  final RegistrationRepository _repository;

  ValidateDiscount(this._repository);

  Future<DiscountResult> call({
    required String insId,
    required String code,
  }) {
    return _repository.validateDiscount(insId: insId, code: code);
  }
}
