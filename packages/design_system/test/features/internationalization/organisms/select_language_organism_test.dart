import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:design_system/features/internationalization/molecules/languages_molecule.dart';
import 'package:design_system/features/internationalization/organisms/select_language_organism.dart';
import 'package:design_system/features/internationalization/templates/params/languages_list_tile_params.dart';

void main() {
  testWidgets('SelectLanguageOrganism should render LanguagesMolecule',
      (tester) async {
    // Arrange
    const languageMap = {'en': 'English', 'es': 'Spanish', 'fr': 'French'};
    const selectedLanguage = 'en';
    final languageListParams = LanguageListParams(
      languageMap: languageMap,
      selectedLanguage: selectedLanguage,
      onPressedLanguage: (languageCode) {},
    );

    // Act
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SelectLanguageOrganism(languageListParams: languageListParams),
        ),
      ),
    );

    // Assert
    expect(find.byType(LanguagesMolecule), findsOneWidget);
  });
}
