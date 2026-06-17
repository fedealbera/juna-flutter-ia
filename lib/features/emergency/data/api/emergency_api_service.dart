import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/network/dio_client.dart';
import '../dto/request/send_sos_request_dto.dart';
import '../dto/response/send_sos_response_dto.dart';

part 'emergency_api_service.g.dart';

@RestApi()
abstract class EmergencyApiService {
  factory EmergencyApiService(Dio dio, {String baseUrl}) = _EmergencyApiService;

  @POST('/api/participantes/sos')
  Future<SendSosResponseDto> sendSos(
    @Body() SendSosRequestDto body,
  );
}

@module
abstract class EmergencyApiModule {
  @lazySingleton
  EmergencyApiService provideEmergencyApiService(DioClient dioClient) {
    return EmergencyApiService(dioClient.dio);
  }
}
