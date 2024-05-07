import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_register_request.freezed.dart';
part 'user_register_request.g.dart';

@freezed
class UserRegisterRequest with _$UserRegisterRequest {
  factory UserRegisterRequest({
    @JsonKey(name: 'loginId') required String userId,
    @JsonKey(name: 'name') required String userName,
    // required String email,
    @JsonKey(name: 'password') required String password,
  }) = _UserRegisterRequest;

  factory UserRegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$UserRegisterRequestFromJson(json);
}
