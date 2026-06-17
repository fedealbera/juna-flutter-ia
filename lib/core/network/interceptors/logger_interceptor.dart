import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@lazySingleton
class LoggerInterceptor extends Interceptor {
  final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 5,
      lineLength: 90,
      colors: true,
      printEmojis: true,
    ),
  );

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _logger.i('🌐 Request: [${options.method}] -> ${options.uri}\nHeaders: ${options.headers}\nData: ${options.data}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _logger.i('✅ Response: [${response.statusCode}] <- ${response.requestOptions.uri}\nData: ${response.data}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    _logger.e('❌ Error: [${err.response?.statusCode}] <- ${err.requestOptions.uri}\nMessage: ${err.message}\nData: ${err.response?.data}');
    super.onError(err, handler);
  }
}
