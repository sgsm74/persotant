import 'package:dartz/dartz.dart';

import 'package:persotant/core/errors/errors.dart';
import 'package:persotant/core/services/network.dart';
import 'package:persotant/core/utils/utils.dart';
import 'package:persotant/features/authentication/data/datasources/authentication_local_datasource.dart';
import 'package:persotant/features/authentication/data/datasources/authentication_remote_datasoure.dart';
import 'package:persotant/features/authentication/domain/entities/token_entity.dart';
import 'package:persotant/features/authentication/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  const AuthenticationRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
    required this.network,
  });

  final AuthenticationLocalDataSource localDataSource;
  final AuthenticationRemoteDataSource remoteDataSource;
  final Network network;

  @override
  Future<Either<Failure, void>> sendOTP({required String phone}) async =>
      await requestToServer(await network.hasConnection!,
          () async => await remoteDataSource.sendOTP(phone));

  @override
  Future<Either<Failure, TokenEntity>> verifyOTP({
    required String phone,
    required String otp,
  }) async =>
      await requestToServer(await network.hasConnection!,
          () async => await remoteDataSource.verfiyOTP(phone, otp));

  @override
  Future<Either<Failure, TokenEntity>> refreshToken({
    required String refreshToken,
  }) async =>
      await requestToServer(await network.hasConnection!,
          () async => await remoteDataSource.refreshToken(refreshToken));
}
