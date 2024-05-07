import 'package:freezed_annotation/freezed_annotation.dart';

import 'user_login_reponse_data.dart';

part 'user_login_response.freezed.dart';
part 'user_login_response.g.dart';

@freezed
class UserLoginResponse with _$UserLoginResponse {
  factory UserLoginResponse({
    required UserLoginResponseData data,
  }) = _UserLoginResponse;

  factory UserLoginResponse.fromJson(Map<String, dynamic> json) =>
      _$UserLoginResponseFromJson(json);
}
