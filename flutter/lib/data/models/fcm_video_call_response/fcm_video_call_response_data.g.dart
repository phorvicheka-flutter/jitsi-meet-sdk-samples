// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fcm_video_call_response_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FcmVideoCallResponseDataImpl _$$FcmVideoCallResponseDataImplFromJson(
        Map<String, dynamic> json) =>
    _$FcmVideoCallResponseDataImpl(
      roomName: json['roomName'] as String,
      callerLoginId: json['callerLoginId'] as String,
      callerName: json['callerName'] as String,
      calleeLoginId: json['calleeLoginId'] as String,
      calleeName: json['calleeName'] as String,
      callStatus: json['callStatus'] as String?,
      callType: json['callType'] as String?,
    );

Map<String, dynamic> _$$FcmVideoCallResponseDataImplToJson(
        _$FcmVideoCallResponseDataImpl instance) =>
    <String, dynamic>{
      'roomName': instance.roomName,
      'callerLoginId': instance.callerLoginId,
      'callerName': instance.callerName,
      'calleeLoginId': instance.calleeLoginId,
      'calleeName': instance.calleeName,
      'callStatus': instance.callStatus,
      'callType': instance.callType,
    };
