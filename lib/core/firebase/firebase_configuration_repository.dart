import 'package:injectable/injectable.dart';
import '../../features/tenant/data/api/tenant_api_service.dart';
import '../theme/tenant_config.dart';
import 'tenant_firebase_config.dart';

abstract class FirebaseConfigurationRepository {
  Future<TenantConfig> getConfiguration(int tenantId);
}

@LazySingleton(as: FirebaseConfigurationRepository)
class FirebaseConfigurationRepositoryImpl implements FirebaseConfigurationRepository {
  final TenantApiService _apiService;

  FirebaseConfigurationRepositoryImpl(this._apiService);

  @override
  Future<TenantConfig> getConfiguration(int tenantId) async {
    try {
      final response = await _apiService.getTenantConfig(tenantId);
      if (response is Map<String, dynamic>) {
        return TenantConfig.fromJson(response);
      }
      throw Exception('Invalid config response format');
    } catch (e) {
      // Automatic fallback if backend endpoint fails or response is incomplete/null/error
      return DefaultTenantConfig.ddln();
    }
  }
}
