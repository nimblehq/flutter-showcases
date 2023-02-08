import 'dart:io';

import 'package:driver_app/config_map.dart';
import 'package:driver_app/screen/car_info/car_info_screen.dart';
import 'package:driver_app/screen/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:driver_app/screen/login/login_screen.dart';
import 'package:driver_app/screen/registration/registration_screen.dart';
import 'package:driver_app/screen/search/search_screen.dart';

// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

// initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
  // const AndroidInitializationSettings initializationSettingsAndroid =
  //     AndroidInitializationSettings('user_icon');
  // final IOSInitializationSettings initializationSettingsIOS =
  //     IOSInitializationSettings(
  //         onDidReceiveLocalNotification: onDidReceiveLocalNotification);
  // final InitializationSettings initializationSettings = InitializationSettings(
  //   android: initializationSettingsAndroid,
  //   iOS: initializationSettingsIOS,
  // );
  // await flutterLocalNotificationsPlugin.initialize(initializationSettings,
  //     onSelectNotification: selectNotification);

  // if (Platform.isIOS) {
  //   await flutterLocalNotificationsPlugin
  //       .resolvePlatformSpecificImplementation<
  //           IOSFlutterLocalNotificationsPlugin>()
  //       ?.requestPermissions(
  //         alert: true,
  //         badge: true,
  //         sound: true,
  //       );
  // }

  currentFirebaseUser = FirebaseAuth.instance.currentUser;
  runApp(const MyApp());
}

void onDidReceiveLocalNotification(
    int id, String? title, String? body, String? payload) async {
  print('onDidReceiveLocalNotification: $payload');
}

void selectNotification(String? payload) async {
  print('selectNotification: $payload');
}

DatabaseReference usersRef =
    FirebaseDatabase.instance.reference().child('users');
DatabaseReference driversRef =
    FirebaseDatabase.instance.reference().child('drivers');
DatabaseReference newRequestsRef =
    FirebaseDatabase.instance.reference().child('Ride Requests');
DatabaseReference? rideRequestRef = FirebaseDatabase.instance
    .reference()
    .child('drivers')
    .child(currentFirebaseUser?.uid ?? "")
    .child("newRide");

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Taxi Driver App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: FirebaseAuth.instance.currentUser == null
            ? LoginScreen.idScreen
            : HomeScreen.idScreen,
        routes: {
          RegistrationScreen.idScreen: (context) => RegistrationScreen(),
          LoginScreen.idScreen: (context) => LoginScreen(),
          HomeScreen.idScreen: (context) => HomeScreen(),
          SearchScreen.idScreen: (context) => SearchScreen(),
          CarInfoScreen.idScreen: (context) => CarInfoScreen(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
