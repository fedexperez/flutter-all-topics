import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:flutter_all_topics/core/secure_storage/secure_storage.dart';
import 'package:flutter_all_topics/core/errors/exceptions.dart';

class MockFlutterSecureStorage extends Mock implements FlutterSecureStorage {}

void main() {
  late SecureStorage secureStorage;
  late MockFlutterSecureStorage mockFlutterSecureStorage;

  setUp(() {
    mockFlutterSecureStorage = MockFlutterSecureStorage();
    secureStorage = SecureStorageImpl(mockFlutterSecureStorage);
  });

  group('SecureStorageImpl', () {
    test('writes value', () async {
      // Arrange
      when(() => mockFlutterSecureStorage.write(
            key: any(named: 'key'),
            value: any(named: 'value'),
            iOptions: any(named: 'iOptions'),
            aOptions: any(named: 'aOptions'),
            lOptions: any(named: 'lOptions'),
            webOptions: any(named: 'webOptions'),
            mOptions: any(named: 'mOptions'),
            wOptions: any(named: 'wOptions'),
          )).thenAnswer((_) async {});

      // Act
      await secureStorage.write(key: 'someKey', value: 'someValue');

      // Assert
      verify(() => mockFlutterSecureStorage.write(
            key: 'someKey',
            value: 'someValue',
            iOptions: null,
            aOptions: null,
            lOptions: null,
            webOptions: null,
            mOptions: null,
            wOptions: null,
          ));
    });

    test('write throws SecureStorageException on error', () async {
      // Arrange
      when(() => mockFlutterSecureStorage.write(
            key: any(named: 'key'),
            value: any(named: 'value'),
            iOptions: any(named: 'iOptions'),
            aOptions: any(named: 'aOptions'),
            lOptions: any(named: 'lOptions'),
            webOptions: any(named: 'webOptions'),
            mOptions: any(named: 'mOptions'),
            wOptions: any(named: 'wOptions'),
          )).thenThrow(Exception());

      // Act & Assert
      expect(
        () => secureStorage.write(key: 'someKey', value: 'someValue'),
        throwsA(isA<SecureStorageException>()),
      );

      verify(() => mockFlutterSecureStorage.write(
            key: 'someKey',
            value: 'someValue',
            iOptions: null,
            aOptions: null,
            lOptions: null,
            webOptions: null,
            mOptions: null,
            wOptions: null,
          ));
    });

    test('reads value', () async {
      // Arrange
      when(() => mockFlutterSecureStorage.read(
            key: any(named: 'key'),
            iOptions: any(named: 'iOptions'),
            aOptions: any(named: 'aOptions'),
            lOptions: any(named: 'lOptions'),
            webOptions: any(named: 'webOptions'),
            mOptions: any(named: 'mOptions'),
            wOptions: any(named: 'wOptions'),
          )).thenAnswer((_) async => 'someValue');

      // Act
      final result = await secureStorage.read(key: 'someKey');

      // Assert
      expect(result, 'someValue');
      verify(() => mockFlutterSecureStorage.read(
            key: 'someKey',
            iOptions: null,
            aOptions: null,
            lOptions: null,
            webOptions: null,
            mOptions: null,
            wOptions: null,
          ));
    });

    test('read throws SecureStorageException on error', () async {
      // Arrange
      when(() => mockFlutterSecureStorage.read(
            key: any(named: 'key'),
            iOptions: any(named: 'iOptions'),
            aOptions: any(named: 'aOptions'),
            lOptions: any(named: 'lOptions'),
            webOptions: any(named: 'webOptions'),
            mOptions: any(named: 'mOptions'),
            wOptions: any(named: 'wOptions'),
          )).thenThrow(Exception());

      // Act & Assert
      expect(
        () => secureStorage.read(key: 'someKey'),
        throwsA(isA<SecureStorageException>()),
      );

      verify(() => mockFlutterSecureStorage.read(
            key: 'someKey',
            iOptions: null,
            aOptions: null,
            lOptions: null,
            webOptions: null,
            mOptions: null,
            wOptions: null,
          ));
    });

    test('deletes value', () async {
      // Arrange
      when(() => mockFlutterSecureStorage.delete(
            key: any(named: 'key'),
            iOptions: any(named: 'iOptions'),
            aOptions: any(named: 'aOptions'),
            lOptions: any(named: 'lOptions'),
            webOptions: any(named: 'webOptions'),
            mOptions: any(named: 'mOptions'),
            wOptions: any(named: 'wOptions'),
          )).thenAnswer((_) async {});

      // Act
      await secureStorage.delete(key: 'someKey');

      // Assert
      verify(() => mockFlutterSecureStorage.delete(
            key: 'someKey',
            iOptions: null,
            aOptions: null,
            lOptions: null,
            webOptions: null,
            mOptions: null,
            wOptions: null,
          ));
    });

    test('delete throws SecureStorageException on error', () async {
      // Arrange
      when(() => mockFlutterSecureStorage.delete(
            key: any(named: 'key'),
            iOptions: any(named: 'iOptions'),
            aOptions: any(named: 'aOptions'),
            lOptions: any(named: 'lOptions'),
            webOptions: any(named: 'webOptions'),
            mOptions: any(named: 'mOptions'),
            wOptions: any(named: 'wOptions'),
          )).thenThrow(Exception());

      // Act & Assert
      expect(
        () => secureStorage.delete(key: 'someKey'),
        throwsA(isA<SecureStorageException>()),
      );

      verify(() => mockFlutterSecureStorage.delete(
            key: 'someKey',
            iOptions: null,
            aOptions: null,
            lOptions: null,
            webOptions: null,
            mOptions: null,
            wOptions: null,
          ));
    });
  });
}
