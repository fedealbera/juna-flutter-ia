import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/network/dio_client.dart';
import '../dto/response/event_settings_response_dto.dart';

part 'events_api_service.g.dart';

@RestApi()
abstract class EventsApiService {
  factory EventsApiService(Dio dio, {String baseUrl}) = _EventsApiService;

  @GET('/api/eventos/{eventoId}/settings')
  Future<EventSettingsResponseDto> getEventSettings(
    @Path('eventoId') String eventoId,
    @Query('idOrg') String idOrg,
  );
}

@module
abstract class EventsApiModule {
  @lazySingleton
  EventsApiService provideEventsApiService(DioClient dioClient) {
    return EventsApiService(dioClient.dio);
  }
}
