import 'package:equatable/equatable.dart';

/// Base class for failures in the application.
abstract class Failure extends Equatable {
  /// Additional properties related to the failure.
  final List<dynamic> properties;

  /// Constructs a [Failure] with optional [properties].
  const Failure({this.properties = const []});

  @override
  List<Object?> get props => [properties];
}

/// Represents a failure caused by a server-related issue.
class ServerFailure extends Failure {
  final String? message;
  final int errorCode;

  /// Creates a [ServerFailure] with the given [message] and [errorCode].
  const ServerFailure({
    this.message,
    required this.errorCode,
  });

  @override
  List<Object?> get props => [message, errorCode];
}

/// Represents a failure caused by cache.
class CacheFailure extends Failure {}

/// Represents a failure caused by the secure storage.
class SecureStorageFailure extends Failure {}

/// Represents a failure caused by an undocumented issue.
class UndocumentedFailure extends Failure {
  final String? message;

  const UndocumentedFailure({this.message});
}
