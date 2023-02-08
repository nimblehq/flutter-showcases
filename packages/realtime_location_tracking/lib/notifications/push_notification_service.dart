import 'dart:io';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:driver_app/config_map.dart';
import 'package:driver_app/main.dart';
import 'package:driver_app/models/ride_details.dart';
import 'package:driver_app/notifications/notification_dialog.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PushNotificationService {
  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  Future initialize(BuildContext context) async {
    firebaseMessaging.setAutoInitEnabled(true);
    FirebaseMessaging.onBackgroundMessage((message) async =>
        retrieveRideRequestInfo(getRideRequestId(message.data), context));
    FirebaseMessaging.onMessage.listen((message) async =>
        retrieveRideRequestInfo(getRideRequestId(message.data), context));
    FirebaseMessaging.onMessageOpenedApp.listen((message) async =>
        retrieveRideRequestInfo(getRideRequestId(message.data), context));
  }

  Future getToken() async {
    String token = await firebaseMessaging.getToken() ?? "";
    print("This is token: $token");
    driversRef.child(currentFirebaseUser?.uid ?? "").child("token").set(token);

    firebaseMessaging.subscribeToTopic("alldrivers");
    firebaseMessaging.subscribeToTopic("allusers");
  }

  String getRideRequestId(Map<String, dynamic> message) {
    String rideRequestId;
    if (Platform.isAndroid) {
      rideRequestId = message['data']['ride_request_id'];
    } else {
      // ios has data structure
      rideRequestId = message['ride_request_id'];
    }
    print("This is ride request id: $rideRequestId");
    return rideRequestId;
  }

  void retrieveRideRequestInfo(String rideRequestId, BuildContext context) {
    newRequestsRef
        .child(rideRequestId)
        .once()
        .then((dataSnapshot) {
      // if (dataSnapshot.value! - null) {
      //   assetAudioPlayer.open(Audio('assets/sounds/alert.mp3'));
      //   assetAudioPlayer.play();
      //   double pickUpLocationLat =
      //       double.parse(dataSnapshot.value['pickup']['latitude'].toString());
      //   double pickUpLocationLng =
      //       double.parse(dataSnapshot.value['pickup']['longitude'].toString());
      //   String pickUpAddress = dataSnapshot.value['pickup_address'].toString();

      //   double dropOffLocationLat =
      //       double.parse(dataSnapshot.value['dropoff']['latitude'].toString());
      //   double dropOffLocationLng =
      //       double.parse(dataSnapshot.value['dropoff']['longitude'].toString());
      //   String dropOffAddress =
      //       dataSnapshot.value['dropoff_address'].toString();

      //   String paymentMethod = dataSnapshot.value['payment_method'].toString();

      //   RideDetails rideDetails = RideDetails();
      //   rideDetails.rideRequestId = rideRequestId;
      //   rideDetails.pickUpAddress = pickUpAddress;
      //   rideDetails.dropOffAddress = dropOffAddress;
      //   rideDetails.pickup = LatLng(pickUpLocationLat, pickUpLocationLng);
      //   rideDetails.dropOff = LatLng(dropOffLocationLat, dropOffLocationLng);
      //   rideDetails.paymentMethod = paymentMethod;

      //   showDialog(
      //     context: context,
      //     barrierDismissible: false,
      //     builder: (context) => NotificationDialog(rideDetails),
      //   );
      // }
    });
  }
}
