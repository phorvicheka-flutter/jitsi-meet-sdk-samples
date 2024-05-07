import 'package:freezed_annotation/freezed_annotation.dart';

part 'fcm_notification_body.freezed.dart';
part 'fcm_notification_body.g.dart';

@freezed
class FcmNotificationBody with _$FcmNotificationBody {
  factory FcmNotificationBody({
    String? roomName,
    String? nameCaller,
  }) = _FcmNotificationBody;

  factory FcmNotificationBody.fromJson(Map<String, dynamic> json) =>
      _$FcmNotificationBodyFromJson(json);
}
