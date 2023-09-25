part of 'authentication_bloc.dart';

sealed class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

final class AuthenticationInitial extends AuthenticationState {}

final class AuthenticationLoadingState extends AuthenticationState {}

final class AuthenticationErrorState extends AuthenticationState {
  const AuthenticationErrorState({required this.errorMessage});

  final String errorMessage;
  @override
  List<Object> get props => [errorMessage];
}

final class SendOTPSuccessfulState extends AuthenticationState {}

final class VerifyOTPSuccessfulState extends AuthenticationState {}
