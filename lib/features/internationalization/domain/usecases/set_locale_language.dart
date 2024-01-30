import 'package:fpdart/fpdart.dart';

import 'package:flutter_all_topics/core/errors/failures.dart';
import 'package:flutter_all_topics/core/usecase/usecase.dart';
import 'package:flutter_all_topics/features/internationalization/domain/entities/language.dart';
import 'package:flutter_all_topics/features/internationalization/domain/repositories/internationalization_repository.dart';

class SetLocaleLanguage implements UseCase<Language, Language> {
  final InternationalizationRepository repository;

  SetLocaleLanguage({required this.repository});

  @override
  Future<Either<Failure, Language>> call(Language params) async {
    return await repository.setLocaleLanguage(params);
  }
}
