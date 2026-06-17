import 'dart:io';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@lazySingleton
class RetryInterceptor extends Interceptor {
  final Logger _logger = Logger();
  final int maxRetries = 3;
  final Duration retryDelay = const Duration(seconds: 2);

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    final requestOptions = err.requestOptions;
    
    // Check if we should retry
    final extra = requestOptions.extra;
    final retryCount = (extra['retry_count'] as int?) ?? 0;

    if (_shouldRetry(err) && retryCount < maxRetries) {
      extra['retry_count'] = retryCount + 1;
      _logger.w('Retry attempt ${retryCount + 1}/$maxRetries for: ${requestOptions.uri}');
      
      // Delay before retrying
      await Future.delayed(retryDelay * (retryCount + 1)); // Linear/exponential delay backoff

      try {
        // We recreate a temporary Dio instance or use requestOptions to resolve a new request
        final dio = Dio();
        final response = await dio.fetch(requestOptions);
        return handler.resolve(response);
      } catch (e) {
        // If retry fails, forward the error
        if (e is DioException) {
          return super.onError(e, handler);
        }
        return handler.reject(
          DioException(
            requestOptions: requestOptions,
            error: e,
            type: DioExceptionType.unknown,
          ),
        );
      }
    }

    super.onError(err, handler);
  }

  bool _shouldRetry(DioException err) {
    // Retry on connection timeouts, socket/network issues or 503/504 errors
    if (err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.sendTimeout ||
        err.type == DioExceptionType.receiveTimeout) {
      return true;
    }

    if (err.error is SocketException) {
      return true;
    }

    final statusCode = err.response?.statusCode;
    if (statusCode != null && (statusCode == 503 || statusCode == 504)) {
      return true;
    }

    return false;
  }
}
