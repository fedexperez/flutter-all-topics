import 'package:flutter/material.dart';

import 'package:design_system/features/internationalization/atoms/radio_list_tile_atom.dart';

class LanguagesMolecule extends StatelessWidget {
  final Map<String, String> languageList;
  final String selectedLanguage;
  final void Function(dynamic)? onPressedLanguage;

  const LanguagesMolecule({
    super.key,
    required this.languageList,
    required this.selectedLanguage,
    this.onPressedLanguage,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: languageList.length,
      itemBuilder: (context, index) {
        final String key = languageList.keys.elementAt(index);
        final String value = languageList[key]!;
        return RadioListTileAtom(
          title: Text(value),
          value: key,
          groupValue: selectedLanguage,
          onChanged: onPressedLanguage,
        );
      },
    );
  }
}
