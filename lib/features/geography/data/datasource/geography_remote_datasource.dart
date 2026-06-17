import 'package:injectable/injectable.dart';
import '../api/geography_api_service.dart';
import '../dto/response/pais_response_dto.dart';
import '../dto/response/provincia_response_dto.dart';
import '../dto/response/ciudad_response_dto.dart';

abstract class GeographyRemoteDataSource {
  Future<List<PaisResponseDto>> getPaises();
  Future<List<ProvinciaResponseDto>> getProvincias(String paisId);
  Future<List<CiudadResponseDto>> getCiudades(String provinciaId);
}

@LazySingleton(as: GeographyRemoteDataSource)
class GeographyRemoteDataSourceImpl implements GeographyRemoteDataSource {
  final GeographyApiService _apiService;

  GeographyRemoteDataSourceImpl(this._apiService);

  @override
  Future<List<PaisResponseDto>> getPaises() {
    return _apiService.getPaises();
  }

  @override
  Future<List<ProvinciaResponseDto>> getProvincias(String paisId) {
    return _apiService.getProvincias(paisId);
  }

  @override
  Future<List<CiudadResponseDto>> getCiudades(String provinciaId) {
    return _apiService.getCiudades(provinciaId);
  }
}
