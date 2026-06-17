import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/network/dio_client.dart';
import '../dto/response/track_response_dto.dart';

part 'tracks_api_service.g.dart';

@RestApi()
abstract class TracksApiService {
  factory TracksApiService(Dio dio, {String baseUrl}) = _TracksApiService;

  @GET('/api/eventos/{eventoId}/tracks')
  Future<List<TrackResponseDto>> getEventTracks(
    @Path('eventoId') String eventoId,
  );
}

@module
abstract class TracksApiModule {
  @lazySingleton
  TracksApiService provideTracksApiService(DioClient dioClient) {
    return TracksApiService(dioClient.dio);
  }
}
