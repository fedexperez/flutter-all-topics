import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_all_topics/core/http/dio_client_mix.dart';

class MockDio extends Mock implements Dio {}

void main() {
  group('DioClientMix', () {
    late MockDio mockDio;
    late DioClientMix dioClientMix;

    setUp(() {
      mockDio = MockDio();
      dioClientMix = DioClientMix(client: mockDio);
    });

    test('should call get method with correct parameters', () async {
      // Arrange
      const path = '/test';
      final response = Response<String>(
        requestOptions: RequestOptions(
          path: path,
        ),
      );
      when(() => mockDio.get<String>(
            any(),
            data: any(named: 'data'),
            queryParameters: any(named: 'queryParameters'),
            options: any(named: 'options'),
            cancelToken: any(named: 'cancelToken'),
            onReceiveProgress: any(named: 'onReceiveProgress'),
          )).thenAnswer((_) async => response);

      // Act
      final result = await dioClientMix.get<String>(
        path,
        data: null,
        queryParameters: null,
        options: null,
        cancelToken: null,
        onReceiveProgress: null,
      );

      // Assert
      verify(() => mockDio.get<String>(
            path,
            data: null,
            queryParameters: null,
            options: null,
            cancelToken: null,
            onReceiveProgress: null,
          ));
      expect(result, response);
    });

    test('should call post method with correct parameters', () async {
      // Arrange
      const path = '/test';
      final response = Response<String>(
        requestOptions: RequestOptions(
          path: path,
        ),
      );
      when(() => mockDio.post<String>(
            any(),
            data: any(named: 'data'),
            queryParameters: any(named: 'queryParameters'),
            options: any(named: 'options'),
            cancelToken: any(named: 'cancelToken'),
            onReceiveProgress: any(named: 'onReceiveProgress'),
          )).thenAnswer((_) async => response);

      // Act
      final result = await dioClientMix.post<String>(
        path,
        data: null,
        queryParameters: null,
        options: null,
        cancelToken: null,
        onReceiveProgress: null,
      );

      // Assert
      verify(() => mockDio.post<String>(
            path,
            data: null,
            queryParameters: null,
            options: null,
            cancelToken: null,
            onReceiveProgress: null,
          ));
      expect(result, response);
    });

    test('should call delete method with correct parameters', () async {
      // Arrange
      const path = '/test';
      final response = Response<String>(
        requestOptions: RequestOptions(
          path: path,
        ),
      );
      when(() => mockDio.delete<String>(
            any(),
            data: any(named: 'data'),
            queryParameters: any(named: 'queryParameters'),
            options: any(named: 'options'),
            cancelToken: any(named: 'cancelToken'),
          )).thenAnswer((_) async => response);

      // Act
      final result = await dioClientMix.delete<String>(
        path,
        data: null,
        queryParameters: null,
        options: null,
        cancelToken: null,
      );

      // Assert
      verify(() => mockDio.delete<String>(
            path,
            data: null,
            queryParameters: null,
            options: null,
            cancelToken: null,
          ));
      expect(result, response);
    });

    test('should call put method with correct parameters', () async {
      // Arrange
      const path = '/test';
      final response = Response<String>(
        requestOptions: RequestOptions(
          path: path,
        ),
      );
      when(() => mockDio.put<String>(
            any(),
            data: any(named: 'data'),
            queryParameters: any(named: 'queryParameters'),
            options: any(named: 'options'),
            cancelToken: any(named: 'cancelToken'),
            onReceiveProgress: any(named: 'onReceiveProgress'),
          )).thenAnswer((_) async => response);

      // Act
      final result = await dioClientMix.put<String>(
        path,
        data: null,
        queryParameters: null,
        options: null,
        cancelToken: null,
        onReceiveProgress: null,
      );

      // Assert
      verify(() => mockDio.put<String>(
            path,
            data: null,
            queryParameters: null,
            options: null,
            cancelToken: null,
            onReceiveProgress: null,
          ));
      expect(result, response);
    });
  });
}
