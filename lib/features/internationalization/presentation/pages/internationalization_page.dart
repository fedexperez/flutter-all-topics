import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:design_system/features/internationalization/templates/languages_template.dart';
import 'package:design_system/features/internationalization/templates/params/languages_list_tile_params.dart';
import 'package:flutter_all_topics/core/l10n/generated/l10n.dart';
import 'package:flutter_all_topics/features/internationalization/presentation/bloc/internationalization_bloc.dart';

class InternationalizationPage extends StatelessWidget {
  const InternationalizationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final languages = {
      'en': L10n.of(context).english,
      'es': L10n.of(context).spanish,
    };

    return BlocBuilder<InternationalizationBloc, InternationalizationState>(
      builder: (context, state) {
        return LanguagePageTemplate(
          title: L10n.of(context).language,
          languageListParams: LanguageListParams(
            languageMap: languages,
            selectedLanguage: state.language?.languageCode ?? 'en',
            onPressedLanguage: (languageCode) {
              context.read<InternationalizationBloc>().add(
                  InternationalizationSetEvent(languageCode: languageCode));
            },
          ),
        );
      },
    );
  }
}
