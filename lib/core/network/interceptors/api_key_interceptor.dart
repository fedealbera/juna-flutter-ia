import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../env/env_config.dart';

@lazySingleton
class ApiKeyInterceptor extends Interceptor {
  final EnvConfig _envConfig;

  ApiKeyInterceptor(this._envConfig);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['X-API-Key'] = _envConfig.apiKey;
    super.onRequest(options, handler);
  }
}
