/// Custom exceptions for the SastaTaxi app
class AppException implements Exception {
  final String message;
  final String? code;
  
  AppException(this.message, [this.code]);
  
  @override
  String toString() => message;
}

class NetworkException extends AppException {
  NetworkException([String message = 'Network error occurred'])
      : super(message, 'NETWORK_ERROR');
}

class ServerException extends AppException {
  ServerException([String message = 'Server error occurred'])
      : super(message, 'SERVER_ERROR');
}

class CacheException extends AppException {
  CacheException([String message = 'Cache error occurred'])
      : super(message, 'CACHE_ERROR');
}

class ValidationException extends AppException {
  ValidationException([String message = 'Validation failed'])
      : super(message, 'VALIDATION_ERROR');
}

class LocationException extends AppException {
  LocationException([String message = 'Location error occurred'])
      : super(message, 'LOCATION_ERROR');
}
