import 'package:equatable/equatable.dart';

class Language extends Equatable {
  final String languageCode;

  const Language({required this.languageCode});

  @override
  List<Object?> get props => [languageCode];
}
