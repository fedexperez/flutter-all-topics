import 'package:flutter_all_topics/core/constants/language.dart';
import 'package:flutter_all_topics/core/shared_preferences/custom_shared_preferences.dart';
import 'package:flutter_all_topics/features/internationalization/data/models/language_model.dart';
import 'package:flutter_all_topics/features/internationalization/domain/entities/language.dart';

abstract class InternationalizationLocalDataSource {
  Future<Language> checkLocaleLanguage();
  Future<Language> cacheLanguage(Language languageToCache);
}

class InternationalizationLocalDataSourceImpl
    implements InternationalizationLocalDataSource {
  final CustomSharedPreferences customSharedPreferences;

  InternationalizationLocalDataSourceImpl(
      {required this.customSharedPreferences});

  @override
  Future<LanguageModel> checkLocaleLanguage() async {
    final jsonString = customSharedPreferences.getString(
      key: LanguageConstants.cachedLanguage,
    );
    return LanguageModel.fromJson(jsonString);
  }

  @override
  Future<Language> cacheLanguage(Language languageToCache) async {
    final LanguageModel toCache = LanguageModel(
      languageCode: languageToCache.languageCode,
    );
    customSharedPreferences.setString(
      key: LanguageConstants.cachedLanguage,
      value: toCache.toJson(),
    );
    return languageToCache;
  }
}
