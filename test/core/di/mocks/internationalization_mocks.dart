import 'package:flutter_all_topics/features/internationalization/data/datasources/internationalization_local_data_source.dart';
import 'package:flutter_all_topics/features/internationalization/data/repositories/internationalization_repository_impl.dart';
import 'package:flutter_all_topics/features/internationalization/domain/usecases/check_locale_language.dart';
import 'package:flutter_all_topics/features/internationalization/domain/usecases/set_locale_language.dart';
import 'package:flutter_all_topics/features/internationalization/presentation/bloc/internationalization_bloc.dart';
import 'package:mocktail/mocktail.dart';

class MockInternationalizationLocalDataSource extends Mock
    implements InternationalizationLocalDataSourceImpl {}

class MockInternationalizationRepository extends Mock
    implements InternationalizationRepositoryImpl {}

class MockInternationalizationBloc extends Mock
    implements InternationalizationBloc {}

class MockSetLocaleLanguage extends Mock implements SetLocaleLanguage {}

class MockCheckLocaleLanguage extends Mock implements CheckLocaleLanguage {}
