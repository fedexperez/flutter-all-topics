import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_all_topics/core/shared_preferences/custom_shared_preferences.dart';
import 'package:flutter_all_topics/core/errors/exceptions.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late CustomSharedPreferences customSharedPreferences;
  late MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    customSharedPreferences = CustomSharedPreferencesImpl(
      sharedPreferences: mockSharedPreferences,
    );
  });
  group('CustomSharedPreferencesImpl', () {
    group('getBool', () {
      test('returns the value from SharedPreferences', () {
        // Arrange
        when(() => mockSharedPreferences.getBool(any())).thenReturn(true);

        // Act
        final result = customSharedPreferences.getBool(key: 'someKey');

        // Assert
        expect(result, true);
        verify(() => mockSharedPreferences.getBool('someKey'));
      });

      test('throws CacheException when the value is null', () {
        // Arrange
        when(() => mockSharedPreferences.getBool(any())).thenReturn(null);

        // Assert
        expect(
          () => customSharedPreferences.getBool(key: 'someKey'),
          throwsA(isA<CacheException>()),
        );
        verify(() => mockSharedPreferences.getBool('someKey'));
      });
    });

    group('getDouble', () {
      test('returns the value from SharedPreferences', () {
        // Arrange
        when(() => mockSharedPreferences.getDouble(any())).thenReturn(42);

        // Act
        final result = customSharedPreferences.getDouble(key: 'someKey');

        // Assert
        expect(result, 42.0);
        verify(() => mockSharedPreferences.getDouble('someKey'));
      });

      test('throws CacheException when the value is null', () {
        // Arrange
        when(() => mockSharedPreferences.getDouble(any())).thenReturn(null);

        // Assert
        expect(
          () => customSharedPreferences.getDouble(key: 'someKey'),
          throwsA(isA<CacheException>()),
        );
        verify(() => mockSharedPreferences.getDouble('someKey'));
      });
    });

    group('getInt', () {
      test('the value from SharedPreferences', () {
        // Arrange
        when(() => mockSharedPreferences.getInt(any())).thenReturn(42);

        // Act
        final result = customSharedPreferences.getInt(key: 'someKey');

        // Assert
        expect(result, 42);
        verify(() => mockSharedPreferences.getInt('someKey'));
      });

      test('throws CacheException when the value is null', () {
        // Arrange
        when(() => mockSharedPreferences.getInt(any())).thenReturn(null);

        // Assert
        expect(
          () => customSharedPreferences.getInt(key: 'someKey'),
          throwsA(isA<CacheException>()),
        );
        verify(() => mockSharedPreferences.getInt('someKey'));
      });
    });

    group('getString', () {
      test('returns the value from SharedPreferences', () {
        // Arrange
        when(() => mockSharedPreferences.getString(any()))
            .thenReturn('someValue');

        // Act
        final result = customSharedPreferences.getString(key: 'someKey');

        // Assert
        expect(result, 'someValue');
        verify(() => mockSharedPreferences.getString('someKey'));
      });

      test('throws CacheException when the value is null', () {
        // Arrange
        when(() => mockSharedPreferences.getString(any())).thenReturn(null);

        // Assert
        expect(
          () => customSharedPreferences.getString(key: 'someKey'),
          throwsA(isA<CacheException>()),
        );

        // Assert
        verify(() => mockSharedPreferences.getString('someKey'));
      });
    });

    group('getStringList', () {
      test('returns the value from SharedPreferences', () {
        // Arrange
        when(() => mockSharedPreferences.getStringList(any()))
            .thenReturn(['value1', 'value2']);

        // Act
        final result = customSharedPreferences.getStringList(key: 'someKey');

        // Assert
        expect(result, ['value1', 'value2']);
        verify(() => mockSharedPreferences.getStringList('someKey'));
      });

      test('throws CacheException when the value is null', () {
        // Arrange
        when(() => mockSharedPreferences.getStringList(any())).thenReturn(null);

        // Assert
        expect(
          () => customSharedPreferences.getStringList(key: 'someKey'),
          throwsA(isA<CacheException>()),
        );
        verify(() => mockSharedPreferences.getStringList('someKey'));
      });
    });

    test('setBool calls SharedPreferences.setBool', () async {
      // Arrange
      when(() => mockSharedPreferences.setBool(any(), any()))
          .thenAnswer((_) => Future.value(true));

      // Act
      await customSharedPreferences.setBool(key: 'someKey', value: true);

      // Assert
      verify(() => mockSharedPreferences.setBool('someKey', true));
    });

    test('setDouble calls SharedPreferences.setDouble', () async {
      // Arrange
      when(() => mockSharedPreferences.setDouble(any(), any()))
          .thenAnswer((_) => Future.value(true));

      // Act
      await customSharedPreferences.setDouble(key: 'someKey', value: 42);

      // Assert
      verify(() => mockSharedPreferences.setDouble('someKey', 42));
    });

    test('setInt calls SharedPreferences.setInt', () async {
      // Arrange
      when(() => mockSharedPreferences.setInt(any(), any()))
          .thenAnswer((_) => Future.value(true));

      // Act
      await customSharedPreferences.setInt(key: 'someKey', value: 42);

      // Assert
      verify(() => mockSharedPreferences.setInt('someKey', 42));
    });

    test('setString calls SharedPreferences.setString', () async {
      // Arrange
      when(() => mockSharedPreferences.setString(any(), any()))
          .thenAnswer((_) => Future.value(true));

      // Act
      await customSharedPreferences.setString(
        key: 'someKey',
        value: 'someValue',
      );

      // Assert
      verify(() => mockSharedPreferences.setString('someKey', 'someValue'));
    });

    test('setStringList calls SharedPreferences.setStringList', () async {
      // Arrange
      when(() => mockSharedPreferences.setStringList(any(), any()))
          .thenAnswer((_) => Future.value(true));

      // Act
      await customSharedPreferences
          .setStringList(key: 'someKey', value: ['value1', 'value2']);

      // Assert
      verify(() =>
          mockSharedPreferences.setStringList('someKey', ['value1', 'value2']));
    });

    group('remove', () {
      test('remove calls SharedPreferences.remove', () async {
        // Arrange
        when(() => mockSharedPreferences.remove(any()))
            .thenAnswer((_) async => true);

        // Act
        final result = await customSharedPreferences.remove(key: 'someKey');

        // Assert
        expect(result, true);
        verify(() => mockSharedPreferences.remove('someKey'));
      });

      test('remove throws CacheException on error', () async {
        // Arrange
        when(() => mockSharedPreferences.remove(any())).thenThrow(Exception());

        // Assert
        expect(
          () => customSharedPreferences.remove(key: 'someKey'),
          throwsA(isA<CacheException>()),
        );
        verify(() => mockSharedPreferences.remove('someKey'));
      });
    });
  });
}
