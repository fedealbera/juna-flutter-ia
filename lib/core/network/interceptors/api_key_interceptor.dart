import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../env/env_config.dart';
import '../../theme/tenant_manager.dart';

@lazySingleton
class ApiKeyInterceptor extends Interceptor {
  final EnvConfig _envConfig;
  final TenantManager _tenantManager;

  ApiKeyInterceptor(this._envConfig, this._tenantManager);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final activeTenant = _tenantManager.value;
    final String activeApiKey = activeTenant.apiKeyFor(_envConfig.environment) ?? _envConfig.apiKey;
    options.headers['X-API-Key'] = activeApiKey;
    super.onRequest(options, handler);
  }
}
