// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_register_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserRegisterRequestImpl _$$UserRegisterRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$UserRegisterRequestImpl(
      userId: json['loginId'] as String,
      userName: json['name'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$$UserRegisterRequestImplToJson(
        _$UserRegisterRequestImpl instance) =>
    <String, dynamic>{
      'loginId': instance.userId,
      'name': instance.userName,
      'password': instance.password,
    };
