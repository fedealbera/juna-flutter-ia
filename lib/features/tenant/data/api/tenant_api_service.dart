import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/network/dio_client.dart';

part 'tenant_api_service.g.dart';

@RestApi()
abstract class TenantApiService {
  factory TenantApiService(Dio dio, {String baseUrl}) = _TenantApiService;

  @GET('/api/tenants/{id}/config')
  Future<dynamic> getTenantConfig(
    @Path('id') int tenantId,
  );
}

@module
abstract class TenantApiModule {
  @lazySingleton
  TenantApiService provideTenantApiService(DioClient dioClient) {
    return TenantApiService(dioClient.dio);
  }
}
