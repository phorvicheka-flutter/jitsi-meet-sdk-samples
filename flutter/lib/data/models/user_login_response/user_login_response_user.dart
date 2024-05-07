import 'package:freezed_annotation/freezed_annotation.dart';

import '../user/user.dart';

part 'user_login_response_user.freezed.dart';
part 'user_login_response_user.g.dart';

@freezed
class UserLoginResponseUser with _$UserLoginResponseUser {
  factory UserLoginResponseUser({
    required String userId,
    required String userName,
    required String email,
  }) = _UserLoginResponseUser;

  factory UserLoginResponseUser.fromJson(Map<String, dynamic> json) =>
      _$UserLoginResponseUserFromJson(json);
}

extension UserLoginResponseUserExtension on UserLoginResponseUser {
  User toUser() {
    return User(userId: userId, userName: userName);
  }
}
