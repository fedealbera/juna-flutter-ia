import 'package:injectable/injectable.dart';
import '../api/registration_api_service.dart';
import '../dto/request/validate_discount_request_dto.dart';
import '../dto/response/validate_discount_response_dto.dart';

abstract class RegistrationRemoteDataSource {
  Future<ValidateDiscountResponseDto> validateDiscount(
    String insId,
    ValidateDiscountRequestDto body,
  );
}

@LazySingleton(as: RegistrationRemoteDataSource)
class RegistrationRemoteDataSourceImpl implements RegistrationRemoteDataSource {
  final RegistrationApiService _apiService;

  RegistrationRemoteDataSourceImpl(this._apiService);

  @override
  Future<ValidateDiscountResponseDto> validateDiscount(
    String insId,
    ValidateDiscountRequestDto body,
  ) {
    return _apiService.validateDiscount(insId, body);
  }
}
