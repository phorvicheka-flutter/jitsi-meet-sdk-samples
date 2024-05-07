import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:go_router/go_router.dart';
// import '../change_notifiers/auth_change_notifier.dart';
import '../change_notifiers/fcm_token_change_notifier.dart';
// import '../data/models/save_fcm_token_request/save_fcm_token_request.dart';
import 'package:provider/provider.dart';

import '../routes/app_router.dart';
import '../routes/routes.dart';
import '../utils/firebase_service_util.dart';

const String subscribedTopic = 'global';

Future<void> _handleMessageOfBackgroundNotification(
  RemoteMessage message,
) async {
  await Firebase.initializeApp();
  logger.i('_handleMessageOfBackgroundNotification');
  logger.i(message.toMap());
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
        );
        setupToken();

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
