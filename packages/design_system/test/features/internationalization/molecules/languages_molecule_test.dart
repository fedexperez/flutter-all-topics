import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:design_system/features/internationalization/atoms/radio_list_tile_atom.dart';
import 'package:design_system/features/internationalization/molecules/languages_molecule.dart';

void main() {
  testWidgets('LanguagesMolecule should create RadioListTileAtom widgets',
      (tester) async {
    // Arrange
    const languageList = {'en': 'English', 'es': 'Spanish', 'fr': 'French'};
    const selectedLanguage = 'en';

    // Act
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: LanguagesMolecule(
            languageList: languageList,
            selectedLanguage: selectedLanguage,
          ),
        ),
      ),
    );

    // Assert
    expect(find.byType(LanguagesMolecule), findsOneWidget);
    expect(find.byType(RadioListTileAtom), findsNWidgets(languageList.length));
  });
}
