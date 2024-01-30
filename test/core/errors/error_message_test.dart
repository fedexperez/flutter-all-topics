import 'package:flutter_all_topics/core/l10n/generated/l10n.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:flutter_all_topics/core/errors/error_message.dart';
import 'package:flutter_all_topics/core/di/dependency_injector.dart';

class MockL10n extends Mock implements L10n {}

class MockInjectionContainerImpl extends Mock
    implements InjectionContainerImpl {}

void main() {
  late MockL10n mockL10n;
  late InjectionContainerImpl injectionContainer;

  setUp(() {
    mockL10n = MockL10n();
    injectionContainer = InjectionContainerImpl();
    injectionContainer.sl.allowReassignment = true;
    injectionContainer.sl.registerSingleton<L10n>(mockL10n);
  });

  test('should provide L10n instance', () {
    // Act
    final errorMessage = ErrorMessage.l10n;

    // Assert
    expect(errorMessage, mockL10n);
  });

  test('should provide "English" message', () {
    // Arrange
    when(() => injectionContainer.sl<L10n>().english).thenReturn('English');
    // when(() => mockL10n.english).thenReturn('English');

    // Act
    final errorMessage = ErrorMessage.l10n.english;

    // Assert
    expect(errorMessage, 'English');
  });
}
