import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../env/env_config.dart';
import 'interceptors/api_key_interceptor.dart';
import 'interceptors/error_interceptor.dart';
import 'interceptors/logger_interceptor.dart';
import 'interceptors/retry_interceptor.dart';

@lazySingleton
class DioClient {
  final Dio dio;

  DioClient(
    EnvConfig envConfig,
    ApiKeyInterceptor apiKeyInterceptor,
    LoggerInterceptor loggerInterceptor,
    RetryInterceptor retryInterceptor,
    ErrorInterceptor errorInterceptor,
  ) : dio = Dio() {
    dio
      ..options.baseUrl = envConfig.baseUrl
      ..options.connectTimeout = const Duration(seconds: 15)
      ..options.receiveTimeout = const Duration(seconds: 15)
      ..options.sendTimeout = const Duration(seconds: 15)
      ..options.headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      }
      ..interceptors.addAll([
        apiKeyInterceptor,
        retryInterceptor,
        errorInterceptor,
        loggerInterceptor,
      ]);
  }
}
