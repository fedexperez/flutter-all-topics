import 'package:fpdart/fpdart.dart';

import 'package:flutter_all_topics/core/errors/failures.dart';
import 'package:flutter_all_topics/features/internationalization/domain/entities/language.dart';

abstract class InternationalizationRepository {
  Future<Either<Failure, Language>> setLocaleLanguage(Language language);
  Future<Either<Failure, Language>> checkLocaleLanguage();
}
