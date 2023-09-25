import 'package:dartz/dartz.dart';
import 'package:persotant/core/errors/errors.dart';
import 'package:persotant/core/utils/ok.dart';
import 'package:persotant/features/authentication/domain/entities/token_entity.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, OK>> sendOTP({required String phone});
  Future<Either<Failure, OK>> verifyOTP({
    required String phone,
    required String otp,
  });
  Future<Either<Failure, TokenEntity>> refreshToken({
    required String refreshToken,
  });
}
