import 'package:equatable/equatable.dart';

class TokenEntity extends Equatable {
  const TokenEntity({
    required this.accessToken,
    required this.refreshToken,
  });
  final String accessToken;
  final String refreshToken;

  @override
  List<Object> get props => [accessToken, refreshToken];
}
