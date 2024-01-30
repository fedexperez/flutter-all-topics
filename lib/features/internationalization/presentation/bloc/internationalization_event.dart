part of 'internationalization_bloc.dart';

abstract class InternationalizationEvent extends Equatable {
  const InternationalizationEvent();

  @override
  List<Object> get props => [];
}

class InternationalizationSetEvent extends InternationalizationEvent {
  final String languageCode;

  const InternationalizationSetEvent({required this.languageCode});

  @override
  List<Object> get props => [languageCode];
}

class InternationalizationCheckEvent extends InternationalizationEvent {
  const InternationalizationCheckEvent();

  @override
  List<Object> get props => [];
}
