import 'package:dio/dio.dart';
import 'package:persotant/core/consts/consts.dart';
import 'package:persotant/core/errors/exceptions.dart';
import 'package:persotant/core/services/http_service.dart';
import 'package:persotant/features/authentication/data/models/token_model.dart';

abstract class AuthenticationRemoteDataSource {
  Future<void> sendOTP(String phone);
  Future<TokenModel> verfiyOTP(String phone, String otp);
  Future<TokenModel> refreshToken(String refreshToken);
}

class AuthenticationRemoteDataSourceImpl
    implements AuthenticationRemoteDataSource {
  const AuthenticationRemoteDataSourceImpl({required this.httpService});
  final HTTPService httpService;

  @override
  Future<void> sendOTP(String phone) async {
    try {
      await httpService.postData(
        ServerPaths.sendOTP,
        data: {'cellphone': phone},
      );
      return Future.value();
    } on DioException catch (e) {
      throw ServerException(message: e.message ?? '');
    }
  }

  @override
  Future<TokenModel> verfiyOTP(String phone, String otp) async {
    try {
      final result = await httpService.postData(
        ServerPaths.verifyOTP,
        data: {
          'cellphone': phone,
          'otp': otp,
        },
      );
      return TokenModel.fromJson(result.data['data']);
    } on DioException catch (e) {
      throw ServerException(message: e.message ?? '');
    }
  }

  @override
  Future<TokenModel> refreshToken(String refreshToken) async {
    try {
      final result = await httpService.postData(
        ServerPaths.refreshJWTToken,
        data: {
          'refreshKey': refreshToken,
        },
      );
      return TokenModel.fromJson(result.data['data']);
    } on DioException catch (e) {
      throw ServerException(message: e.message ?? '');
    }
  }
}
