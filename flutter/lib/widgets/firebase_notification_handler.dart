import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:go_router/go_router.dart';
// import '../change_notifiers/auth_change_notifier.dart';
import '../change_notifiers/auth_change_notifier.dart';
import '../change_notifiers/fcm_call_change_notifier.dart';
import '../change_notifiers/fcm_token_change_notifier.dart';
// import '../data/models/save_fcm_token_request/save_fcm_token_request.dart';
import 'package:provider/provider.dart';

import '../data/enums/notification_type.dart';
import '../data/models/user/user.dart';
import '../routes/app_router.dart';
import '../routes/routes.dart';
import '../utils/callkit_incoming_util.dart';
import '../utils/firebase_service_util.dart';
import 'package:logger/logger.dart';

import '../utils/jitsi_meet_util.dart';

var logger = Logger();

const String subscribedTopic = 'global';

@pragma('vm:entry-point')
Future<void> _handleMessageOfBackgroundNotification(
  RemoteMessage message,
) async {
  await Firebase.initializeApp();
  logger.i('_handleMessageOfBackgroundNotification');
  logger.i(message.toMap());
  final String? notificationBody = message.notification?.body;
  final notificationType =
      FirebaseServiceUtil.getNotificationType(notificationBody);
  switch (notificationType) {
    //#region Notification for callee only
    case NotificationType.videoCall:
      // Handle video call notification
      // Show CallkitIncoming only if not in call
      bool hasActiveCall = await CallkitIncomingUtil.hasActiveCall();
      if (!hasActiveCall) {
        CallkitIncomingUtil.showCallkitIncoming(
          notificationBody!,
        );
      } else {
        logger.d('handleMessageOfForegroundNotification: user is in call!!!');
      }
      break;
    //#endregion
    //#region Notification for caller only
    case NotificationType.videoRespondAccepted:
      // Handle video respond accepted notification
      // Case: not Applicable or never happen in background
      break;
    case NotificationType.videoRespondRejected:
      // Handle video respond rejected notification
      // Case: not Applicable or never happen in background
      break;
    //#endregion
    //#region Notification for botth callee and caller
    case NotificationType.videoTerminate:
      // Handle video terminate notification
      CallkitIncomingUtil.endAllCalls();
      break;
    case NotificationType.unknown:
      // Handle unknown notification type
      break;
    //#endregion
  }

  if (notificationBody != null && notificationBody.isNotEmpty) {
    CallkitIncomingUtil.showCallkitIncoming(
      notificationBody,
    );
  }
}

class FirebaseNotificationHandler extends HookWidget {
  final Widget child;

