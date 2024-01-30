import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

import 'mocks/core_mocks.dart';
import 'mocks/internationalization_mocks.dart';
import 'package:flutter_all_topics/core/di/dependency_injector.dart';

void main() {
  group('InjectionContainerImpl', () {
    late GetIt sl;
    late InjectionContainerImpl injectionContainerImpl;

    setUp(() {
      injectionContainerImpl = InjectionContainerImpl();
      sl = injectionContainerImpl.sl;
      sl.allowReassignment = true;
    });

    group('Internationalization', () {
      late MockInternationalizationBloc mockInternationalizationBloc;
      late MockCheckLocaleLanguage mockCheckLocaleLanguage;
      late MockSetLocaleLanguage mockSetLocaleLanguage;
      late MockInternationalizationLocalDataSource
          mockInternationalizationLocalDataSource;
      late MockInternationalizationRepository
          mockInternationalizationRepository;

      setUp(() {
        mockInternationalizationBloc = MockInternationalizationBloc();
        mockInternationalizationRepository =
            MockInternationalizationRepository();
        mockCheckLocaleLanguage = MockCheckLocaleLanguage();
        mockSetLocaleLanguage = MockSetLocaleLanguage();
        mockInternationalizationLocalDataSource =
            MockInternationalizationLocalDataSource();
      });

      test('should register dependencies', () async {
        // Act
        //Bloc
        sl.registerFactory<MockInternationalizationBloc>(
          () => mockInternationalizationBloc,
        );

        //Usecases
        sl.registerLazySingleton<MockCheckLocaleLanguage>(
            () => mockCheckLocaleLanguage);
        sl.registerLazySingleton<MockSetLocaleLanguage>(
            () => mockSetLocaleLanguage);

        //Repository
        sl.registerLazySingleton<MockInternationalizationRepository>(
          () => mockInternationalizationRepository,
        );

        //Data
        sl.registerLazySingleton<MockInternationalizationLocalDataSource>(
          () => mockInternationalizationLocalDataSource,
        );

        // Assert
        expect(sl.isRegistered<MockInternationalizationBloc>(), true);
        expect(sl.isRegistered<MockSetLocaleLanguage>(), true);
        expect(sl.isRegistered<MockCheckLocaleLanguage>(), true);
        expect(sl.isRegistered<MockInternationalizationRepository>(), true);
        expect(
            sl.isRegistered<MockInternationalizationLocalDataSource>(), true);
      });
    });

    group('Core', () {
      late MockFlutterSecureStorage mockFlutterSecureStorage;
      late MockSharedPreferences mockSharedPreferences;
      late MockSecureStorage mockSecureStorage;
      late MockCustomSharedPreferences mockCustomSharedPreferences;
      late MockL10n mockL10n;

      setUp(() {
        mockFlutterSecureStorage = MockFlutterSecureStorage();
        mockSharedPreferences = MockSharedPreferences();
        mockSecureStorage = MockSecureStorage();
        mockCustomSharedPreferences = MockCustomSharedPreferences();
        mockL10n = MockL10n();
      });

      test('should register dependencies', () async {
        // Act
        //Core
        sl.registerLazySingleton<MockSecureStorage>(() => mockSecureStorage);
        sl.registerLazySingleton<MockCustomSharedPreferences>(
          () => mockCustomSharedPreferences,
        );

        //Secure Storage
        sl.registerLazySingleton<MockFlutterSecureStorage>(
          () => mockFlutterSecureStorage,
        );

        //Shared Preferences
        sl.registerSingleton<MockSharedPreferences>(mockSharedPreferences);

        //Localization
        sl.registerLazySingleton<MockL10n>(
          () => mockL10n,
        );

        // Assert
        expect(sl.isRegistered<MockSecureStorage>(), true);
        expect(sl.isRegistered<MockCustomSharedPreferences>(), true);
        expect(sl.isRegistered<MockFlutterSecureStorage>(), true);
        expect(sl.isRegistered<MockSharedPreferences>(), true);
        expect(sl.isRegistered<MockL10n>(), true);
      });
    });
  });
}
