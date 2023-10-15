class ServerPaths {
  ServerPaths._();
  static String sendOTP = 'v1/auth/otp';
  static String verifyOTP = 'v1/auth/otp/verify';
  static String refreshJWTToken = 'v1/auth/jwt/refresh';

  static String categories = 'v1/categories';
  static String getCategory({required int id}) => 'v1/categories/$id';
}

class HiveKeys {
  HiveKeys._();
  static String token = 'token';
  static String categories = 'categories';
}

class ImageAssets {
  ImageAssets._();
  static String sliderImageOne = 'assets/images/slider/1.png';
}
