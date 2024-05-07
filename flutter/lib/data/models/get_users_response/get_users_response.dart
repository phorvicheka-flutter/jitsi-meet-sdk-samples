import 'package:freezed_annotation/freezed_annotation.dart';

import 'get_users_response_data_user.dart';

part 'get_users_response.freezed.dart';
part 'get_users_response.g.dart';

@freezed
class GetUsersResponse with _$GetUsersResponse {
  factory GetUsersResponse({
    required List<GetUsersResponseDataUser> data,
  }) = _GetUsersResponse;

  factory GetUsersResponse.fromJson(Map<String, dynamic> json) =>
      _$GetUsersResponseFromJson(json);
}
