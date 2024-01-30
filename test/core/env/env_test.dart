import 'package:flutter/material.dart';

import 'package:flutter_all_topics/core/env/env.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppEnvironment', () {
    test('should set up prod environment', () {
      // Arrange
      AppEnvironment.shared =
          AppEnvironment(debugBanner: false, primaryColor: Colors.blue);

      // Act
      AppEnvironment.setupEnv(Flavor.prod);

      // Assert
      expect(AppEnvironment.shared.debugBanner,
          isTrue); // Check if debugBanner is set to true in prod
      expect(
        AppEnvironment.shared.primaryColor,
        equals(null),
      ); // Check if primaryColor is null in prod
    });

    test('should set up dev environment', () {
      // Arrange
      AppEnvironment.shared =
          AppEnvironment(debugBanner: false, primaryColor: Colors.blue);

      // Act
      AppEnvironment.setupEnv(Flavor.dev);

      // Assert
      expect(AppEnvironment.shared.debugBanner,
          isTrue); // Check if debugBanner is set to true in dev
      expect(
        AppEnvironment.shared.primaryColor,
        equals(Colors.red),
      ); // Check if primaryColor is red in dev
    });

    test('should set up qa environment', () {
      // Arrange
      AppEnvironment.shared =
          AppEnvironment(debugBanner: false, primaryColor: Colors.blue);

      // Act
      AppEnvironment.setupEnv(Flavor.qa);

      // Assert
      expect(AppEnvironment.shared.debugBanner,
          isTrue); // Check if debugBanner is set to true in qa
      expect(
        AppEnvironment.shared.primaryColor,
        equals(Colors.green),
      ); // Check if primaryColor is green in qa
    });
  });
}
