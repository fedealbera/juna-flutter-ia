import 'package:injectable/injectable.dart';
import '../api/catalog_api_service.dart';
import '../dto/response/circuito_response_dto.dart';
import '../dto/response/categoria_response_dto.dart';
import '../dto/response/talle_response_dto.dart';

abstract class CatalogRemoteDataSource {
  Future<List<CircuitoResponseDto>> getCircuitos();
  Future<List<CategoriaResponseDto>> getCategorias(String circuitoId, String dni);
  Future<List<TalleResponseDto>> getTalles();
  Future<List<Map<String, dynamic>>> getCentrosAcreditacion();
  Future<List<Map<String, dynamic>>> getMarcas(String? tipoCarrera);
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

  @override
  Future<List<Map<String, dynamic>>> getCentrosAcreditacion() async {
    final response = await _apiService.getCentrosAcreditacion();
    if (response is Map && response['centros_acreditacion'] is List) {
      return (response['centros_acreditacion'] as List)
          .map((item) => Map<String, dynamic>.from(item as Map))
          .toList();
    }
    return [];
  }

  @override
  Future<List<Map<String, dynamic>>> getMarcas(String? tipoCarrera) async {
    final response = await _apiService.getMarcas(tipoCarrera);
    if (response is Map && response['marcas'] is List) {
      return (response['marcas'] as List)
          .map((item) => Map<String, dynamic>.from(item as Map))
          .toList();
    }
    return [];
  }
}
