import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/network/dio_client.dart';
import '../dto/response/pais_response_dto.dart';
import '../dto/response/provincia_response_dto.dart';
import '../dto/response/ciudad_response_dto.dart';

part 'geography_api_service.g.dart';

@RestApi()
abstract class GeographyApiService {
  factory GeographyApiService(Dio dio, {String baseUrl}) = _GeographyApiService;

  @GET('/api/paises')
  Future<List<PaisResponseDto>> getPaises();

  @GET('/api/paises/{paisId}/provincias')
  Future<List<ProvinciaResponseDto>> getProvincias(
    @Path('paisId') String paisId,
  );

  @GET('/api/provincias/{provinciaId}/ciudades')
  Future<List<CiudadResponseDto>> getCiudades(
    @Path('provinciaId') String provinciaId,
  );
}

@module
abstract class GeographyApiModule {
  @lazySingleton
  GeographyApiService provideGeographyApiService(DioClient dioClient) {
    return GeographyApiService(dioClient.dio);
  }
}
