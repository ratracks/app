import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:ratracks/domain/errors/failures.dart';

abstract class UseCase<Input, Output> {
  Future<Either<Failure, Output>> call(Input params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}