import 'package:equatable/equatable.dart';

// External exceptions
class ServerException extends Equatable implements Exception {
  const ServerException([this.message]);

  final String? message;

  @override
  List<Object?> get props => [];
}