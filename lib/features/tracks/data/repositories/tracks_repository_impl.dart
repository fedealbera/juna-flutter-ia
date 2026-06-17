import 'package:injectable/injectable.dart';
import '../../../settings/data/datasource/settings_remote_datasource.dart';
import '../../domain/entities/track.dart';
import '../../domain/repositories/tracks_repository.dart';
import '../mappers/track_mapper.dart';

@LazySingleton(as: TracksRepository)
class TracksRepositoryImpl implements TracksRepository {
  final SettingsRemoteDataSource _settingsRemoteDataSource;

  TracksRepositoryImpl(this._settingsRemoteDataSource);

  @override
  Future<List<Track>> getTracks(String eventoId) async {
    final dtos = await _settingsRemoteDataSource.getEventTracks(eventoId);
    return dtos.map(TrackMapper.toEntity).toList();
  }
}
