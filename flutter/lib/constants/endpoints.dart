abstract class Endpoints {
  static const String baseUrl = 'http://192.168.0.42:8000';
  static const int receiveTimeout = 15000;
  static const int connectionTimeout = 30000;

  static const String login = '/login';
  static const String register = '/register';
  static const String users = '/users';
  static const String fcmToken = '/fcmTokens';

  // JWT Token
  static const jwtHeaderAuthorization = 'Authorization';
  static const jwtBearerPrefix = 'Bearer ';
}
