import 'package:dio/dio.dart';
import 'package:flutter_all_topics/core/http/http_error_handler.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_all_topics/core/errors/exceptions.dart';

class MockDioException extends Mock implements DioException {}

class HttpErrorHandlerTestClass with HttpErrorHandler {}

void main() {
  late MockDioException mockDioException;
  late HttpErrorHandlerTestClass httpErrorHandlerTestClass;

  setUp(() {
    httpErrorHandlerTestClass = HttpErrorHandlerTestClass();
    mockDioException = MockDioException();
  });

  group('HttpErrorHandler', () {
    test('should throw ServerException for 400 status code', () {
      // Arrange
      when(() => mockDioException.response).thenReturn(Response(
        statusCode: 400,
        requestOptions: RequestOptions(),
      ));
      when(() => mockDioException.message).thenReturn('Bad Request');

      // Act & Assert
      expect(
        () => httpErrorHandlerTestClass.handleError(mockDioException),
        throwsA(isA<ServerException>()),
      );
    });

    test('should throw ServerException for 401 status code', () {
      // Arrange
      when(() => mockDioException.response).thenReturn(Response(
        statusCode: 401,
        requestOptions: RequestOptions(),
      ));
      when(() => mockDioException.message).thenReturn('Unauthorized');

      // Act & Assert
      expect(
        () => httpErrorHandlerTestClass.handleError(mockDioException),
        throwsA(isA<ServerException>()),
      );
    });

    test('should throw ServerException for 403 status code', () {
      // Arrange
      when(() => mockDioException.response).thenReturn(Response(
        statusCode: 403,
        requestOptions: RequestOptions(),
      ));
      when(() => mockDioException.message).thenReturn('Forbidden');

      // Act & Assert
      expect(
        () => httpErrorHandlerTestClass.handleError(mockDioException),
        throwsA(isA<ServerException>()),
      );
    });

    test('should throw ServerException for 404 status code', () {
      // Arrange
      when(() => mockDioException.response).thenReturn(Response(
        statusCode: 404,
        requestOptions: RequestOptions(),
      ));
      when(() => mockDioException.message).thenReturn('Not Found');

      // Act & Assert
      expect(
        () => httpErrorHandlerTestClass.handleError(mockDioException),
        throwsA(isA<ServerException>()),
      );
    });

    test('should throw ServerException for 405 status code', () {
      // Arrange
      when(() => mockDioException.response).thenReturn(Response(
        statusCode: 405,
        requestOptions: RequestOptions(),
      ));
      when(() => mockDioException.message).thenReturn('Method Not Allowed');

      // Act & Assert
      expect(
        () => httpErrorHandlerTestClass.handleError(mockDioException),
        throwsA(isA<ServerException>()),
      );
    });

    test('should throw ServerException for 429 status code', () {
      // Arrange
      when(() => mockDioException.response).thenReturn(Response(
        statusCode: 429,
        requestOptions: RequestOptions(),
      ));
      when(() => mockDioException.message).thenReturn('Too Many Requests');

      // Act & Assert
      expect(
        () => httpErrorHandlerTestClass.handleError(mockDioException),
        throwsA(isA<ServerException>()),
      );
    });

    test('should throw ServerException for 500 status code', () {
      // Arrange
      when(() => mockDioException.response).thenReturn(Response(
        statusCode: 500,
        requestOptions: RequestOptions(),
      ));
      when(() => mockDioException.message).thenReturn('Internal Server Error');

      // Act & Assert
      expect(
        () => httpErrorHandlerTestClass.handleError(mockDioException),
        throwsA(isA<ServerException>()),
      );
    });

    test('should throw ServerException for 502 status code', () {
      // Arrange
      when(() => mockDioException.response).thenReturn(Response(
        statusCode: 502,
        requestOptions: RequestOptions(),
      ));
      when(() => mockDioException.message).thenReturn('Bad Gateway');

      // Act & Assert
      expect(
        () => httpErrorHandlerTestClass.handleError(mockDioException),
        throwsA(isA<ServerException>()),
      );
    });

    test('should throw ServerException for 503 status code', () {
      // Arrange
      when(() => mockDioException.response).thenReturn(Response(
        statusCode: 503,
        requestOptions: RequestOptions(),
      ));
      when(() => mockDioException.message).thenReturn('Service Unavailable');

      // Act & Assert
      expect(
        () => httpErrorHandlerTestClass.handleError(mockDioException),
        throwsA(isA<ServerException>()),
      );
    });

    test('should throw ServerException for 504 status code', () {
      // Arrange
      when(() => mockDioException.response).thenReturn(Response(
        statusCode: 504,
        requestOptions: RequestOptions(),
      ));
      when(() => mockDioException.message).thenReturn('Gateway Timeout');

      // Act & Assert
      expect(
        () => httpErrorHandlerTestClass.handleError(mockDioException),
        throwsA(isA<ServerException>()),
      );
    });

    test('should throw ServerException for unknown status code', () {
      // Arrange
      when(() => mockDioException.response).thenReturn(Response(
        statusCode: 999,
        requestOptions: RequestOptions(),
      ));
      when(() => mockDioException.message).thenReturn('Unknown Error');

      // Act & Assert
      expect(
        () => httpErrorHandlerTestClass.handleError(mockDioException),
        throwsA(isA<ServerException>()),
      );
    });
  });
}
