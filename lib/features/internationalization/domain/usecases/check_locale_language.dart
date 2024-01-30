import 'package:fpdart/fpdart.dart';

import 'package:flutter_all_topics/core/errors/failures.dart';
import 'package:flutter_all_topics/core/usecase/usecase.dart';
import 'package:flutter_all_topics/features/internationalization/domain/entities/language.dart';
import 'package:flutter_all_topics/features/internationalization/domain/repositories/internationalization_repository.dart';

class CheckLocaleLanguage implements UseCase<Language, NoParams> {
  final InternationalizationRepository repository;

  CheckLocaleLanguage({required this.repository});

  @override
  Future<Either<Failure, Language>> call(NoParams noParams) async {
    return await repository.checkLocaleLanguage();
  }
}
