import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_users_response_data_user.freezed.dart';
part 'get_users_response_data_user.g.dart';

@freezed
class GetUsersResponseDataUser with _$GetUsersResponseDataUser {
  factory GetUsersResponseDataUser({
    required int id,
    required String userId,
    required String userName,
    required String email,
  }) = _GetUsersResponseDataUser;

  factory GetUsersResponseDataUser.fromJson(Map<String, dynamic> json) =>
      _$GetUsersResponseDataUserFromJson(json);
}
