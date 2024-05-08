import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:logger/logger.dart';

var logger = Logger();

// Parameters for configuring flutter_local_notifications
const String channelId = 'high_importance_channel';
const String channelName = 'High Importance Notifications';
const String channelDescription =
    'This channel is used for important notifications.';

abstract class FirebaseServiceUtil {
  static void initializeNotification({
    String? topic,
    void Function(RemoteMessage)? handleInteractedMessage,
    void Function(RemoteMessage)? handleMessageOfForegroundNotification,
    void Function(NotificationResponse)? onDidReceiveNotificationResponse,
    Future<void> Function(RemoteMessage)? handleMessageOfBackgroundNotification,
    bool isUseFlutterLocalNotificationsPlugin = true,
  }) {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    _requestPermission(messaging);

    // handle the users interaction when the application opens
    if (handleInteractedMessage != null) {
      _setupInteractedMessage(handleInteractedMessage);
    }

    // subscribe to a topic
    if (topic != null) {
      _subscribeToTopic(topic);
    }

    // setup foreground notification
    _setupForegroundNotification(
      messaging,
      handleMessageOfForegroundNotification,
      onDidReceiveNotificationResponse,
      isUseFlutterLocalNotificationsPlugin:
          isUseFlutterLocalNotificationsPlugin,
    );

    // setup background notification
    if (handleMessageOfBackgroundNotification != null) {
      _setupBackgroundNotification(handleMessageOfBackgroundNotification);
    }
  }

  /// Requesting permission (Apple & Web)
  static Future<void> _requestPermission(FirebaseMessaging messaging) async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      logger.i('User granted permission: ${settings.authorizationStatus}');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      logger.i(
        'User granted provisional permission: ${settings.authorizationStatus}',
      );
    } else {
      logger.i('User declined or has not accepted permission');
    }
  }

  /// Subscribe to a topic
  static Future<void> _subscribeToTopic(String topic) async {
    await FirebaseMessaging.instance.subscribeToTopic(topic);
  }

  /// Unsubscribe from a topic
  // ignore: unused_element
  static Future<void> _unsubscribeFromTopic(String topic) async {
    await FirebaseMessaging.instance.subscribeToTopic(topic);
  }

  /// Setup background notification
  static void _setupBackgroundNotification(
    Future<void> Function(RemoteMessage) handleMessageOfBackgroundNotification,
  ) {
    FirebaseMessaging.onBackgroundMessage(
      handleMessageOfBackgroundNotification,
    );
  }

  /// Handle the users interaction when the application opens
  static Future<void> _setupInteractedMessage(
    void Function(RemoteMessage) handleInteractedMessage,
  ) async {
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      handleInteractedMessage(initialMessage);
    }

    FirebaseMessaging.onMessageOpenedApp.listen(handleInteractedMessage);
  }

  /// Advanced usage - setup foreground notification
  static Future<void> _setupForegroundNotification(
    FirebaseMessaging messaging,
    void Function(RemoteMessage)? handleMessageOfForegroundNotification,
    void Function(NotificationResponse)? onDidReceiveNotificationResponse, {
    bool isUseFlutterLocalNotificationsPlugin = true,
  }) async {
    if (Platform.isIOS) {
      // Foreground Notification - iOS Configuration
      await messaging.setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
    }

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      // If `onMessage` is triggered with a notification, construct our own
      // local notification to show to users using the created channel.
      if (notification != null && android != null) {
        if (isUseFlutterLocalNotificationsPlugin) {
          const AndroidNotificationChannel channel = AndroidNotificationChannel(
            channelId,
            channelName,
            description: channelDescription,
            importance: Importance.max,
          );

          final FlutterLocalNotificationsPlugin
              flutterLocalNotificationsPlugin =
              FlutterLocalNotificationsPlugin();
          // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
          const AndroidInitializationSettings initializationSettingsAndroid =
              AndroidInitializationSettings('app_icon');
          const InitializationSettings initializationSettings =
              InitializationSettings(
            android: initializationSettingsAndroid,
          );
          flutterLocalNotificationsPlugin.initialize(
            initializationSettings,
            onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
          );

          await flutterLocalNotificationsPlugin
              .resolvePlatformSpecificImplementation<
                  AndroidFlutterLocalNotificationsPlugin>()
              ?.createNotificationChannel(channel);

          flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channelDescription: channel.description,
                icon: android.smallIcon,
              ),
            ),
          );
        }

        if (handleMessageOfForegroundNotification != null) {
          handleMessageOfForegroundNotification(message);
        }
      }
    });
  }
}
