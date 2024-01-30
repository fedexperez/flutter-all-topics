import 'package:flutter/material.dart';

import 'package:design_system/features/internationalization/molecules/languages_molecule.dart';
import 'package:design_system/features/internationalization/templates/params/languages_list_tile_params.dart';

class SelectLanguageOrganism extends StatelessWidget {
  final LanguageListParams languageListParams;

  const SelectLanguageOrganism({
    super.key,
    required this.languageListParams,
  });

  @override
  Widget build(BuildContext context) {
    return LanguagesMolecule(
      languageList: languageListParams.languageMap,
      selectedLanguage: languageListParams.selectedLanguage,
      onPressedLanguage: languageListParams.onPressedLanguage,
    );
  }
}
