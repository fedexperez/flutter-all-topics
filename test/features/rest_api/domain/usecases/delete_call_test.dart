import 'package:flutter_all_topics/features/rest_api/domain/entities/petition_params.dart';
import 'package:flutter_all_topics/features/rest_api/domain/entities/petition_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

import 'package:flutter_all_topics/features/rest_api/domain/repositories/rest_api_repository.dart';
import 'package:flutter_all_topics/features/rest_api/domain/usecases/delete_call.dart';

class MockRestApiRepository extends Mock implements RestApiRepository {}

void main() {
  late DeleteCall deleteCall;
  late MockRestApiRepository mockRestApiRepository;

  const PetitionParams petitionParams = PetitionParams(type: 'DELETE');
  const PetitionResponse petitionResponse = PetitionResponse(
    methodType: 'delete',
    message: '432',
    statusCode: 200,
  );

  setUp(() {
    mockRestApiRepository = MockRestApiRepository();
    deleteCall = DeleteCall(repository: mockRestApiRepository);
  });

  test(
    'should return PetitionResponse from the repository',
    () async {
      // Arrange
      when(() => mockRestApiRepository.deleteCall(petitionParams))
          .thenAnswer((_) async => const Right(petitionResponse));

      // Act

      final result = await deleteCall(petitionParams);

      // Assert
    },
  );
}
