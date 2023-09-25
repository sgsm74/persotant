import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:persotant/core/errors/errors.dart';
import 'package:persotant/core/utils/ok.dart';
import 'package:persotant/core/utils/usecase.dart';
import 'package:persotant/features/authentication/domain/repositories/authentication_repository.dart';

class SendOTPUseCase extends UseCase<OK, SendOTPUseCaseParams> {
  SendOTPUseCase({
    required this.authenticationRepository,
  });
  final AuthenticationRepository authenticationRepository;

  @override
  Future<Either<Failure, OK>> call(params) =>
      authenticationRepository.sendOTP(phone: params.cellPhone);
}

class SendOTPUseCaseParams extends Equatable {
  const SendOTPUseCaseParams({
    required this.cellPhone,
  });
  final String cellPhone;
  @override
  List<Object> get props => [cellPhone];
}
