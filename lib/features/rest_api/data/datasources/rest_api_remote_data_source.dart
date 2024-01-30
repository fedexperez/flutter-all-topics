import 'package:flutter_all_topics/core/constants/api.dart';
import 'package:flutter_all_topics/core/http/custom_http_client.dart';
import 'package:flutter_all_topics/features/rest_api/data/models/petition_params_model.dart';
import 'package:flutter_all_topics/features/rest_api/data/models/petition_response_model.dart';
import 'package:flutter_all_topics/features/rest_api/domain/entities/petition_params.dart';

abstract class RestApiRemoteDataSource {
  Future<PetitionResponseModel> postMethod({
    required PetitionParams petitionParams,
  });
  Future<PetitionResponseModel> getMethod({
    required PetitionParams petitionParams,
  });
  Future<PetitionResponseModel> putMethod({
    required PetitionParams petitionParams,
  });
  Future<PetitionResponseModel> deleteMethod({
    required PetitionParams petitionParams,
  });
  Future<PetitionResponseModel> patchMethod({
    required PetitionParams petitionParams,
  });
}

class RestApiRemoteDataSourceImpl extends RestApiRemoteDataSource {
  final CustomHttpClient client;

  RestApiRemoteDataSourceImpl({required this.client});

  @override
  Future<PetitionResponseModel> deleteMethod(
      {required PetitionParams petitionParams}) async {
    final response = await client.delete(
      path: API.restApi,
      body: PetitionParamsModel(type: petitionParams.type).toJson(),
    );
    return PetitionResponseModel.fromMap(response.data);
  }

  @override
  Future<PetitionResponseModel> getMethod(
      {required PetitionParams petitionParams}) async {
    final response = await client.get(
      path: API.restApi,
      body: PetitionParamsModel(type: petitionParams.type).toJson(),
    );
    return PetitionResponseModel.fromMap(response.data);
  }

  @override
  Future<PetitionResponseModel> patchMethod(
      {required PetitionParams petitionParams}) async {
    final response = await client.patch(
      path: API.restApi,
      body: PetitionParamsModel(type: petitionParams.type).toJson(),
    );
    return PetitionResponseModel.fromMap(response.data);
  }

  @override
  Future<PetitionResponseModel> postMethod(
      {required PetitionParams petitionParams}) async {
    final response = await client.post(
      path: API.restApi,
      body: PetitionParamsModel(type: petitionParams.type).toJson(),
    );
    return PetitionResponseModel.fromMap(response.data);
  }

  @override
  Future<PetitionResponseModel> putMethod(
      {required PetitionParams petitionParams}) async {
    final response = await client.put(
      path: API.restApi,
      body: PetitionParamsModel(type: petitionParams.type).toJson(),
    );
    return PetitionResponseModel.fromMap(response.data);
  }
}
