import 'package:dio/dio.dart';

class DioErrorUtil {
  // general methods:------------------------------------------------------------
  static String handleError(DioException error) {
    String errorDescription = '';

    switch (error.type) {
      case DioExceptionType.cancel:
        errorDescription = 'Request to API server was cancelled';
        break;
      case DioExceptionType.connectionTimeout:
        errorDescription = 'Connection timeout with API server';
        break;
      case DioExceptionType.unknown:
        errorDescription = error.response?.statusMessage ??
            'Connection to API server failed due to internet connection';
        break;
      case DioExceptionType.receiveTimeout:
        errorDescription = 'Receive timeout in connection with API server';
        break;
      case DioExceptionType.badResponse:
        errorDescription =
            "Error: ${error.response?.statusCode} - ${error.response?.data?['message'] ?? ''}";
        break;
      case DioExceptionType.sendTimeout:
        errorDescription = 'Send timeout in connection with API server';
        break;
      default:
        errorDescription = 'Unexpected error occured';
    }

    return errorDescription;
  }
}
