import 'package:freezed_annotation/freezed_annotation.dart';

part 'save_fcm_token_request.freezed.dart';
part 'save_fcm_token_request.g.dart';

@freezed
class SaveFcmTokenRequest with _$SaveFcmTokenRequest {
  factory SaveFcmTokenRequest({
    required String userId,
    required String fcmToken,
  }) = _SaveFcmTokenRequest;

  factory SaveFcmTokenRequest.fromJson(Map<String, dynamic> json) =>
      _$SaveFcmTokenRequestFromJson(json);
}
