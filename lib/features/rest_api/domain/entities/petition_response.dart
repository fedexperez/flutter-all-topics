import 'package:equatable/equatable.dart';

class PetitionResponse extends Equatable {
  final String methodType;
  final String message;
  final int statusCode;

  const PetitionResponse({
    required this.methodType,
    required this.message,
    required this.statusCode,
  });

  @override
  List<Object?> get props => [];
}
