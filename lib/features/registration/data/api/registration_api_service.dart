import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/network/dio_client.dart';
import '../dto/request/validate_discount_request_dto.dart';
import '../dto/response/validate_discount_response_dto.dart';

part 'registration_api_service.g.dart';

@RestApi()
abstract class RegistrationApiService {
  factory RegistrationApiService(Dio dio, {String baseUrl}) = _RegistrationApiService;

  @POST('/api/inscripciones/{insId}/descuento')
  Future<ValidateDiscountResponseDto> validateDiscount(
    @Path('insId') String insId,
    @Body() ValidateDiscountRequestDto body,
  );
}

@module
abstract class RegistrationApiModule {
  @lazySingleton
  RegistrationApiService provideRegistrationApiService(DioClient dioClient) {
    return RegistrationApiService(dioClient.dio);
  }
}
