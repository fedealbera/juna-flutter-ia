import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../env/env_config.dart';
import 'interceptors/api_key_interceptor.dart';
import 'interceptors/error_interceptor.dart';
import 'interceptors/logger_interceptor.dart';
import 'interceptors/retry_interceptor.dart';

import '../theme/tenant_manager.dart';

class BaseUrlInterceptor extends Interceptor {
  final TenantManager _tenantManager;
  final EnvConfig _envConfig;

  BaseUrlInterceptor(this._tenantManager, this._envConfig);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final activeTenant = _tenantManager.value;
    final String customBaseUrl = activeTenant.baseUrlFor(_envConfig.environment) ?? _envConfig.baseUrl;
    
    final uri = Uri.parse(customBaseUrl);
    final String basePath = uri.path.endsWith('/') 
        ? uri.path.substring(0, uri.path.length - 1) 
        : uri.path;

    if (basePath.isNotEmpty && basePath != '/') {
      if (options.path.startsWith('/')) {
        options.baseUrl = '${uri.scheme}://${uri.authority}';
        
        // Strip duplicate '/api' segment if it is already present in the basePath
        String resolvedPath = options.path;
        if (basePath.endsWith('/api') && options.path.startsWith('/api/')) {
          resolvedPath = options.path.substring(4); // removes '/api' keeping leading slash
        }
        
        options.path = '$basePath$resolvedPath';
      } else {
        options.baseUrl = customBaseUrl;
      }
    } else {
      options.baseUrl = customBaseUrl;
    }
    
    super.onRequest(options, handler);
  }
}

@lazySingleton
class DioClient {
  final Dio dio;

  DioClient(
    EnvConfig envConfig,
    ApiKeyInterceptor apiKeyInterceptor,
    LoggerInterceptor loggerInterceptor,
    RetryInterceptor retryInterceptor,
    ErrorInterceptor errorInterceptor,
    TenantManager tenantManager,
  ) : dio = Dio() {
    dio
      ..options.baseUrl = tenantManager.value.baseUrlFor(envConfig.environment) ?? envConfig.baseUrl
      ..options.connectTimeout = const Duration(seconds: 15)
      ..options.receiveTimeout = const Duration(seconds: 15)
      ..options.sendTimeout = const Duration(seconds: 15)
      ..options.headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      }
      ..interceptors.addAll([
        BaseUrlInterceptor(tenantManager, envConfig),
        apiKeyInterceptor,
        retryInterceptor,
        errorInterceptor,
        loggerInterceptor,
      ]);

    tenantManager.addListener(() {
      dio.options.baseUrl = tenantManager.value.baseUrlFor(envConfig.environment) ?? envConfig.baseUrl;
    });
  }
}
