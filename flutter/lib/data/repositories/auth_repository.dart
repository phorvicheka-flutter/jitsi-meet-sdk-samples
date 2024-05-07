import 'dart:async';

import '../models/success_response/success_response.dart';
import '../models/user_register_request/user_register_request.dart';

import '../models/user/user.dart';
import '../models/user_login_request/user_login_request.dart';
import '../models/user_login_response/user_login_response.dart';
import '../network/apis/auth_api.dart';
import '../shared_preferences/shared_preferences_helper.dart';

class AuthRepository {
  // AuthApi instance
  final AuthApi authApi;
  final SharedPreferencesHelper sharedPreferencesHelper;
  // injecting dio instance
  AuthRepository({
    required this.authApi,
    required this.sharedPreferencesHelper,
  });

  Future<UserLoginResponse> login(UserLoginRequest userLoginRequest) async {
    try {
      final response = await authApi.login(userLoginRequest);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> logout() async {
    return sharedPreferencesHelper.removeUserAndAuthToken();
  }

  Future<bool> saveUserAndAuthToken(User user, String token) async {
    return sharedPreferencesHelper.saveUserAndAuthToken(user, token);
  }

  bool get isLoggedIn => sharedPreferencesHelper.isLoggedIn;

  User? get user => sharedPreferencesHelper.user;

  Future<SuccessResponse> register(
    UserRegisterRequest userRegisterRequest,
  ) async {
    try {
      final response = await authApi.register(userRegisterRequest);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
