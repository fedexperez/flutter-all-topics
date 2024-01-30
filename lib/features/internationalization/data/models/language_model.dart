import 'dart:convert';

import 'package:flutter_all_topics/features/internationalization/domain/entities/language.dart';

class LanguageModel extends Language {
  const LanguageModel({
    required super.languageCode,
  });

  factory LanguageModel.fromJson(String str) =>
      LanguageModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LanguageModel.fromMap(Map<String, dynamic> json) => LanguageModel(
        languageCode: json["languageCode"] as String,
      );

  Map<String, dynamic> toMap() => {
        "languageCode": languageCode,
      };
}
