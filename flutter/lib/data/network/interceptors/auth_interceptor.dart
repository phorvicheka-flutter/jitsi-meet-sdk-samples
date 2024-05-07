import 'dart:io';

import 'package:dio/dio.dart';

import '../../../constants/endpoints.dart';
import '../../shared_preferences/shared_preferences_helper.dart';

class AuthInterceptor extends Interceptor {
  final SharedPreferencesHelper sharedPreferencesHelper;

  AuthInterceptor(this.sharedPreferencesHelper);

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // get token
    var token = sharedPreferencesHelper.authToken;

    // attach token to request header if not null
    if (token != null) {
      options.headers.putIfAbsent(
        Endpoints.jwtHeaderAuthorization,
        () => '${Endpoints.jwtBearerPrefix}$token',
      );
    }

    return handler.next(options);
  }

  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) {
    if (err.response?.statusCode == HttpStatus.unauthorized) {
      return handler.reject(err);
    }

    return super.onError(err, handler);
  }
}
