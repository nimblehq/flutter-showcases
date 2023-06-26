import 'package:driver_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class ProfileTabPage extends StatelessWidget {
  const ProfileTabPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
          onTap: () async {
            // const AndroidNotificationDetails androidPlatformChannelSpecifics =
            //     AndroidNotificationDetails(
            //         'your channel id', 'your channel name',
            //         channelDescription: 'your channel description',
            //         importance: Importance.max,
            //         priority: Priority.high,
            //         ticker: 'ticker');
            // const IOSNotificationDetails iosPlatformChannelSpecifics =
            //     IOSNotificationDetails(subtitle: "From IoS");
            // const NotificationDetails platformChannelSpecifics =
            //     NotificationDetails(
            //         android: androidPlatformChannelSpecifics,
            //         iOS: iosPlatformChannelSpecifics);
            // await flutterLocalNotificationsPlugin.show(
            //     0, 'plain title', 'plain body', platformChannelSpecifics,
            //     payload: 'item x');
          },
          child: Text("This is Profile page")),
    );
  }
}
