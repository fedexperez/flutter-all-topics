import 'package:fpdart/fpdart.dart';

import 'package:flutter_all_topics/core/errors/failures.dart';
import 'package:flutter_all_topics/features/rest_api/domain/entities/petition_params.dart';
import 'package:flutter_all_topics/features/rest_api/domain/entities/petition_response.dart';

abstract class RestApiRepository {
  Future<Either<Failure, PetitionResponse>> getCall(
      PetitionParams petitionParams);
  Future<Either<Failure, PetitionResponse>> postCall(
      PetitionParams petitionParams);
  Future<Either<Failure, PetitionResponse>> deleteCall(
      PetitionParams petitionParams);
  Future<Either<Failure, PetitionResponse>> putCall(
      PetitionParams petitionParams);
  Future<Either<Failure, PetitionResponse>> patchCall(
      PetitionParams petitionParams);
}
