// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_users_response_data_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetUsersResponseDataUserImpl _$$GetUsersResponseDataUserImplFromJson(
        Map<String, dynamic> json) =>
    _$GetUsersResponseDataUserImpl(
      id: (json['id'] as num).toInt(),
      userId: json['userId'] as String,
      userName: json['userName'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$$GetUsersResponseDataUserImplToJson(
        _$GetUsersResponseDataUserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'userName': instance.userName,
      'email': instance.email,
    };
