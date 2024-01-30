import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_all_topics/core/http/dio_client_mix.dart';
import 'package:flutter_all_topics/core/http/custom_http_client.dart';

class MockDioClientMix extends Mock implements DioClientMix {}

void main() {
  group('CustomHttpClientImpl', () {
    late MockDioClientMix mockDioClientMix;
    late CustomHttpClient customHttpClient;

    setUp(() {
      mockDioClientMix = MockDioClientMix();
      customHttpClient = CustomHttpClientImpl(clientMix: mockDioClientMix);
    });

    test('should call get method with correct parameters', () async {
      // Arrange
      const path = '/test';
      final requestOptions = RequestOptions(path: path);
      final response =
          Response<dynamic>(data: 'Test Data', requestOptions: requestOptions);

      when(() => mockDioClientMix.get(
            path,
            data: any(named: 'data'),
            options: any(named: 'options'),
            queryParameters: any(named: 'queryParameters'),
          )).thenAnswer((_) async => response);

      // Act
      final result = await customHttpClient.get(path: path);

      // Assert
      verify(() => mockDioClientMix.get(
            path,
            data: any(named: 'data'),
            options: any(named: 'options'),
            queryParameters: any(named: 'queryParameters'),
          ));
      expect(result, response);
    });

    test('should call post method with correct parameters', () async {
      // Arrange
      const path = '/test';
      final requestOptions = RequestOptions(path: path);
      final response =
          Response<dynamic>(data: 'Test Data', requestOptions: requestOptions);

      when(() => mockDioClientMix.post(
            path,
            data: any(named: 'data'),
            options: any(named: 'options'),
            queryParameters: any(named: 'queryParameters'),
          )).thenAnswer((_) async => response);

      // Act
      final result = await customHttpClient.post(path: path);

      // Assert
      verify(() => mockDioClientMix.post(
            path,
            data: any(named: 'data'),
            options: any(named: 'options'),
            queryParameters: any(named: 'queryParameters'),
          ));
      expect(result, response);
    });

    test('should call delete method with correct parameters', () async {
      // Arrange
      const path = '/test';
      final requestOptions = RequestOptions(path: path);
      final response =
          Response<dynamic>(data: 'Test Data', requestOptions: requestOptions);

      when(() => mockDioClientMix.delete(
            path,
            data: any(named: 'data'),
            options: any(named: 'options'),
            queryParameters: any(named: 'queryParameters'),
          )).thenAnswer((_) async => response);

      // Act
      final result = await customHttpClient.delete(path: path);

      // Assert
      verify(() => mockDioClientMix.delete(
            path,
            data: any(named: 'data'),
            options: any(named: 'options'),
            queryParameters: any(named: 'queryParameters'),
          ));
      expect(result, response);
    });

    test('should call put method with correct parameters', () async {
      // Arrange
      const path = '/test';
      final requestOptions = RequestOptions(path: path);
      final response =
          Response<dynamic>(data: 'Test Data', requestOptions: requestOptions);

      when(() => mockDioClientMix.put(
            path,
            data: any(named: 'data'),
            options: any(named: 'options'),
            queryParameters: any(named: 'queryParameters'),
          )).thenAnswer((_) async => response);

      // Act
      final result = await customHttpClient.put(path: path);

      // Assert
      verify(() => mockDioClientMix.put(
            path,
            data: any(named: 'data'),
            options: any(named: 'options'),
            queryParameters: any(named: 'queryParameters'),
          ));
      expect(result, response);
    });

    test('should call request method with correct parameters', () async {
      // Arrange
      const path = '/test';
      final requestOptions = RequestOptions(path: path);
      final response =
          Response<dynamic>(data: 'Test Data', requestOptions: requestOptions);

      when(() => mockDioClientMix.request(
            path,
            cancelToken: any(named: 'cancelToken'),
            data: any(named: 'data'),
            onReceiveProgress: any(named: 'onReceiveProgress'),
            onSendProgress: any(named: 'onSendProgress'),
            queryParameters: any(named: 'queryParameters'),
            options: any(named: 'options'),
          )).thenAnswer((_) async => response);

      // Act
      final result =
          await customHttpClient.request(requestOptions: requestOptions);

      // Assert
      verify(() => mockDioClientMix.request(
            path,
            cancelToken: any(named: 'cancelToken'),
            data: any(named: 'data'),
            onReceiveProgress: any(named: 'onReceiveProgress'),
            onSendProgress: any(named: 'onSendProgress'),
            queryParameters: any(named: 'queryParameters'),
            options: any(named: 'options'),
          ));
      expect(result, response);
    });
  });
}
