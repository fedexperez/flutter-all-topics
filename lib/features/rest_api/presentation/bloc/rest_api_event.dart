part of 'rest_api_bloc.dart';

abstract class RestApiEvent extends Equatable {
  const RestApiEvent();

  @override
  List<Object> get props => [];
}

class RestApiMakeGetEvent extends RestApiEvent {
  final String type;

  const RestApiMakeGetEvent({required this.type});

  @override
  List<Object> get props => [type];
}

class RestApiMakePostEvent extends RestApiEvent {
  final String type;

  const RestApiMakePostEvent({required this.type});

  @override
  List<Object> get props => [type];
}

class RestApiMakeDeleteEvent extends RestApiEvent {
  final String type;

  const RestApiMakeDeleteEvent({required this.type});

  @override
  List<Object> get props => [type];
}

class RestApiMakePutEvent extends RestApiEvent {
  final String type;

  const RestApiMakePutEvent({required this.type});

  @override
  List<Object> get props => [type];
}

class RestApiMakePatchEvent extends RestApiEvent {
  final String type;

  const RestApiMakePatchEvent({required this.type});

  @override
  List<Object> get props => [type];
}
