import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:persotant/core/errors/errors.dart';
import 'package:persotant/core/utils/ok.dart';
import 'package:persotant/core/utils/usecase.dart';
import 'package:persotant/features/authentication/domain/repositories/authentication_repository.dart';

class VerifyOTPUseCase extends UseCase<OK, VerifyOTPUseCaseParams> {
  VerifyOTPUseCase({
    required this.authenticationRepository,
  });
  final AuthenticationRepository authenticationRepository;

  @override
  Future<Either<Failure, OK>> call(params) =>
      authenticationRepository.verifyOTP(
        phone: params.cellPhone,
        otp: params.otp,
      );
}

class VerifyOTPUseCaseParams extends Equatable {
  const VerifyOTPUseCaseParams({
    required this.cellPhone,
    required this.otp,
  });
  final String cellPhone;
  final String otp;
  @override
  List<Object> get props => [cellPhone, otp];
}
