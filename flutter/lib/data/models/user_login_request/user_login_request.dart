import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_login_request.freezed.dart';
part 'user_login_request.g.dart';

@freezed
class UserLoginRequest with _$UserLoginRequest {
  factory UserLoginRequest({
    @JsonKey(name: 'loginId') required String userId,
    @JsonKey(name: 'password') required String password,
    @JsonKey(name: 'registrationId') required String fcmToken,
  }) = _UserLoginRequest;

  factory UserLoginRequest.fromJson(Map<String, dynamic> json) =>
      _$UserLoginRequestFromJson(json);
}
