abstract class Endpoints {
  static const String baseUrl = 'http://192.168.0.42:8000';
  // static const String baseUrl = 'https://dev.connected-in.co.kr/auth/api';
  static const int receiveTimeout = 15000;
  static const int connectionTimeout = 30000;

  static const String login = '/account/login';
  static const String register = '/account/join';
  static const String users = '/user';
  static const String fcmToken = '/fcmTokens';

  // JWT Token
  static const jwtHeaderAuthorization = 'Authorization';
  static const jwtBearerPrefix = 'Bearer ';
}
