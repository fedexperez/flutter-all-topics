import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_all_topics/features/internationalization/domain/entities/language.dart';
import 'package:flutter_all_topics/features/internationalization/data/models/language_model.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  group('LanguageModel', () {
    const LanguageModel languageModel = LanguageModel(languageCode: 'en');

    test(
      'should be a subclass of Language entity',
      () async {
        // Assert
        expect(languageModel, isA<Language>());
      },
    );

    test('should create a LanguageModel instance from JSON', () {
      // Arrange
      final json = fixture('internationalization/language_fixture.json');

      // Act
      final languageModel = LanguageModel.fromJson(json);

      // Assert
      expect(languageModel, isA<LanguageModel>());
      expect(languageModel.languageCode, 'en');
    });

    test('should create a JSON from LanguageModel instance', () {
      // Arrange
      final expectedJson =
          fixture('internationalization/language_fixture.json');

      // Act
      final json = languageModel.toJson();

      // Assert
      expect(json, expectedJson);
    });

    test('should create a LanguageModel instance from map', () {
      // Arrange
      final jsonMap = {'languageCode': 'en'};

      // Act
      final languageModel = LanguageModel.fromMap(jsonMap);

      // Assert
      expect(languageModel, isA<LanguageModel>());
      expect(languageModel.languageCode, 'en');
    });

    test('should create a map from LanguageModel instance', () {
      // Act
      final jsonMap = languageModel.toMap();

      // Assert
      expect(jsonMap, {'languageCode': 'en'});
    });
  });
}
