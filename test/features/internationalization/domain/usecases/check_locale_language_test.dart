import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

import 'package:flutter_all_topics/core/errors/failures.dart';
import 'package:flutter_all_topics/core/usecase/usecase.dart';
import 'package:flutter_all_topics/features/internationalization/domain/entities/language.dart';
import 'package:flutter_all_topics/features/internationalization/domain/repositories/internationalization_repository.dart';
import 'package:flutter_all_topics/features/internationalization/domain/usecases/check_locale_language.dart';

class MockInternationalizationRepository extends Mock
    implements InternationalizationRepository {}

void main() {
  late CheckLocaleLanguage checkLocaleLanguage;
  late MockInternationalizationRepository mockRepository;

  setUp(() {
    mockRepository = MockInternationalizationRepository();
    checkLocaleLanguage = CheckLocaleLanguage(repository: mockRepository);
  });

  test('should return Language from the repository', () async {
    // Arrange
    const language = Language(
      languageCode: 'en',
    );
    when(() => mockRepository.checkLocaleLanguage())
        .thenAnswer((_) async => const Right(language));

    // Act
    final result = await checkLocaleLanguage(NoParams());

    // Assert
    expect(result, equals(const Right(language)));
    verify(() => mockRepository.checkLocaleLanguage()).called(1);
    verifyNoMoreInteractions(mockRepository);
  });

  test('should return Failure from the repository', () async {
    // Arrange
    final failure = CacheFailure();
    when(() => mockRepository.checkLocaleLanguage())
        .thenAnswer((_) async => Left(failure));

    // Act
    final result = await checkLocaleLanguage(NoParams());

    // Assert
    expect(result, equals(Left(failure)));
    verify(() => mockRepository.checkLocaleLanguage()).called(1);
    verifyNoMoreInteractions(mockRepository);
  });
}
