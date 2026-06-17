sealed class AppException implements Exception {
  final String message;
  final String? code;

  const AppException(this.message, [this.code]);

  @override
  String toString() => '$runtimeType: [$code] $message';
}

class NetworkException extends AppException {
  final int? statusCode;

  const NetworkException({
    required String message,
    String? code,
    this.statusCode,
  }) : super(message, code);
}

class ValidationException extends AppException {
  final Map<String, List<String>> errors;

  const ValidationException({
    required String message,
    String? code,
    this.errors = const {},
  }) : super(message, code);
}

class CacheException extends AppException {
  const CacheException({
    required String message,
    String? code,
  }) : super(message, code);
}

class ServerException extends AppException {
  const ServerException({
    required String message,
    String? code,
  }) : super(message, code);
}

class UnknownException extends AppException {
  const UnknownException({
    required String message,
    String? code,
  }) : super(message, code);
}
