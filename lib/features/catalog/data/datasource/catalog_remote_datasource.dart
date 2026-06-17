import 'package:injectable/injectable.dart';
import '../api/catalog_api_service.dart';
import '../dto/response/circuito_response_dto.dart';
import '../dto/response/categoria_response_dto.dart';
import '../dto/response/talle_response_dto.dart';

abstract class CatalogRemoteDataSource {
  Future<List<CircuitoResponseDto>> getCircuitos();
  Future<List<CategoriaResponseDto>> getCategorias(String circuitoId, String dni);
  Future<List<TalleResponseDto>> getTalles();
}

@LazySingleton(as: CatalogRemoteDataSource)
class CatalogRemoteDataSourceImpl implements CatalogRemoteDataSource {
  final CatalogApiService _apiService;

  CatalogRemoteDataSourceImpl(this._apiService);

  @override
  Future<List<CircuitoResponseDto>> getCircuitos() {
    return _apiService.getCircuitos();
  }

  @override
  Future<List<CategoriaResponseDto>> getCategorias(String circuitoId, String dni) {
    return _apiService.getCategorias(circuitoId, dni);
  }

  @override
  Future<List<TalleResponseDto>> getTalles() {
    return _apiService.getTalles();
  }
}
