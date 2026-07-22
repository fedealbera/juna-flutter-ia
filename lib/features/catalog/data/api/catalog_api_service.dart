import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/network/dio_client.dart';

part 'catalog_api_service.g.dart';

@RestApi()
abstract class CatalogApiService {
  factory CatalogApiService(Dio dio, {String baseUrl}) = _CatalogApiService;

  @GET('/api/circuitos')
  Future<dynamic> getCircuitos();

  @GET('/api/circuitos/{circuitoId}/categorias')
  Future<dynamic> getCategorias(
    @Path('circuitoId') String circuitoId,
    @Query('dni') String dni,
  );

  @GET('/api/talles')
  Future<dynamic> getTalles();
}

@module
abstract class CatalogApiModule {
  @lazySingleton
  CatalogApiService provideCatalogApiService(DioClient dioClient) {
    return CatalogApiService(dioClient.dio);
  }
}
