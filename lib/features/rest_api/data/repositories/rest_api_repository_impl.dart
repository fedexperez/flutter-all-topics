import 'package:flutter_all_topics/core/errors/error_handler.dart';
import 'package:flutter_all_topics/features/rest_api/data/datasources/rest_api_remote_data_source.dart';
import 'package:fpdart/fpdart.dart';

import 'package:flutter_all_topics/core/errors/failures.dart';
import 'package:flutter_all_topics/features/rest_api/domain/entities/petition_params.dart';
import 'package:flutter_all_topics/features/rest_api/domain/entities/petition_response.dart';
import 'package:flutter_all_topics/features/rest_api/domain/repositories/rest_api_repository.dart';

class RestApiRepositoryImpl extends RestApiRepository {
  final RestApiRemoteDataSource remoteDataSource;

  RestApiRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, PetitionResponse>> deleteCall(
    PetitionParams petitionParams,
  ) async {
    return await errorHandlerOrResponse(
      remoteDataSource.deleteMethod(petitionParams: petitionParams),
    );
  }

  @override
  Future<Either<Failure, PetitionResponse>> getCall(
    PetitionParams petitionParams,
  ) async {
    return await errorHandlerOrResponse(
      remoteDataSource.getMethod(petitionParams: petitionParams),
    );
  }

  @override
  Future<Either<Failure, PetitionResponse>> patchCall(
    PetitionParams petitionParams,
  ) async {
    return await errorHandlerOrResponse(
      remoteDataSource.patchMethod(petitionParams: petitionParams),
    );
  }

  @override
  Future<Either<Failure, PetitionResponse>> postCall(
    PetitionParams petitionParams,
  ) async {
    return await errorHandlerOrResponse(
      remoteDataSource.postMethod(petitionParams: petitionParams),
    );
  }

  @override
  Future<Either<Failure, PetitionResponse>> putCall(
    PetitionParams petitionParams,
  ) async {
    return await errorHandlerOrResponse(
      remoteDataSource.putMethod(petitionParams: petitionParams),
    );
  }
}
