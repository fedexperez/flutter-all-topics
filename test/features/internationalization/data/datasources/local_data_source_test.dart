import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:flutter_all_topics/core/errors/exceptions.dart';
import 'package:flutter_all_topics/core/constants/language.dart';
import 'package:flutter_all_topics/core/shared_preferences/custom_shared_preferences.dart';
import 'package:flutter_all_topics/features/internationalization/data/datasources/internationalization_local_data_source.dart';
import 'package:flutter_all_topics/features/internationalization/data/models/language_model.dart';
import 'package:flutter_all_topics/features/internationalization/domain/entities/language.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockCustomSharedPreferences extends Mock
    implements CustomSharedPreferences {}

void main() {
  group('InternationalizationLocalDataSourceImpl', () {
    late InternationalizationLocalDataSourceImpl dataSource;
    late MockCustomSharedPreferences mockSharedPreferences;

    setUp(() {
      mockSharedPreferences = MockCustomSharedPreferences();
      dataSource = InternationalizationLocalDataSourceImpl(
          customSharedPreferences: mockSharedPreferences);
    });

    group('checkLocaleLanguage', () {
      test('should return LanguageModel', () async {
        // Arrange
        final json = fixture('internationalization/language_fixture.json');
        when(() => mockSharedPreferences.getString(
            key: LanguageConstants.cachedLanguage)).thenReturn(json);

        // Act
        final result = await dataSource.checkLocaleLanguage();

        // Assert
        expect(result, isA<LanguageModel>());
        expect(result.languageCode, 'en');
      });

      test('should throw a CacheException', () async {
        // Arrange
        when(() => mockSharedPreferences.getString(key: any(named: 'key')))
            .thenThrow(CacheException());

        // Act
        final result = dataSource.checkLocaleLanguage();

        // Assert
        expect(result, throwsA(const TypeMatcher<CacheException>()));
        verify(() => mockSharedPreferences.getString(
            key: LanguageConstants.cachedLanguage)).called(1);
        verifyNoMoreInteractions(mockSharedPreferences);
      });
    });

    group('cacheLanguage', () {
      test('should store language in SharedPreferences', () async {
        // Arrange
        const languageToCache = Language(languageCode: 'en');
        const expectedLanguageModel = LanguageModel(languageCode: 'en');
        when(() => mockSharedPreferences.setString(
              key: LanguageConstants.cachedLanguage,
              value: expectedLanguageModel.toJson(),
            )).thenAnswer((_) async => true);

        // Act
        final result = await dataSource.cacheLanguage(languageToCache);

        // Assert
        expect(result, equals(languageToCache));
        verify(() => mockSharedPreferences.setString(
              key: LanguageConstants.cachedLanguage,
              value: expectedLanguageModel.toJson(),
            )).called(1);
        verifyNoMoreInteractions(mockSharedPreferences);
      });

      test('should throw a CacheException', () async {
        // Arrange
        const languageToCache = Language(languageCode: 'en');
        const languageModel = LanguageModel(languageCode: 'en');
        when(() => mockSharedPreferences.setString(
              key: any(named: 'key'),
              value: any(named: 'value'),
            )).thenThrow(CacheException());

        // Act
        final result = dataSource.cacheLanguage(languageToCache);

        // Assert
        expect(result, throwsA(const TypeMatcher<CacheException>()));
        verify(() => mockSharedPreferences.setString(
              key: LanguageConstants.cachedLanguage,
              value: languageModel.toJson(),
            )).called(1);
        verifyNoMoreInteractions(mockSharedPreferences);
      });
    });
  });
}
