import 'package:equatable/equatable.dart';

// Internal APP Exceptions
abstract class Failure extends Equatable implements Exception {
  String get message;
}

class ServerFailure extends Failure {
  @override
  final String message;

  ServerFailure({this.message = "Ocorreu um erro inesperado."});

  @override
  List<Object?> get props => [message];
}

class StorageWriteFailure extends Failure {
  @override
  final String message;

  StorageWriteFailure({this.message = "Ocorreu um erro inesperado."});

  @override
  List<Object?> get props => [message];
}

class StorageReadFailure extends Failure {
  @override
  final String message;

  StorageReadFailure({this.message = "Ocorreu um erro inesperado."});

  @override
  List<Object?> get props => [message];
}