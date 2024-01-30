import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

import 'package:flutter_all_topics/core/errors/error_message.dart';
import 'package:flutter_all_topics/core/http/custom_http_client.dart';
import 'package:flutter_all_topics/core/http/dio_client_mix.dart';
import 'package:flutter_all_topics/core/l10n/generated/l10n.dart';
import 'package:flutter_all_topics/core/secure_storage/secure_storage.dart';
import 'package:flutter_all_topics/core/shared_preferences/custom_shared_preferences.dart';
import 'package:flutter_all_topics/features/internationalization/data/datasources/internationalization_local_data_source.dart';
import 'package:flutter_all_topics/features/internationalization/data/repositories/internationalization_repository_impl.dart';
import 'package:flutter_all_topics/features/internationalization/domain/repositories/internationalization_repository.dart';
import 'package:flutter_all_topics/features/internationalization/domain/usecases/check_locale_language.dart';
import 'package:flutter_all_topics/features/internationalization/domain/usecases/set_locale_language.dart';
import 'package:flutter_all_topics/features/internationalization/presentation/bloc/internationalization_bloc.dart';
import 'package:flutter_all_topics/features/rest_api/data/datasources/rest_api_remote_data_source.dart';
import 'package:flutter_all_topics/features/rest_api/data/repositories/rest_api_repository_impl.dart';
import 'package:flutter_all_topics/features/rest_api/domain/repositories/rest_api_repository.dart';
import 'package:flutter_all_topics/features/rest_api/domain/usecases/delete_call.dart';
import 'package:flutter_all_topics/features/rest_api/domain/usecases/get_call.dart';
import 'package:flutter_all_topics/features/rest_api/domain/usecases/patch_call.dart';
import 'package:flutter_all_topics/features/rest_api/domain/usecases/post_call.dart';
import 'package:flutter_all_topics/features/rest_api/domain/usecases/put_call.dart';
import 'package:flutter_all_topics/features/rest_api/presentation/bloc/rest_api_bloc.dart';

abstract class InjectionContainer {
  Future<void> init();
}

class InjectionContainerImpl implements InjectionContainer {
  final sl = GetIt.instance;

  @override
  Future<void> init() async {
    ///Features
    ///
    //Internationalization
    //Bloc
    sl.registerFactory(() => InternationalizationBloc(
          setLocaleLanguage: sl(),
          checkLocaleLanguage: sl(),
        ));

    //Usecases
    sl.registerLazySingleton(() => SetLocaleLanguage(repository: sl()));
    sl.registerLazySingleton(() => CheckLocaleLanguage(repository: sl()));

    //Repository
    sl.registerLazySingleton<InternationalizationRepository>(
      () => InternationalizationRepositoryImpl(localDataSource: sl()),
    );

    //Data
    sl.registerLazySingleton<InternationalizationLocalDataSource>(
      () => InternationalizationLocalDataSourceImpl(
          customSharedPreferences: sl()),
    );

    //Rest API
    //Bloc
    sl.registerFactory(
      () => RestApiBloc(
          getCall: sl(),
          postCall: sl(),
          deleteCall: sl(),
          putCall: sl(),
          patchCall: sl()),
    );

    //Usecases
    sl.registerLazySingleton(() => GetCall(repository: sl()));
    sl.registerLazySingleton(() => PostCall(repository: sl()));
    sl.registerLazySingleton(() => DeleteCall(repository: sl()));
    sl.registerLazySingleton(() => PutCall(repository: sl()));
    sl.registerLazySingleton(() => PatchCall(repository: sl()));

    //Repository
    sl.registerLazySingleton<RestApiRepository>(
      () => RestApiRepositoryImpl(remoteDataSource: sl()),
    );

    //Data
    sl.registerLazySingleton<RestApiRemoteDataSource>(
      () => RestApiRemoteDataSourceImpl(
        client: sl(),
      ),
    );

    ///Core
    sl.registerLazySingleton<SecureStorage>(() => SecureStorageImpl(sl()));
    sl.registerLazySingleton<CustomSharedPreferences>(
      () => CustomSharedPreferencesImpl(sharedPreferences: sl()),
    );

    //Http
    sl.registerLazySingleton(Dio.new);
    sl.registerLazySingleton(() => DioClientMix(client: sl()));
    sl.registerLazySingleton<CustomHttpClient>(
      () => CustomHttpClientImpl(clientMix: sl()),
    );

    //Errors
    sl.registerLazySingleton(ErrorMessage.new);

    //Secure Storage
    sl.registerLazySingleton(() => const FlutterSecureStorage());

    //Shared Preferences
    final sharedPreferences = await SharedPreferences.getInstance();
    sl.registerSingleton<SharedPreferences>(sharedPreferences);

    //Localization
    sl.registerLazySingleton(L10n.new);
  }
}
