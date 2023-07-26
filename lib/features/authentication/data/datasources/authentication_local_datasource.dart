import 'package:persotant/core/consts/consts.dart';
import 'package:persotant/core/utils/hive_utils.dart';
import 'package:persotant/features/authentication/domain/entities/token_entity.dart';
import 'package:queue/queue.dart';

abstract class AuthenticationLocalDataSource {
  Future<void> saveToken(TokenEntity token);
  Future<TokenEntity> loadToken();
}

class AuthenticationLocalDataSourceImpl
    implements AuthenticationLocalDataSource {
  const AuthenticationLocalDataSourceImpl({required this.queue});
  final Queue queue;

  @override
  Future<TokenEntity> loadToken() =>
      queue.add(() async => await loadFromHive<TokenEntity>(HiveKeys.token));

  @override
  Future<void> saveToken(TokenEntity token) => queue
      .add(() async => await saveToHive<TokenEntity>(HiveKeys.token, token));
}
