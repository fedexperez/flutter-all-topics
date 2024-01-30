import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_all_topics/core/di/dependency_injector.dart';
import 'package:flutter_all_topics/core/l10n/generated/l10n.dart';
import 'package:flutter_all_topics/core/secure_storage/secure_storage.dart';
import 'package:flutter_all_topics/core/shared_preferences/custom_shared_preferences.dart';

class MockSecureStorage extends Mock implements SecureStorage {}

class MockCustomSharedPreferences extends Mock
    implements CustomSharedPreferences {}

class MockSharedPreferences extends Mock implements SharedPreferences {}

class MockL10n extends Mock implements L10n {}

class MockInjectionContainerImpl extends Mock
    implements InjectionContainerImpl {}

class MockFlutterSecureStorage extends Mock implements FlutterSecureStorage {}
