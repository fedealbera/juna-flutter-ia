import 'package:injectable/injectable.dart';
import '../../../geography/data/datasource/geography_remote_datasource.dart';
import '../../domain/entities/city.dart';
import '../../domain/entities/country.dart';
import '../../domain/entities/province.dart';
import '../../domain/repositories/geography_repository.dart';
import '../mappers/geography_mappers.dart';

@LazySingleton(as: GeographyRepository)
class GeographyRepositoryImpl implements GeographyRepository {
  final GeographyRemoteDataSource _geographyRemoteDataSource;

  GeographyRepositoryImpl(this._geographyRemoteDataSource);

  @override
  Future<List<Country>> getCountries() async {
    final dtos = await _geographyRemoteDataSource.getPaises();
    return dtos.map(GeographyMappers.toCountryEntity).toList();
  }

  @override
  Future<List<Province>> getProvincias(String paisId) async {
    final dtos = await _geographyRemoteDataSource.getProvincias(paisId);
    return dtos.map(GeographyMappers.toProvinceEntity).toList();
  }

  @override
  Future<List<City>> getCiudades(String provinciaId) async {
    final dtos = await _geographyRemoteDataSource.getCiudades(provinciaId);
    return dtos.map(GeographyMappers.toCityEntity).toList();
  }
}
