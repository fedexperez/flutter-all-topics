/// Exception thrown when there's an issue with the server.
class ServerException implements Exception {
  final String? message;
  final int errorCode;

  ServerException({this.message, required this.errorCode});
}

/// Exception thrown when there's an issue with the local storage.
class CacheException implements Exception {
  final String? message;

  CacheException({this.message});
}

/// Exception thrown when there's an issue with the local secure storage.
class SecureStorageException implements Exception {
  final String? message;

  SecureStorageException({this.message});
}
