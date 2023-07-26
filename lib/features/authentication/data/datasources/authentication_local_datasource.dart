import 'package:persotant/features/authentication/domain/entities/token_entity.dart';

abstract class AuthenticationLocalDataSource {
  Future<void> saveToken(TokenEntity token);
  Future<TokenEntity> loadToken();
}

class AuthenticationLocalDataSourceImpl
    implements AuthenticationLocalDataSource {
  @override
  Future<TokenEntity> loadToken() {
    // TODO: implement loadToken
    throw UnimplementedError();
  }

  @override
  Future<void> saveToken(TokenEntity token) {
    // TODO: implement saveToken
    throw UnimplementedError();
  }
}
