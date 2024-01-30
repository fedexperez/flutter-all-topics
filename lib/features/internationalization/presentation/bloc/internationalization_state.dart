part of 'internationalization_bloc.dart';

abstract class InternationalizationState extends Equatable {
  final Language? language;

  const InternationalizationState({required this.language});

  @override
  List<Object> get props => [];
}

class InternationalizationInitialState extends InternationalizationState {
  const InternationalizationInitialState({required super.language});

  @override
  List<Object> get props => [];
}

class InternationalizationChangingState extends InternationalizationState {
  const InternationalizationChangingState({required super.language});

  @override
  List<Object> get props => [];
}

class InternationalizationSetState extends InternationalizationState {
  const InternationalizationSetState({required Language language})
      : super(language: language);

  @override
  List<Object> get props => [];
}

class InternationalizationErrorState extends InternationalizationState {
  final String errorMessage;

  const InternationalizationErrorState({
    required this.errorMessage,
    required super.language,
  });

  @override
  List<Object> get props => [errorMessage];
}
