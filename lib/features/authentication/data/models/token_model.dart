import 'package:persotant/features/authentication/domain/entities/token_entity.dart';

class TokenModel extends TokenEntity {
  const TokenModel({
    required super.accessToken,
    required super.refreshToken,
  });

  factory TokenModel.fromJson(Map<String, dynamic> json) {
    return TokenModel(
      accessToken: json['accessKey'],
      refreshToken: json['refreshKey'],
    );
  }
}
