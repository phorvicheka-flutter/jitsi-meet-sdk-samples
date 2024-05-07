// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_register_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserRegisterRequestImpl _$$UserRegisterRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$UserRegisterRequestImpl(
      userId: json['userId'] as String,
      userName: json['userName'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$$UserRegisterRequestImplToJson(
        _$UserRegisterRequestImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'userName': instance.userName,
      'email': instance.email,
      'password': instance.password,
    };
