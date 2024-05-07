import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_register_request.freezed.dart';
part 'user_register_request.g.dart';

@freezed
class UserRegisterRequest with _$UserRegisterRequest {
  factory UserRegisterRequest({
    required String userId,
    required String userName,
    required String email,
    required String password,
  }) = _UserRegisterRequest;

  factory UserRegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$UserRegisterRequestFromJson(json);
}
