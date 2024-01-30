import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_all_topics/core/errors/exceptions.dart';
import 'package:flutter_all_topics/core/errors/failures.dart';
import 'package:flutter_all_topics/features/internationalization/data/datasources/internationalization_local_data_source.dart';
import 'package:flutter_all_topics/features/internationalization/data/models/language_model.dart';
import 'package:flutter_all_topics/features/internationalization/data/repositories/internationalization_repository_impl.dart';
import 'package:flutter_all_topics/features/internationalization/domain/entities/language.dart';

class MockInternationalizationLocalDataSource extends Mock
    implements InternationalizationLocalDataSource {}

void main() {
  late InternationalizationRepositoryImpl repository;
  late MockInternationalizationLocalDataSource mockLocalDataSource;

  const languageToSet = Language(languageCode: 'en');

  setUp(() {
    mockLocalDataSource = MockInternationalizationLocalDataSource();
    repository = InternationalizationRepositoryImpl(
        localDataSource: mockLocalDataSource);
  });

  group('setLocaleLanguage', () {
    test('should return Right(Language) when succesfull', () async {
      // Arrange
      when(() => mockLocalDataSource.cacheLanguage(languageToSet))
          .thenAnswer((_) async => languageToSet);

      // Act
      final result = await repository.setLocaleLanguage(languageToSet);

      // Assert
      expect(result, equals(const Right(languageToSet)));
      verify(() => mockLocalDataSource.cacheLanguage(languageToSet));
      verifyNoMoreInteractions(mockLocalDataSource);
    });

    test('should return CacheFailure', () async {
      // Arrange
      final failure = CacheFailure();
      when(() => mockLocalDataSource.cacheLanguage(languageToSet))
          .thenAnswer((_) async => throw CacheException());

      // Act
      final result = await repository.setLocaleLanguage(languageToSet);

      // Assert
      expect(result, equals(Left(failure)));
      verify(() => mockLocalDataSource.cacheLanguage(languageToSet));
      verifyNoMoreInteractions(mockLocalDataSource);
    });
  });

  group('checkLocaleLanguage', () {
    test('should return Language', () async {
      // Arrange
      const cachedLanguage = LanguageModel(languageCode: 'en');
      when(() => mockLocalDataSource.checkLocaleLanguage())
          .thenAnswer((_) async => cachedLanguage);

      // Act
      final result = await repository.checkLocaleLanguage();

      // Assert
      expect(result, equals(const Right(cachedLanguage)));
      verify(() => mockLocalDataSource.checkLocaleLanguage());
      verifyNoMoreInteractions(mockLocalDataSource);
    });

    test('should return CacheFailure', () async {
      // Arrange
      final failure = CacheFailure();
      when(() => mockLocalDataSource.checkLocaleLanguage())
          .thenAnswer((_) async => throw CacheException());

      // Act
      final result = await repository.checkLocaleLanguage();

      // Assert
      verify(() => mockLocalDataSource.checkLocaleLanguage());
      expect(result, equals(Left(failure)));
      verifyNoMoreInteractions(mockLocalDataSource);
    });
  });
}
