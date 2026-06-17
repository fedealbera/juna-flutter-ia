import 'package:injectable/injectable.dart';
import '../api/events_api_service.dart';
import '../api/settings_api_service.dart';
import '../api/tracks_api_service.dart';
import '../dto/response/event_content_response_dto.dart';
import '../dto/response/event_settings_response_dto.dart';
import '../dto/response/track_response_dto.dart';

abstract class SettingsRemoteDataSource {
  Future<EventSettingsResponseDto> getEventSettings(String eventoId, String idOrg);
  Future<List<TrackResponseDto>> getEventTracks(String eventoId);
  Future<EventContentResponseDto> getEventContent(String eventoId, String idOrg);
}

@LazySingleton(as: SettingsRemoteDataSource)
class SettingsRemoteDataSourceImpl implements SettingsRemoteDataSource {
  final EventsApiService _eventsApiService;
  final TracksApiService _tracksApiService;
  final SettingsApiService _settingsApiService;

  SettingsRemoteDataSourceImpl(
    this._eventsApiService,
    this._tracksApiService,
    this._settingsApiService,
  );

  @override
  Future<EventSettingsResponseDto> getEventSettings(String eventoId, String idOrg) {
    return _eventsApiService.getEventSettings(eventoId, idOrg);
  }

  @override
  Future<List<TrackResponseDto>> getEventTracks(String eventoId) {
    return _tracksApiService.getEventTracks(eventoId);
  }

  @override
  Future<EventContentResponseDto> getEventContent(String eventoId, String idOrg) {
    return _settingsApiService.getEventContent(eventoId, idOrg);
  }
}
