import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_all_topics/core/errors/failures.dart';
import 'package:flutter_all_topics/features/rest_api/domain/entities/petition_params.dart';
import 'package:flutter_all_topics/features/rest_api/domain/usecases/delete_call.dart';
import 'package:flutter_all_topics/features/rest_api/domain/usecases/get_call.dart';
import 'package:flutter_all_topics/features/rest_api/domain/usecases/patch_call.dart';
import 'package:flutter_all_topics/features/rest_api/domain/usecases/post_call.dart';
import 'package:flutter_all_topics/features/rest_api/domain/usecases/put_call.dart';

part 'rest_api_event.dart';
part 'rest_api_state.dart';

class RestApiBloc extends Bloc<RestApiEvent, RestApiState> {
  final GetCall getCall;
  final PostCall postCall;
  final DeleteCall deleteCall;
  final PutCall putCall;
  final PatchCall patchCall;

  RestApiBloc({
    required this.getCall,
    required this.postCall,
    required this.deleteCall,
    required this.putCall,
    required this.patchCall,
  }) : super(RestApiInitialState()) {
    on<RestApiMakeGetEvent>((event, emit) async {
      emit(RestApiLoadingState());
      final failureOrResponse = await getCall(
        PetitionParams(type: event.type),
      );
      failureOrResponse.fold((failure) {
        if (failure is ServerFailure) {
          emit(RestApiErrorState(message: failure.message!));
        } else {
          emit(const RestApiErrorState(message: ''));
        }
        emit(RestApiInitialState());
      }, (response) {
        emit(RestApiPetitionCompletedState(
          responseType: response.methodType,
          message: response.message,
          statusCode: response.statusCode.toString(),
        ));
        emit(RestApiInitialState());
      });
    });

    on<RestApiMakePostEvent>((event, emit) async {
      emit(RestApiLoadingState());
      final failureOrResponse = await postCall(
        PetitionParams(type: event.type),
      );
      failureOrResponse.fold((failure) {
        if (failure is ServerFailure) {
          emit(RestApiErrorState(message: failure.message!));
        } else {
          emit(const RestApiErrorState(message: ''));
        }
        emit(RestApiInitialState());
      }, (response) {
        emit(RestApiPetitionCompletedState(
          responseType: response.methodType,
          message: response.message,
          statusCode: response.statusCode.toString(),
        ));
        emit(RestApiInitialState());
      });
    });

    on<RestApiMakeDeleteEvent>((event, emit) async {
      emit(RestApiLoadingState());
      final failureOrResponse = await deleteCall(
        PetitionParams(type: event.type),
      );
      failureOrResponse.fold((failure) {
        if (failure is ServerFailure) {
          emit(RestApiErrorState(message: failure.message!));
        } else {
          emit(const RestApiErrorState(message: ''));
        }
        emit(RestApiInitialState());
      }, (response) {
        emit(RestApiPetitionCompletedState(
          responseType: response.methodType,
          message: response.message,
          statusCode: response.statusCode.toString(),
        ));
        emit(RestApiInitialState());
      });
    });

    on<RestApiMakePutEvent>((event, emit) async {
      emit(RestApiLoadingState());
      final failureOrResponse = await putCall(
        PetitionParams(type: event.type),
      );
      failureOrResponse.fold((failure) {
        if (failure is ServerFailure) {
          emit(RestApiErrorState(message: failure.message!));
        } else {
          emit(const RestApiErrorState(message: ''));
        }
        emit(RestApiInitialState());
      }, (response) {
        emit(RestApiPetitionCompletedState(
          responseType: response.methodType,
          message: response.message,
          statusCode: response.statusCode.toString(),
        ));
        emit(RestApiInitialState());
      });
    });

    on<RestApiMakePatchEvent>((event, emit) async {
      emit(RestApiLoadingState());
      final failureOrResponse = await patchCall(
        PetitionParams(type: event.type),
      );
      failureOrResponse.fold((failure) {
        if (failure is ServerFailure) {
          emit(RestApiErrorState(message: failure.message!));
        } else {
          emit(const RestApiErrorState(message: ''));
        }
        emit(RestApiInitialState());
      }, (response) {
        emit(RestApiPetitionCompletedState(
          responseType: response.methodType,
          message: response.message,
          statusCode: response.statusCode.toString(),
        ));
        emit(RestApiInitialState());
      });
    });
  }
}
