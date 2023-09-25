part of 'authentication_bloc.dart';

sealed class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class SendOTPEvent extends AuthenticationEvent {
  const SendOTPEvent({required this.cellPhone});
  final String cellPhone;

  @override
  List<Object> get props => [cellPhone];
}

class VertifyOTPEvent extends AuthenticationEvent {
  const VertifyOTPEvent({
    required this.cellPhone,
    required this.otp,
  });
  final String cellPhone;
  final String otp;
  @override
  List<Object> get props => [cellPhone, otp];
}
