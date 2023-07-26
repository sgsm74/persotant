class ServerPaths {
  ServerPaths._();
  static String sendOTP = 'v1/auth/otp';
  static String verifyOTP = 'v1/auth/otp/verify';
  static String refreshJWTToken = 'v1/auth/jwt/refresh';
}

class HiveKeys {
  HiveKeys._();
  static String token = 'token';
}
