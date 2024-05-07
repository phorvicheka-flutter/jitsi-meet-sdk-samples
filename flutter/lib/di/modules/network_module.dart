import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../constants/endpoints.dart';
import '../../data/network/interceptors/api_response_interceptor.dart';
import '../../data/network/interceptors/auth_interceptor.dart';
import '../../data/network/interceptors/network_check_interceptor.dart';
import '../../data/shared_preferences/shared_preferences_helper.dart';

abstract class NetworkModule {
  static Dio provideDio(
    SharedPreferencesHelper sharedPreferencesHelper, {
    bool isTesting = false,
  }) {
    final dio = Dio();

    dio
      ..options.baseUrl = Endpoints.baseUrl
      ..options.contentType = Headers.jsonContentType
      // Comment code [..options.connectTimeout] below because of error with web platform:
      // Error bad state future already completed
      // at dio-4.0.6\lib\src\adapters\browser_adapter.dart
      //..options.connectTimeout = Endpoints.connectionTimeout
      ..options.receiveTimeout =
          const Duration(milliseconds: Endpoints.receiveTimeout);

    if (!kIsWeb) {
      dio.options.connectTimeout =
          const Duration(milliseconds: Endpoints.connectionTimeout);
    }

    // if isTesting, no need to add interceptors
    if (isTesting) {
      return dio;
    }

    // use LogInterceptor only in DEBUG mode
    if (kDebugMode) {
      dio.interceptors.add(
        LogInterceptor(
          requestBody: true,
          responseBody: true,
        ),
      );
    }

    dio
      ..interceptors.add(NetworkCheckInterceptor())
      ..interceptors.add(AuthInterceptor(sharedPreferencesHelper))
      ..interceptors.add(ApiResponseInterceptor());

    return dio;
  }
}
