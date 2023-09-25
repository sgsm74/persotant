import 'package:dartz/dartz.dart';
import 'package:persotant/core/errors/errors.dart';
import 'package:persotant/core/errors/exceptions.dart';

Future<Either<Failure, Type>> requestToServer<Type>(
  bool networkInfo,
  Future<Type> Function() requestFunction, {
  Future Function(Type result)? extraOperation,
}) async {
  if (networkInfo) {
    try {
      final result = await requestFunction();
      extraOperation != null ? await extraOperation(result) : () {}();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  } else {
    return const Left(NetworkFailure(message: 'No internet connection'));
  }
}
