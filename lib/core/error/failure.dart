import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  abstract final String errorMessage;
  @override
  List<Object?> get props => [];
}
class ServerFailure extends Failure{
  @override
  // TODO: implement errorMessage
  String get errorMessage => throw UnimplementedError();
}
class CacheFailure extends Failure{
  @override
  // TODO: implement errorMessage
  String get errorMessage => throw UnimplementedError();
}