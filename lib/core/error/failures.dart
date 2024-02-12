import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  String message;

  Failure({required this.message});
}

class ServerFailure extends Failure {
  ServerFailure({required String message}) : super(message: message);

  @override
  List<Object?> get props => [message];
}

class CacheFailure extends Failure {
  CacheFailure({required String message}) : super(message: message);

  @override
  List<Object?> get props => [message];
}
