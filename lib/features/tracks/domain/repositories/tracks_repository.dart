import '../../domain/entities/track.dart';

abstract class TracksRepository {
  Future<List<Track>> getTracks(String eventoId);
}
