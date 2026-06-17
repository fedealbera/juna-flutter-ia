import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/network/dio_client.dart';
import '../dto/response/event_content_response_dto.dart';

part 'settings_api_service.g.dart';

@RestApi()
abstract class SettingsApiService {
  factory SettingsApiService(Dio dio, {String baseUrl}) = _SettingsApiService;

  @GET('/api/eventos/{eventoId}/contenido')
  Future<EventContentResponseDto> getEventContent(
    @Path('eventoId') String eventoId,
    @Query('idOrg') String idOrg,
  );
}

@module
abstract class SettingsApiModule {
  @lazySingleton
  SettingsApiService provideSettingsApiService(DioClient dioClient) {
    return SettingsApiService(dioClient.dio);
  }
}
