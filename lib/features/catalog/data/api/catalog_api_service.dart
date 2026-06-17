import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/network/dio_client.dart';
import '../dto/response/circuito_response_dto.dart';
import '../dto/response/categoria_response_dto.dart';
import '../dto/response/talle_response_dto.dart';

part 'catalog_api_service.g.dart';

@RestApi()
abstract class CatalogApiService {
  factory CatalogApiService(Dio dio, {String baseUrl}) = _CatalogApiService;

  @GET('/api/circuitos')
  Future<List<CircuitoResponseDto>> getCircuitos();

  @GET('/api/circuitos/{circuitoId}/categorias')
  Future<List<CategoriaResponseDto>> getCategorias(
    @Path('circuitoId') String circuitoId,
    @Query('dni') String dni,
  );

  @GET('/api/talles')
  Future<List<TalleResponseDto>> getTalles();
}

@module
abstract class CatalogApiModule {
  @lazySingleton
  CatalogApiService provideCatalogApiService(DioClient dioClient) {
    return CatalogApiService(dioClient.dio);
  }
}
