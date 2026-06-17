import 'package:injectable/injectable.dart';
import '../entities/country.dart';
import '../repositories/geography_repository.dart';

@lazySingleton
class GetCountries {
  final GeographyRepository _repository;

  GetCountries(this._repository);

  Future<List<Country>> call() {
    return _repository.getCountries();
  }
}
