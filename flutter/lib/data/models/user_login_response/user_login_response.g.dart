// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserLoginResponseImpl _$$UserLoginResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$UserLoginResponseImpl(
      result: json['result'] as String,
      data:
          UserLoginResponseData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserLoginResponseImplToJson(
        _$UserLoginResponseImpl instance) =>
    <String, dynamic>{
      'result': instance.result,
      'data': instance.data,
    };
