// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_login_reponse_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserLoginResponseDataImpl _$$UserLoginResponseDataImplFromJson(
        Map<String, dynamic> json) =>
    _$UserLoginResponseDataImpl(
      token: json['token'] as String,
      id: json['id'] as String,
      loginId: json['loginId'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$$UserLoginResponseDataImplToJson(
        _$UserLoginResponseDataImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'id': instance.id,
      'loginId': instance.loginId,
      'name': instance.name,
    };
