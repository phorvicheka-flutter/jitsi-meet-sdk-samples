// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fcm_notification_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FcmNotificationBodyImpl _$$FcmNotificationBodyImplFromJson(
        Map<String, dynamic> json) =>
    _$FcmNotificationBodyImpl(
      roomName: json['roomName'] as String,
      callerLoginId: json['callerLoginId'] as String,
      callerName: json['callerName'] as String,
      calleeLoginId: json['calleeLoginId'] as String,
      calleeName: json['calleeName'] as String,
      callStatus: json['callStatus'] as String,
      pushMessageId: json['pushMessageId'] as String,
    );

Map<String, dynamic> _$$FcmNotificationBodyImplToJson(
        _$FcmNotificationBodyImpl instance) =>
    <String, dynamic>{
      'roomName': instance.roomName,
      'callerLoginId': instance.callerLoginId,
      'callerName': instance.callerName,
      'calleeLoginId': instance.calleeLoginId,
      'calleeName': instance.calleeName,
      'callStatus': instance.callStatus,
      'pushMessageId': instance.pushMessageId,
    };
