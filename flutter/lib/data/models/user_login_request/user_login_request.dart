import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_login_request.freezed.dart';
part 'user_login_request.g.dart';

@freezed
class UserLoginRequest with _$UserLoginRequest {
  factory UserLoginRequest({
    required String userId,
    required String password,
  }) = _UserLoginRequest;

  factory UserLoginRequest.fromJson(Map<String, dynamic> json) =>
      _$UserLoginRequestFromJson(json);
}
