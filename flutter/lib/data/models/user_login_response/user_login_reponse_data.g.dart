// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_login_reponse_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserLoginResponseDataImpl _$$UserLoginResponseDataImplFromJson(
        Map<String, dynamic> json) =>
    _$UserLoginResponseDataImpl(
      user:
          UserLoginResponseUser.fromJson(json['user'] as Map<String, dynamic>),
      token: json['token'] as String,
    );

Map<String, dynamic> _$$UserLoginResponseDataImplToJson(
        _$UserLoginResponseDataImpl instance) =>
    <String, dynamic>{
      'user': instance.user,
      'token': instance.token,
    };
