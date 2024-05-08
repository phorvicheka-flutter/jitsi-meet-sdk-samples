import 'dart:async';
import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_callkit_incoming/entities/android_params.dart';
import 'package:flutter_callkit_incoming/entities/call_event.dart';
import 'package:flutter_callkit_incoming/entities/call_kit_params.dart';
import 'package:flutter_callkit_incoming/entities/ios_params.dart';
import 'package:flutter_callkit_incoming/entities/notification_params.dart';
import 'package:flutter_callkit_incoming/flutter_callkit_incoming.dart';
import 'package:logger/logger.dart';
import 'package:uuid/uuid.dart';

import '../data/models/fcm_notification_body/fcm_notification_body.dart';

var logger = Logger();

abstract class CallkitIncomingUtil {
  /// Subscribe to a topic
  static Future<void> subscribeToTopic(String topic) async {
    await FirebaseMessaging.instance.subscribeToTopic(topic);
  }

  static Future<void> showCallkitIncoming(
    String notificationBody,
  ) async {
    final uuid = const Uuid().v4();
    String appName = 'jitsi_meet_sample_app';
    String avatar = 'https://i.pravatar.cc/100';
    int type = 0;
    String userId = 'userId';

    final notificationBodyAsMap = jsonDecode(notificationBody);
    FcmNotificationBody fcmNotificationBody =
        FcmNotificationBody.fromJson(notificationBodyAsMap);
    final nameCaller = fcmNotificationBody.nameCaller ?? 'nameCaller';
    final roomName = fcmNotificationBody.roomName ?? 'roomName';

    final params = CallKitParams(
      id: uuid,
      nameCaller: nameCaller,
      appName: appName,
      avatar: avatar,
      // handle: '0123456789',
      type: type,
      duration: 30000,
      textAccept: 'Accept',
      textDecline: 'Decline',
      missedCallNotification: const NotificationParams(
        showNotification: true,
        isShowCallback: true,
        subtitle: 'Missed call',
        callbackText: 'Call back',
      ),
      extra: <String, dynamic>{'userId': userId, 'roomName': roomName},
      // headers: <String, dynamic>{'apiKey': 'Abc@123!', 'platform': 'flutter'},
      android: const AndroidParams(
        isCustomNotification: true,
        isShowLogo: false,
        ringtonePath: 'system_ringtone_default',
        backgroundColor: '#0955fa',
        backgroundUrl: 'assets/test.png',
        actionColor: '#4CAF50',
        textColor: '#ffffff',
      ),
      ios: const IOSParams(
        iconName: 'CallKitLogo',
        handleType: '',
        supportsVideo: true,
        maximumCallGroups: 2,
        maximumCallsPerCallGroup: 1,
        audioSessionMode: 'default',
        audioSessionActive: true,
        audioSessionPreferredSampleRate: 44100.0,
        audioSessionPreferredIOBufferDuration: 0.005,
        supportsDTMF: true,
        supportsHolding: true,
        supportsGrouping: false,
        supportsUngrouping: false,
        ringtonePath: 'system_ringtone_default',
      ),
    );
    await FlutterCallkitIncoming.showCallkitIncoming(params);
  }

  static Future<dynamic> getCurrentCall() async {
    //check current call from pushkit if possible
    final calls = await FlutterCallkitIncoming.activeCalls();
    if (calls is List) {
      if (calls.isNotEmpty) {
        logger.d('getCurrentCall - calls: $calls');
        return calls[0];
      } else {
        return null;
      }
    }
  }

  static StreamSubscription<CallEvent?>? listenerEvent({
    void Function(CallEvent)? callbackOnActionCallIncoming,
    void Function(CallEvent)? callbackOnActionCallStart,
    void Function(CallEvent)? callbackOnActionCallAccept,
    void Function(CallEvent)? callbackOnActionCallDecline,
    void Function(CallEvent)? callbackOnActionCallEnded,
    void Function(CallEvent)? callbackOnActionCallTimeout,
    void Function(CallEvent)? callbackOnCallCallback,
    void Function(CallEvent)? callback,
  }) {
    try {
      return FlutterCallkitIncoming.onEvent.listen((event) async {
        logger.d('listenerEvent: $event');
        switch (event!.event) {
          case Event.actionCallIncoming:
            // received an incoming call
            if (callbackOnActionCallIncoming != null) {
              callbackOnActionCallIncoming(event);
            }
            break;
          case Event.actionCallStart:
            // started an outgoing call
            // show screen calling in Flutter
            if (callbackOnActionCallStart != null) {
              callbackOnActionCallStart(event);
            }
            break;
          case Event.actionCallAccept:
            // accepted an incoming call
            if (callbackOnActionCallAccept != null) {
              callbackOnActionCallAccept(event);
            }
            break;
          case Event.actionCallDecline:
            // declined an incoming call
            // await requestHttp("ACTION_CALL_DECLINE_FROM_DART");
            if (callbackOnActionCallDecline != null) {
              callbackOnActionCallDecline(event);
            }
            break;
          case Event.actionCallEnded:
            // ended an incoming/outgoing call
            if (callbackOnActionCallEnded != null) {
              callbackOnActionCallEnded(event);
            }
            break;
          case Event.actionCallTimeout:
            // missed an incoming call
            if (callbackOnActionCallTimeout != null) {
              callbackOnActionCallTimeout(event);
            }
            break;
          case Event.actionCallCallback:
            // only Android - click action `Call back` from missed call notification
            if (callbackOnCallCallback != null) {
              callbackOnCallCallback(event);
            }
            break;
          case Event.actionCallToggleHold:
            // TODO: only iOS
            break;
          case Event.actionCallToggleMute:
            // TODO: only iOS
            break;
          case Event.actionCallToggleDmtf:
            // TODO: only iOS
            break;
          case Event.actionCallToggleGroup:
            // TODO: only iOS
            break;
          case Event.actionCallToggleAudioSession:
            // TODO: only iOS
            break;
          case Event.actionDidUpdateDevicePushTokenVoip:
            // TODO: only iOS
            break;
          case Event.actionCallCustom:
            break;
        }
        if (callback != null) {
          callback(event);
        }
      });
    } on Exception catch (e) {
      logger.e(e);
      return null;
    }
  }

  static Future<void> endAllCalls() async {
    await FlutterCallkitIncoming.endAllCalls();
  }

  static Future<void> endCurrentCall(String currentUuid) async {
    await FlutterCallkitIncoming.endCall(currentUuid);
  }

  static Future<bool> hasActiveCall() async {
    //check current call from pushkit if possible
    final call = await getCurrentCall();
    return call != null;
  }
}
