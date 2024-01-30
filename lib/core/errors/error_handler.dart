import 'package:fpdart/fpdart.dart';

import 'package:flutter_all_topics/core/errors/error_message.dart';
import 'package:flutter_all_topics/core/errors/exceptions.dart';
import 'package:flutter_all_topics/core/errors/failures.dart';

/// This function takes a [function] that returns a Future and
/// handles exceptions that might occur during its execution.
/// It returns an [Either] type indicating a successful result ([Right])
/// or an error ([Left]).
Future<Either<Failure, T>> errorHandlerOrResponse<T>(Future<T> function) async {
  try {
    final response = await function;
    return Right(response);
  } on ServerException catch (e) {
    return Left(ServerFailure(
      message: _errorMessage(e.errorCode),
      errorCode: e.errorCode,
    ));
  } on CacheException {
    return Left(CacheFailure());
  } on SecureStorageException {
    return Left(SecureStorageFailure());
  } catch (e) {
    return const Left(UndocumentedFailure());
  }
}

String _errorMessage(int errorCode) {
  switch (errorCode) {
    case 400:
      return ErrorMessage.l10n.error400;

    case 401:
      return ErrorMessage.l10n.error401;

    case 403:
      return ErrorMessage.l10n.error403;

    case 404:
      return ErrorMessage.l10n.error404;

    case 405:
      return ErrorMessage.l10n.error405;

    case 429:
      return ErrorMessage.l10n.error429;

    //Server Error Responses 5xx
    case 500:
      return ErrorMessage.l10n.error500;

    case 502:
      return ErrorMessage.l10n.error502;

    case 503:
      return ErrorMessage.l10n.error503;

    case 504:
      return ErrorMessage.l10n.error504;

    default:
      return ErrorMessage.l10n.errorDefault;
  }
}
