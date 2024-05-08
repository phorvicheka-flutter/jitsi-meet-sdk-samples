abstract class Endpoints {
  static const String jitsiMeetServerUrl =
      'https://dev.connected-in.co.kr:8446';
  // static const String baseUrl = 'http://192.168.0.42:8000';
  static const String baseUrl = 'https://dev.connected-in.co.kr/auth/api';
  static const int receiveTimeout = 15000;
  static const int connectionTimeout = 30000;

  static const String login = '/account/login';
  static const String register = '/account/join';
  static const String users = '/user';
  static const String fcmToken = '/fcmTokens';
  static const String fcmCall = '/video';

  // JWT Token
  static const jwtHeaderAuthorization = 'token';
  static const jwtBearerPrefix = '';
}
