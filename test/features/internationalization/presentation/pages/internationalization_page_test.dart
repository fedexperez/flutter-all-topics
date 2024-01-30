import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:flutter_all_topics/core/l10n/generated/l10n.dart';
import 'package:flutter_all_topics/features/blocs.dart';
import 'package:flutter_all_topics/features/internationalization/domain/entities/language.dart';
import 'package:flutter_all_topics/features/internationalization/presentation/pages/internationalization_page.dart';

import '../../../material_app_localizated.dart';

class MockInternationalizationBloc
    extends MockBloc<InternationalizationEvent, InternationalizationState>
    implements InternationalizationBloc {}

class MockL10n extends Mock implements L10n {}

void main() {
  late MockInternationalizationBloc mockBloc;
  late MockL10n mockL10n;

  setUp(() {
    mockBloc = MockInternationalizationBloc();
    mockL10n = MockL10n();
    when(() => mockL10n.language).thenReturn('Language');
    when(() => mockL10n.english).thenReturn('English');
    when(() => mockL10n.spanish).thenReturn('Spanish');
  });

  testWidgets('InternationalizationPage renders correctly', (tester) async {
    // Arrange
    when(() => mockBloc.state)
        .thenReturn(const InternationalizationInitialState(
      language: Language(languageCode: 'en'),
    ));

    await tester.pumpWidget(
      MaterialAppLocalizated(
        child: BlocProvider<InternationalizationBloc>(
          create: (_) => mockBloc,
          child: const InternationalizationPage(),
        ),
      ),
    );

    await tester.pumpAndSettle();

    // Assert
    expect(find.text('Language'), findsOneWidget);
    expect(find.text('English'), findsOneWidget);
    expect(find.text('Spanish'), findsOneWidget);
  });
}
