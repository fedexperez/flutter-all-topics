part of 'rest_api_bloc.dart';

abstract class RestApiState extends Equatable {
  const RestApiState();

  @override
  List<Object> get props => [];
}

class RestApiInitialState extends RestApiState {}

class RestApiLoadingState extends RestApiState {}

class RestApiPetitionCompletedState extends RestApiState {
  final String responseType;
  final String message;
  final String statusCode;

  const RestApiPetitionCompletedState({
    required this.responseType,
    required this.message,
    required this.statusCode,
  });

  @override
  List<Object> get props => [
        responseType,
        message,
        statusCode,
      ];
}

class RestApiErrorState extends RestApiState {
  final String message;

  const RestApiErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
