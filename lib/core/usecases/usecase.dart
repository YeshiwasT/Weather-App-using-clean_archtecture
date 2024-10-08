import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:test_clean_archtecture/core/error/failure.dart';


abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}