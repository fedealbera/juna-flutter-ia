import 'package:injectable/injectable.dart';
import '../../features/tenant/data/api/tenant_api_service.dart';
import '../theme/tenant_config.dart';
import 'active_tenant_config.dart';

abstract class FirebaseConfigurationRepository {
  Future<TenantConfig> getConfiguration(int tenantId);
}

@LazySingleton(as: FirebaseConfigurationRepository)
class FirebaseConfigurationRepositoryImpl implements FirebaseConfigurationRepository {
  // ignore: unused_field
  final TenantApiService _apiService;

  FirebaseConfigurationRepositoryImpl(this._apiService);

  @override
  Future<TenantConfig> getConfiguration(int tenantId) async {
    // Return local default config directly, as backend config endpoint doesn't exist yet.
    return ActiveTenantConfig.get();
  }
}

