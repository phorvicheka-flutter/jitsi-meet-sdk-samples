import 'dart:async';

import '../models/get_users_response/get_users_response.dart';
import '../network/apis/users_api.dart';

class UsersRepository {
  // AuthApi instance
  final UsersApi usersApi;

  // injecting dio instance
  UsersRepository({
    required this.usersApi,
  });

  Future<GetUsersResponse> getUsers() async {
    try {
      final response = await usersApi.getUsers();
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
