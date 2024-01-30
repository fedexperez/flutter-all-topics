// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

import 'package:flutter_all_topics/core/errors/error_message.dart';
import 'package:flutter_all_topics/core/usecase/usecase.dart';
import 'package:flutter_all_topics/core/errors/failures.dart';
import 'package:flutter_all_topics/features/internationalization/domain/entities/language.dart';
import 'package:flutter_all_topics/features/internationalization/domain/usecases/check_locale_language.dart';
import 'package:flutter_all_topics/features/internationalization/domain/usecases/set_locale_language.dart';
import 'package:flutter_all_topics/features/internationalization/presentation/bloc/internationalization_bloc.dart';

class MockSetLocaleLanguage extends Mock implements SetLocaleLanguage {}

class MockCheckLocaleLanguage extends Mock implements CheckLocaleLanguage {}

void main() {
  late InternationalizationBloc bloc;
  late MockSetLocaleLanguage mockSetLocaleLanguage;
  late MockCheckLocaleLanguage mockCheckLocaleLanguage;

  const testLanguage = Language(languageCode: 'en');

  setUp(() {
    mockSetLocaleLanguage = MockSetLocaleLanguage();
    mockCheckLocaleLanguage = MockCheckLocaleLanguage();
    bloc = InternationalizationBloc(
      setLocaleLanguage: mockSetLocaleLanguage,
      checkLocaleLanguage: mockCheckLocaleLanguage,
    );
  });
  group('InternationalizationBloc', () {
    test(
      'initialState should be empty',
      () async {
        //assert
        expect(
          bloc.state,
          equals(const InternationalizationInitialState(language: null)),
        );
      },
    );

    group('SetLocaleLanguage', () {
      test(
          'emits [InternationalizationSetState] when SetLocaleLanguage is successful',
          () async* {
        // Arrange
        when(() => mockSetLocaleLanguage(any()))
            .thenAnswer((_) async => const Right(testLanguage));

        // Act
        bloc.add(const InternationalizationSetEvent(languageCode: 'en'));

        // Assert
        final List<InternationalizationState> expected = [
          const InternationalizationInitialState(language: null),
          const InternationalizationChangingState(language: null),
          const InternationalizationSetState(language: testLanguage),
        ];
        await expectLater(
          bloc.state,
          emitsInOrder(expected),
        );

        verify(() => mockSetLocaleLanguage.call(testLanguage));
        verifyNoMoreInteractions(mockSetLocaleLanguage);
      });

      test(
          'emits [InternationalizationErrorState] when SetLocaleLanguage fails',
          () async* {
        // Arrange
        when(() => mockSetLocaleLanguage.call(any()))
            .thenAnswer((_) async => Left(CacheFailure()));

        // Act
        bloc.add(const InternationalizationSetEvent(languageCode: 'en'));

        // Assert
        final List<InternationalizationState> expected = [
          const InternationalizationInitialState(language: null),
          const InternationalizationChangingState(language: null),
          InternationalizationErrorState(
            errorMessage: ErrorMessage.l10n.errorSettingLanguage,
            language: any(),
          ),
        ];
        await expectLater(
          bloc.state,
          emitsInOrder(expected),
        );

        verify(() => mockSetLocaleLanguage.call(testLanguage));
        verifyNoMoreInteractions(mockSetLocaleLanguage);
      });
    });

    group('CheckLocaleLanguage', () {
      test(
          'emits [InternationalizationSetState] when CheckLocaleLanguage is successful',
          () async* {
        // Arrange
        when(() => mockCheckLocaleLanguage.call(any()))
            .thenAnswer((_) async => const Right(testLanguage));

        // Act
        bloc.add(const InternationalizationCheckEvent());

        // Assert
        final List<InternationalizationState> expected = [
          const InternationalizationInitialState(language: null),
          const InternationalizationChangingState(language: null),
          const InternationalizationSetState(language: testLanguage),
        ];
        await expectLater(
          bloc.state,
          emitsInOrder(expected),
        );

        verify(() => mockCheckLocaleLanguage.call(NoParams())).called(1);
        verifyNoMoreInteractions(mockCheckLocaleLanguage);
      });

      test(
          'emits [InternationalizationErrorState] when CheckLocaleLanguage fails',
          () async* {
        // Arrange
        when(() => mockCheckLocaleLanguage.call(any()))
            .thenAnswer((_) async => Left(CacheFailure()));

        // Act
        bloc.add(const InternationalizationCheckEvent());

        // Assert
        final List<InternationalizationState> expected = [
          const InternationalizationInitialState(language: null),
          const InternationalizationChangingState(language: null),
          InternationalizationErrorState(
            errorMessage: ErrorMessage.l10n.errorSettingLanguage,
            language: null,
          ),
        ];
        await expectLater(
          bloc.state,
          emitsInOrder(expected),
        );

        verify(() => mockCheckLocaleLanguage.call(NoParams()));
        verifyNoMoreInteractions(mockCheckLocaleLanguage);
      });
    });
  });
}
