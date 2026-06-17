import 'package:injectable/injectable.dart';
import '../entities/map_settings.dart';
import '../repositories/maps_repository.dart';

@lazySingleton
class GetMapSettings {
  final MapsRepository _repository;

  GetMapSettings(this._repository);

  Future<MapSettings> call() {
    return _repository.getMapSettings();
  }
}
