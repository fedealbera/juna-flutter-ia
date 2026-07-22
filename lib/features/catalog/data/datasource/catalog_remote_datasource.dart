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
  Future<List<CircuitoResponseDto>> getCircuitos() async {
    final response = await _apiService.getCircuitos() as Map<String, dynamic>;
    final list = response['categorias'] as List<dynamic>? ?? [];
    return list.map((item) => CircuitoResponseDto.fromJson(item as Map<String, dynamic>)).toList();
  }

  @override
  Future<List<CategoriaResponseDto>> getCategorias(String circuitoId, String dni) async {
    final response = await _apiService.getCategorias(circuitoId, dni) as Map<String, dynamic>;
    final list = response['categorias'] as List<dynamic>? ?? [];
    return list.map((item) => CategoriaResponseDto.fromJson(item as Map<String, dynamic>)).toList();
  }

  @override
  Future<List<TalleResponseDto>> getTalles() async {
    final response = await _apiService.getTalles() as Map<String, dynamic>;
    final list = response['categorias'] as List<dynamic>? ?? [];
    return list.map((item) => TalleResponseDto.fromJson(item as Map<String, dynamic>)).toList();
  }
}
