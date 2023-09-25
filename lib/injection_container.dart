import 'package:get_it/get_it.dart';
import 'package:persotant/core/services/network.dart';
import 'package:persotant/features/authentication/data/datasources/authentication_local_datasource.dart';
import 'package:persotant/features/authentication/data/datasources/authentication_remote_datasoure.dart';
import 'package:persotant/features/authentication/data/repositories/authentication_repository_impl.dart';
import 'package:persotant/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:persotant/features/authentication/domain/usecases/send_otp_usecase.dart';
import 'package:persotant/features/authentication/domain/usecases/verify_otp_usecase.dart';
import 'package:persotant/features/authentication/presentation/bloc/authentication_bloc.dart';

final sl = GetIt.instance;

void init() {
  _injectNetwork();
  _injectAuthentication();
}

void _injectNetwork() {
  sl.registerLazySingleton<Network>(
    () => NetworkImpl(dataConnectionChecker: sl()),
  );
}

void _injectAuthentication() {
  //state management
  sl.registerFactory(
    () => AuthenticationBloc(
      sendOTPUseCase: sl(),
      verifyOTPUseCase: sl(),
    ),
  );
  //usecases
  sl.registerLazySingleton(
    () => SendOTPUseCase(
      authenticationRepository: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => VerifyOTPUseCase(
      authenticationRepository: sl(),
    ),
  );
  //repository
  sl.registerLazySingleton<AuthenticationRepository>(
    () => AuthenticationRepositoryImpl(
      localDataSource: sl(),
      remoteDataSource: sl(),
      network: sl(),
    ),
  );
  //datasource
  sl.registerLazySingleton<AuthenticationLocalDataSource>(
    () => AuthenticationLocalDataSourceImpl(queue: sl()),
  );
  sl.registerLazySingleton<AuthenticationRemoteDataSource>(
    () => AuthenticationRemoteDataSourceImpl(httpService: sl()),
  );
}
