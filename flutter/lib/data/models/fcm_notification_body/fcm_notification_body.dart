import 'package:freezed_annotation/freezed_annotation.dart';

part 'fcm_notification_body.freezed.dart';
part 'fcm_notification_body.g.dart';

@freezed
class FcmNotificationBody with _$FcmNotificationBody {
  factory FcmNotificationBody({
    required String roomName,
    required String callerLoginId,
    required String callerName,
    required String calleeLoginId,
    required String calleeName,
    required String callStatus,
    required String pushMessageId,
  }) = _FcmNotificationBody;

  factory FcmNotificationBody.fromJson(Map<String, dynamic> json) =>
      _$FcmNotificationBodyFromJson(json);
}
