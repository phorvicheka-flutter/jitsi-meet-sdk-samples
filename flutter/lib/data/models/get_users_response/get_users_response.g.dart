// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_users_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetUsersResponseImpl _$$GetUsersResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GetUsersResponseImpl(
      result: json['result'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) =>
              GetUsersResponseDataUser.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GetUsersResponseImplToJson(
        _$GetUsersResponseImpl instance) =>
    <String, dynamic>{
      'result': instance.result,
      'data': instance.data,
    };
