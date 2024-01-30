import 'package:flutter/material.dart';

import 'package:design_system/features/internationalization/organisms/select_language_organism.dart';
import 'package:design_system/features/internationalization/templates/params/languages_list_tile_params.dart';

class LanguagePageTemplate extends StatelessWidget {
  final String title;
  final LanguageListParams languageListParams;

  const LanguagePageTemplate({
    super.key,
    required this.title,
    required this.languageListParams,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: SafeArea(
        child: SelectLanguageOrganism(
          key: key,
          languageListParams: languageListParams,
        ),
      ),
    );
  }
}
