import 'package:flutter/material.dart';

import 'package:design_system/features/internationalization/templates/languages_template.dart';
import 'package:design_system/features/internationalization/organisms/select_language_organism.dart';
import 'package:design_system/features/internationalization/templates/params/languages_list_tile_params.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('LanguagePageTemplate should render SelectLanguageOrganism',
      (tester) async {
    // Arrange
    const title = 'Select Language';
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
        home: LanguagePageTemplate(
          title: title,
          languageListParams: languageListParams,
        ),
      ),
    );

    // Assert
    expect(find.byType(SelectLanguageOrganism), findsOneWidget);
  });
}
