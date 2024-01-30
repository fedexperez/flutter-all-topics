import 'package:flutter/material.dart';

import 'package:flutter_all_topics/core/di/dependency_injector.dart';
import 'package:flutter_all_topics/core/env/env.dart';
import 'package:flutter_all_topics/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const String env = String.fromEnvironment('app.flavor');
  switch (env) {
    case 'prod':
      AppEnvironment.setupEnv(Flavor.prod);
      break;
    case 'dev':
      AppEnvironment.setupEnv(Flavor.dev);
      break;
    case 'qa':
      AppEnvironment.setupEnv(Flavor.qa);
      break;
    default:
      AppEnvironment.setupEnv(Flavor.dev);
  }

  final injectionContainerImpl = InjectionContainerImpl();
  await injectionContainerImpl.init();
  runApp(AppState(injectionContainerImpl: injectionContainerImpl));
}
