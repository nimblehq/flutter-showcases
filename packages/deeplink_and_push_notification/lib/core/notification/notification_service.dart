import 'dart:io';

import 'package:deeplink_and_push_notification/core/router/app_router.dart';
import 'package:deeplink_and_push_notification/core/router/navigation_manager.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final notificationServiceProvider = Provider(
    (ref) => NotificationService(ref.watch(navigationManagerProvider)));

class NotificationService {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  final NavigationManager _navigationManager;

  NotificationService(this._navigationManager);

  static const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails('channelId', 'channelName');

  static const IOSNotificationDetails iOSPlatformChannelSpecifics =
      IOSNotificationDetails();

  static const NotificationDetails platformChannelSpecifics =
      NotificationDetails(
          android: androidPlatformChannelSpecifics,
          iOS: iOSPlatformChannelSpecifics);

  Future<void> init() async {
    final AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('user_icon');

    final IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
      onDidReceiveLocalNotification: onDidReceiveLocalNotification,
    );

    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsIOS,
            macOS: null);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: selectNotification);

    if (Platform.isIOS) {
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );
    }
  }

  void onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) async {
    print('onDidReceiveLocalNotification: $payload');
  }

  void selectNotification(String? payload) async {
    //Handle notification tapped logic here
    if (payload != null) {
      print('payload is: $payload');
      // Assume this is deeplink
      _navigationManager.push(RoutePath.fromLocation(payload));
    }
  }
}
