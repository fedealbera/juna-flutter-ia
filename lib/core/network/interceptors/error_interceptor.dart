import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../error/exceptions.dart';
import '../connectivity_dialog_service.dart';

@lazySingleton
class ErrorInterceptor extends Interceptor {
  final ConnectivityDialogService _connectivityDialogService;

  ErrorInterceptor(this._connectivityDialogService);

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    AppException exception;

    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:
        _connectivityDialogService.showNoInternetDialog();
        if (err.error is AppException) {
          exception = err.error as AppException;
        } else {
          exception = NetworkException(
            message: 'No hay conexión a internet en este momento. Por favor, prueba en unos minutos.',
            code: 'CONNECTION_TIMEOUT',
            statusCode: err.response?.statusCode,
          );
        }
        break;

      case DioExceptionType.badResponse:
        final statusCode = err.response?.statusCode;
        final data = err.response?.data;
        
        String message = 'An unexpected server error occurred.';
        String? code;
        Map<String, List<String>> validationErrors = {};

        if (data is Map) {
          message = data['message'] ?? message;
          code = data['code'];
          
          // Check for validation errors structure (e.g. { "errors": { "email": ["Invalid email"] } })
          if (data['errors'] is Map) {
            final rawErrors = data['errors'] as Map;
            rawErrors.forEach((key, val) {
              if (val is List) {
                validationErrors[key.toString()] = val.map((e) => e.toString()).toList();
              } else if (val is String) {
                validationErrors[key.toString()] = [val];
              }
            });
          }
        }

        if (statusCode == 400 || statusCode == 422) {
          exception = ValidationException(
            message: message,
            code: code ?? 'VALIDATION_ERROR',
            errors: validationErrors,
          );
        } else if (statusCode == 401 || statusCode == 403) {
          exception = NetworkException(
            message: message,
            code: code ?? 'UNAUTHORIZED',
            statusCode: statusCode,
          );
        } else if (statusCode == 404) {
          exception = NetworkException(
            message: message,
            code: code ?? 'NOT_FOUND',
            statusCode: statusCode,
          );
        } else {
          exception = ServerException(
            message: message,
            code: code ?? 'SERVER_ERROR',
          );
        }
        break;

      case DioExceptionType.cancel:
        exception = const UnknownException(
          message: 'Request was cancelled.',
          code: 'CANCELLED',
        );
        break;

      case DioExceptionType.badCertificate:
        exception = NetworkException(
          message: 'Secure connection failed (Bad Certificate).',
          code: 'BAD_CERTIFICATE',
          statusCode: err.response?.statusCode,
        );
        break;

      case DioExceptionType.unknown:
        exception = UnknownException(
          message: err.message ?? 'An unknown network error occurred.',
          code: 'UNKNOWN_NETWORK_ERROR',
        );
    }

    // We pass the mapped exception inside the DioException error field,
    // so that repositories can retrieve it easily.
    return handler.next(
      err.copyWith(
        error: exception,
      ),
    );
  }
}
