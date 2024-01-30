import 'package:fpdart/fpdart.dart';

import 'package:flutter_all_topics/core/errors/failures.dart';
import 'package:flutter_all_topics/core/usecase/usecase.dart';
import 'package:flutter_all_topics/features/rest_api/domain/entities/petition_params.dart';
import 'package:flutter_all_topics/features/rest_api/domain/entities/petition_response.dart';
import 'package:flutter_all_topics/features/rest_api/domain/repositories/rest_api_repository.dart';

class GetCall implements UseCase<PetitionResponse, PetitionParams> {
  final RestApiRepository repository;

  GetCall({required this.repository});

  @override
  Future<Either<Failure, PetitionResponse>> call(PetitionParams params) async {
    return await repository.getCall(params);
  }
}
