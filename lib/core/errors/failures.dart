import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

class ServerFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class NetworkFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class EmptyCacheFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class InArchiveFailure extends Failure {
  @override
  List<Object?> get props => [];
}
