import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import 'package:flutter_all_topics/core/l10n/generated/l10n.dart';
import 'package:flutter_all_topics/core/errors/error_handler.dart';
import 'package:flutter_all_topics/core/errors/exceptions.dart';
import 'package:flutter_all_topics/core/errors/failures.dart';

class MockL10n extends Mock implements L10n {}

Future<void> main() async {
  late GetIt getIt;
  late MockL10n mockL10n;

  setUpAll(() {
    mockL10n = MockL10n();
    getIt = GetIt.instance;
    getIt.registerSingleton<L10n>(mockL10n);
  });
  group('errorHandlerOrResponse', () {
    late Future<Either<Failure, dynamic>> functionUnderTest;

    test('should return Right(result) on successful execution', () async {
      // Arrange
      functionUnderTest = errorHandlerOrResponse(Future.value(42));

      // Act
      final result = await functionUnderTest;

      // Assert
      expect(result, const Right(42));
    });

    test('should return Left(ServerFailure) on ServerException', () async {
      // Arrange
      when(() => mockL10n.error500).thenReturn(
          "Oops, something went wrong on our server. We're working to fix it");
      functionUnderTest = errorHandlerOrResponse(
          Future<int>.error(ServerException(errorCode: 500)));

      // Act
      final result = await functionUnderTest;

      // Assert
      expect(
          result,
          const Left(ServerFailure(
            errorCode: 500,
            message:
                "Oops, something went wrong on our server. We're working to fix it",
          )));
    });

    test('should return Left(CacheFailure) on CacheException', () async {
      // Arrange
      functionUnderTest =
          errorHandlerOrResponse(Future<int>.error(CacheException()));

      // Act
      final result = await functionUnderTest;

      // Assert
      expect(result, Left(CacheFailure()));
    });

    test('should return Left(SecureStorageFailure) on SecureStorageException',
        () async {
      // Arrange
      functionUnderTest =
          errorHandlerOrResponse(Future<int>.error(SecureStorageException()));

      // Act
      final result = await functionUnderTest;

      // Assert
      expect(result, Left(SecureStorageFailure()));
    });

    test('should return Left(UndocumentedFailure) on other exceptions',
        () async {
      // Arrange
      functionUnderTest = errorHandlerOrResponse(
          Future<int>.error(Exception('Some other exception')));

      // Act
      final result = await functionUnderTest;

      // Assert
      expect(result, const Left(UndocumentedFailure()));
    });
  });
}
