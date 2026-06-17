import 'package:injectable/injectable.dart';
import '../entities/city.dart';
import '../repositories/geography_repository.dart';

@lazySingleton
class GetCities {
  final GeographyRepository _repository;

  GetCities(this._repository);

  Future<List<City>> call({required String stateId}) {
    return _repository.getCiudades(stateId);
  }
}
