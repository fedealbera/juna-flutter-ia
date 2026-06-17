import 'package:equatable/equatable.dart';

sealed class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  final String? code;
  
  const ServerFailure(super.message, [this.code]);

  @override
  List<Object?> get props => [message, code];
}

class NetworkFailure extends Failure {
  final int? statusCode;
  
  const NetworkFailure(super.message, [this.statusCode]);

  @override
  List<Object?> get props => [message, statusCode];
}

class CacheFailure extends Failure {
  const CacheFailure(super.message);
}

class ValidationFailure extends Failure {
  final Map<String, List<String>> errors;

  const ValidationFailure(super.message, [this.errors = const {}]);

  @override
  List<Object?> get props => [message, errors];
}

class UnknownFailure extends Failure {
  const UnknownFailure(super.message);
}
