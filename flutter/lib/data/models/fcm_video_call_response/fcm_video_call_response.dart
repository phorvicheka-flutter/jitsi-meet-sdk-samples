import 'package:freezed_annotation/freezed_annotation.dart';

import 'fcm_video_call_response_data.dart';

part 'fcm_video_call_response.freezed.dart';
part 'fcm_video_call_response.g.dart';

@freezed
class FcmVideoCallResponse with _$FcmVideoCallResponse {
  factory FcmVideoCallResponse({
    required FcmVideoCallResponseData data,
  }) = _FcmVideoCallResponse;

  factory FcmVideoCallResponse.fromJson(Map<String, dynamic> json) =>
      _$FcmVideoCallResponseFromJson(json);
}
