import 'package:dartz/dartz.dart';
import 'package:persotant/core/errors/errors.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
