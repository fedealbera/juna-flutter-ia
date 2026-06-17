import 'package:injectable/injectable.dart';
import '../../domain/entities/map_settings.dart';
import '../../domain/repositories/maps_repository.dart';

@LazySingleton(as: MapsRepository)
class MapsRepositoryImpl implements MapsRepository {
  @override
  Future<MapSettings> getMapSettings() async {
    // Returns default mock values as it's a placeholder feature
    return const MapSettings(
      defaultLatitude: -34.6037,
      defaultLongitude: -58.3816,
      defaultZoom: 12.0,
    );
  }
}
