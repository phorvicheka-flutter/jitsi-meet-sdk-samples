import 'package:freezed_annotation/freezed_annotation.dart';

// import 'user_login_response_user.dart';

part 'user_login_reponse_data.freezed.dart';
part 'user_login_reponse_data.g.dart';

@freezed
class UserLoginResponseData with _$UserLoginResponseData {
  factory UserLoginResponseData({
    // required UserLoginResponseUser user,
    required String token,
    required String id,
    required String loginId,
    required String name,
  }) = _UserLoginResponseData;

  factory UserLoginResponseData.fromJson(Map<String, dynamic> json) =>
      _$UserLoginResponseDataFromJson(json);
}
