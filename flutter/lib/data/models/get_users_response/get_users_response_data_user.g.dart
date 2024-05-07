// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_users_response_data_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetUsersResponseDataUserImpl _$$GetUsersResponseDataUserImplFromJson(
        Map<String, dynamic> json) =>
    _$GetUsersResponseDataUserImpl(
      userId: json['loginId'] as String,
      userName: json['name'] as String,
    );

Map<String, dynamic> _$$GetUsersResponseDataUserImplToJson(
        _$GetUsersResponseDataUserImpl instance) =>
    <String, dynamic>{
      'loginId': instance.userId,
      'name': instance.userName,
    };
