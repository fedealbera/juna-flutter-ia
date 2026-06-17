import '../entities/map_settings.dart';

abstract class MapsRepository {
  Future<MapSettings> getMapSettings();
}