  const FirebaseNotificationHandler({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    /* String? userId = context.select(
      (AuthChangeNotifier authChangeNotifier) =>
          authChangeNotifier.user?.userId,
    );

    String? fcmToken = context.select(
      (FcmTokenChangeNotifier fcmTokenChangeNotifier) =>
          fcmTokenChangeNotifier.fcmToken,
    );

    bool isSucceedSaveFcmToken = context.select(
      (FcmTokenChangeNotifier fcmTokenChangeNotifier) =>
          fcmTokenChangeNotifier.isSucceedSaveFcmToken,
    ); */
    User? user = context.select(
      (AuthChangeNotifier authChangeNotifier) => authChangeNotifier.user,
    );

    Future<void> checkAndNavigationCallingPage() async {
      final currentCall = await CallkitIncomingUtil.getCurrentCall();
      if (currentCall != null) {
        // join room of Jitsi Meet
        final roomName = currentCall['extra']['roomName'];
        final callId = currentCall['id'];
        if (roomName != null && callId != null) {
          JitsiMeetUtil.joinRoom(
            roomName: roomName,
            user: user,
            callbackOnReadyToClose: () {
              CallkitIncomingUtil.endCurrentCall(callId);
              logger.d('>>> Called: CallkitIncomingUtil.endCurrentCall.');
              // call this method to make sure there is no any calls left
              CallkitIncomingUtil.endAllCalls();
              Provider.of<FcmCallChangeNotifier>(context, listen: false)
                  .createFcmVideoTerminate(roomName);
            },
          );
        }
      }
    }

    useEffect(
      () {
        checkAndNavigationCallingPage();
        return null;
      },
      const [],
    );

    useOnAppLifecycleStateChange((previous, current) {
      if (current == AppLifecycleState.resumed) {
        logger.d(
          'AppLifecycleState.resumed',
        );
        //Check call when open app from background
        checkAndNavigationCallingPage();
      }
      if (current == AppLifecycleState.paused) {
        //Check call when open app from background
        logger.d(
          'AppLifecycleState.paused',
        );
      }
      if (current == AppLifecycleState.detached) {
        logger.d(
          'AppLifecycleState.detached - onDestroy - need to call API Video terminate: DELETE /video/room/:roomName',
        );
      }
    });

    void navigatePushToRegisterPage() {
      logger.i('Navigate to RegisterRoute.');
      // Can not use const RegisterRoute().push(context) because 'No GoRouter found in context'
      // const RegisterRoute().push(context);
      final GoRouter goRouter =
          Provider.of<AppRouter>(context, listen: false).router;
      final String registerLoc = const RegisterRoute().location;
      final isCurrentPageNotRegisterPage =
          GoRouterState.of(context).uri.toString() != registerLoc;
      if (isCurrentPageNotRegisterPage) {
        goRouter.push(registerLoc);
      }
    }

    void handleMessage(RemoteMessage message) {
      // if topic is set to 'global' at firebase console messaging: Campaigns
      // => message.from is /topics/global
      final bool isFromTopic = message.from?.contains('topic') ?? false;
      if (isFromTopic) {
        // Message is sent to a topic
        logger.i('Received topic message: $message');
      } else {
        // Message is sent to a specific user device
        logger.i('Received user message: $message');
      }
    }

    void handleInteractedMessage(RemoteMessage message) {
      logger.i('_handleInteractedMessage');
      logger.i(message.toMap());
      handleMessage(message);

      // It is assumed that all messages contain a data field with the key 'type' of value "signup"
      if (message.data['type'] == 'signup') {
        navigatePushToRegisterPage();
      }
    }

    void handleMessageOfForegroundNotification(
      RemoteMessage message,
    ) async {
      logger.i('_handleMessageOfForegroundNotification');
      logger.i(message.toMap());
      final String? notificationBody = message.notification?.body;
      final notificationType =
          FirebaseServiceUtil.getNotificationType(notificationBody);
      switch (notificationType) {
        //#region Notification for callee only
        case NotificationType.videoCall:
          logger.d('NotificationType.videoCall');
          // Handle video call notification
          // Show CallkitIncoming only if not in call
          bool hasActiveCall = await CallkitIncomingUtil.hasActiveCall();
          if (!hasActiveCall) {
            CallkitIncomingUtil.showCallkitIncoming(
              notificationBody!,
            );
          } else {
            logger
                .d('handleMessageOfForegroundNotification: user is in call!!!');
          }
          break;
        //#endregion
        //#region Notification for caller only
        case NotificationType.videoRespondAccepted:
          logger.d('NotificationType.videoRespondAccepted');
          // Handle video respond accepted notification
          // create and join room of Jitsi Meet
          final fcmVideoCallResponseData =
              Provider.of<FcmCallChangeNotifier>(context, listen: false)
                  .fcmVideoCallResponseData;
          String? roomName = fcmVideoCallResponseData?.roomName;
          if (roomName != null) {
            final String currentLocation =
                Provider.of<AppRouter>(context, listen: false)
                    .getCurrentLocation(context);
            if (currentLocation.startsWith(pathOutgoingCall)) {
              final GoRouter goRouter =
                  Provider.of<AppRouter>(context, listen: false).router;
              goRouter.pop(context);
            }
            JitsiMeetUtil.joinRoom(
              roomName: roomName,
              user: user,
              callbackOnReadyToClose: () {
                // call this method to make sure there is no any calls left
                CallkitIncomingUtil.endAllCalls();
                Provider.of<FcmCallChangeNotifier>(context, listen: false)
                    .createFcmVideoTerminate(roomName);
              },
            );
          }
          break;
        case NotificationType.videoRespondRejected:
          logger.d('NotificationType.videoRespondRejected');
          // Handle video respond rejected notification
          // At caller side
          // -> check if at outgoing_call_page, navigate pop of outgoing_call_page
          // which will call method enCall (send request to "Video terminate" Api)
          final String currentLocation =
              Provider.of<AppRouter>(context, listen: false)
                  .getCurrentLocation(context);
          if (currentLocation.startsWith(pathOutgoingCall)) {
            final GoRouter goRouter =
                Provider.of<AppRouter>(context, listen: false).router;
            goRouter.pop(context);
          }
          break;
        //#endregion
        //#region Notification for botth callee and caller
        case NotificationType.videoTerminate:
          logger.d('NotificationType.videoTerminate');
          CallkitIncomingUtil.endAllCalls();
          break;
        case NotificationType.unknown:
          // Handle unknown notification type
          break;
        //#endregion
      }
    }

    void onDidReceiveNotificationResponse(
      NotificationResponse notificationResponse,
    ) {
      logger.i('_onDidReceiveNotificationResponse');
      logger.i(notificationResponse);
      navigatePushToRegisterPage();
    }

    void setFcmToken(String? token) {
      FcmTokenChangeNotifier fcmTokenChangeNotifier =
          Provider.of<FcmTokenChangeNotifier>(context, listen: false);

      fcmTokenChangeNotifier.setFcmToken(token);
    }

    Future<void> setupToken() async {
      // Get the token each time the application loads
      String? token = await FirebaseMessaging.instance.getToken();

      // Save the initial token to FcmTokenChangeNotifier
      setFcmToken(token);
      logger.i('setupToken() - Token:');
      logger.i(token);

      // Any time the token refreshes, store this in the database too.
      FirebaseMessaging.instance.onTokenRefresh.listen(setFcmToken);
    }

    /* Future<void> saveFcmTokenAndReset(
      String userId,
      String fcmToken,
    ) async {
      FcmTokenChangeNotifier fcmTokenChangeNotifier =
          Provider.of<FcmTokenChangeNotifier>(context, listen: false);
      fcmTokenChangeNotifier.saveFcmToken(
        SaveFcmTokenRequest(userId: userId, fcmToken: fcmToken),
      );
    } */

    useEffect(
      () {
        FirebaseServiceUtil.initializeNotification(
          topic: subscribedTopic,
          handleInteractedMessage: handleInteractedMessage,
          handleMessageOfForegroundNotification:
              handleMessageOfForegroundNotification,
          handleMessageOfBackgroundNotification:
              _handleMessageOfBackgroundNotification,
          onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
          isUseFlutterLocalNotificationsPlugin: false,
        );
        setupToken();
        debugPrint(
          'FirebaseNotificationHandler: Successfully call FirebaseServiceUtil.initializeNotification.',
        );

        return null;
      },
      [],
    );

    /* useEffect(
      () {
        if (!isSucceedSaveFcmToken) {
          bool isNeedToSaveFcmToken = fcmToken != null && userId != null;
          if (isNeedToSaveFcmToken) {
            Future.microtask(() => saveFcmTokenAndReset(userId, fcmToken));
          }
        }

        return null;
      },
      [isSucceedSaveFcmToken, userId, fcmToken],
    ); */

    return child;
  }
}
