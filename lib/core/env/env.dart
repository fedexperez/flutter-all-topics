import 'package:flutter/material.dart';

enum Flavor { prod, dev, qa }

class AppEnvironment {
  final bool debugBanner;
  final MaterialColor? primaryColor;

  AppEnvironment({
    required this.debugBanner,
    required this.primaryColor,
  });

  static AppEnvironment shared = AppEnvironment.create();

  factory AppEnvironment.create({
    bool? debugBanner,
    MaterialColor? primaryColor,
  }) {
    return shared = AppEnvironment(
      debugBanner: debugBanner = true,
      primaryColor: primaryColor,
    );
  }

  static void setupEnv(Flavor env) {
    switch (env) {
      case Flavor.prod:
        {
          AppEnvironment.create(
            debugBanner: false,
            primaryColor: null,
          );
          break;
        }
      case Flavor.dev:
        {
          AppEnvironment.create(
            debugBanner: true,
            primaryColor: Colors.red,
          );
          break;
        }
      case Flavor.qa:
        {
          AppEnvironment.create(
            debugBanner: true,
            primaryColor: Colors.green,
          );
          break;
        }
    }
  }
}
