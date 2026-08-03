import 'package:equatable/equatable.dart';

/// Base class representing all failures in the application.
abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object?> get props => [message];
}

/// Failure representing server-side or API response errors.
class ServerFailure extends Failure {
  final int? statusCode;
  final dynamic errorDetails;

  const ServerFailure({
    required String message,
    this.statusCode,
    this.errorDetails,
  }) : super(message);

  @override
  List<Object?> get props => [message, statusCode, errorDetails];
}

/// Failure representing connectivity, timeout, or DNS resolution issues.
class NetworkFailure extends Failure {
  const NetworkFailure({
    String message = 'No Internet connection. Please check your network and try again.',
  }) : super(message);
}

/// Failure representing unauthorized access, expired sessions, or sign-in credentials errors.
class AuthFailure extends Failure {
  const AuthFailure({
    required String message,
  }) : super(message);
}

/// Failure representing client-side form validation issues.
class ValidationFailure extends Failure {
  final Map<String, List<String>> errors;

  const ValidationFailure({
    required String message,
    required this.errors,
  }) : super(message);

  @override
  List<Object?> get props => [message, errors];
}

/// Failure representing local device storage (SQLite/SharedPreferences) read/write issues.
class CacheFailure extends Failure {
  const CacheFailure({
    required String message,
  }) : super(message);
}

/// Fallback failure for unexpected errors.
class UnknownFailure extends Failure {
  const UnknownFailure({
    String message = 'An unexpected error occurred. Please try again later.',
  }) : super(message);
}
