import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persotant/features/authentication/domain/usecases/send_otp_usecase.dart';
import 'package:persotant/features/authentication/domain/usecases/verify_otp_usecase.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({
    required this.sendOTPUseCase,
    required this.verifyOTPUseCase,
  }) : super(AuthenticationInitial()) {
    on<AuthenticationEvent>((event, emit) async {
      if (event is SendOTPEvent) {
        await _onSendOTPEvent(event, emit);
      } else if (event is VertifyOTPEvent) {
        await _onVertifyOTPEvent(event, emit);
      }
    });
  }
  final SendOTPUseCase sendOTPUseCase;
  final VerifyOTPUseCase verifyOTPUseCase;
  FutureOr<void> _onSendOTPEvent(
      SendOTPEvent event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoadingState());
    final result =
        await sendOTPUseCase(SendOTPUseCaseParams(cellPhone: event.cellPhone));
    emit(
      result.fold(
        (error) => AuthenticationErrorState(errorMessage: error.message),
        (ok) => SendOTPSuccessfulState(),
      ),
    );
  }

  FutureOr<void> _onVertifyOTPEvent(
      VertifyOTPEvent event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoadingState());
    final result = await verifyOTPUseCase(
      VerifyOTPUseCaseParams(cellPhone: event.cellPhone, otp: event.otp),
    );
    emit(
      result.fold(
        (error) => AuthenticationErrorState(errorMessage: error.message),
        (ok) => VerifyOTPSuccessfulState(),
      ),
    );
  }
}
