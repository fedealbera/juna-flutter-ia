import '../../domain/entities/city.dart';
import '../../domain/entities/country.dart';
import '../../domain/entities/province.dart';

abstract class GeographyRepository {
  Future<List<Country>> getCountries();
  Future<List<Province>> getProvincias(String paisId);
  Future<List<City>> getCiudades(String provinciaId);
}
