class LanguageListParams {
  final Map<String, String> languageMap;
  final String selectedLanguage;
  final void Function(dynamic)? onPressedLanguage;

  LanguageListParams({
    required this.languageMap,
    required this.selectedLanguage,
    required this.onPressedLanguage,
  });
}
