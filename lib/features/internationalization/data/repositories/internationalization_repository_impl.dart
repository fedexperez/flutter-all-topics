import 'package:fpdart/fpdart.dart';

import 'package:flutter_all_topics/core/errors/error_handler.dart';
import 'package:flutter_all_topics/core/errors/failures.dart';
import 'package:flutter_all_topics/features/internationalization/data/datasources/internationalization_local_data_source.dart';
import 'package:flutter_all_topics/features/internationalization/domain/entities/language.dart';
import 'package:flutter_all_topics/features/internationalization/domain/repositories/internationalization_repository.dart';

class InternationalizationRepositoryImpl
    implements InternationalizationRepository {
  final InternationalizationLocalDataSource localDataSource;

  InternationalizationRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, Language>> setLocaleLanguage(Language language) async {
    return await errorHandlerOrResponse(
        localDataSource.cacheLanguage(language));
  }

  @override
  Future<Either<Failure, Language>> checkLocaleLanguage() async {
    return await errorHandlerOrResponse(localDataSource.checkLocaleLanguage());
  }
}
