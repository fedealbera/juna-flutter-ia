import 'package:injectable/injectable.dart';
import '../entities/track.dart';
import '../repositories/tracks_repository.dart';

@lazySingleton
class GetTracks {
  final TracksRepository _repository;

  GetTracks(this._repository);

  Future<List<Track>> call({required String eventId}) {
    return _repository.getTracks(eventId);
  }
}
