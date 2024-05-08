import 'package:freezed_annotation/freezed_annotation.dart';

part 'fcm_video_call_response_data.freezed.dart';
part 'fcm_video_call_response_data.g.dart';

@freezed
class FcmVideoCallResponseData with _$FcmVideoCallResponseData {
  factory FcmVideoCallResponseData({
    required String roomName,
    required String callerLoginId,
    required String callerName,
    required String calleeLoginId,
    required String calleeName,
    String? callStatus,
    String? callType,
  }) = _FcmVideoCallResponseData;

  factory FcmVideoCallResponseData.fromJson(Map<String, dynamic> json) =>
      _$FcmVideoCallResponseDataFromJson(json);
}
