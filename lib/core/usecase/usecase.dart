import 'package:fpdart/fpdart.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter_all_topics/core/errors/failures.dart';

/// Parameters [Params] have to be put into a container object
/// so that they can be included in this abstract base class method definition.
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>?> call(Params params);
}

// This will be used by the code calling the use case whenever the use case
// doesn't accept or requires any parameters.
class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
