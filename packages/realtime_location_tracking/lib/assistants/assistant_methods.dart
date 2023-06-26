import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:geolocator_platform_interface/geolocator_platform_interface.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:driver_app/assistants/request_assistant.dart';
import 'package:driver_app/config_map.dart';
import 'package:driver_app/datahandler/app_data.dart';
import 'package:driver_app/models/address.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:driver_app/models/all_users.dart';
import 'package:driver_app/models/direction_details.dart';

class AssistantMethods {
  static Future<String> searchCoordinateAddress(
      Position position, BuildContext context) async {
    String placeAddress = "Failed address because not enable billing";
    String st1, st2, st3, st4;
    String url =
        "https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=${getMapKey()}";

    var response = await RequestAssistant.getRequest(url);
    if (response != "Failed") {
      try {
        print("res: ${response["results"][0]["address_components"]}");
        st1 = response["results"][0]["address_components"][0]["long_name"];
        st2 = response["results"][0]["address_components"][1]["long_name"];
        st3 = response["results"][0]["address_components"][2]["long_name"];
        st4 = response["results"][0]["address_components"][3]["long_name"];
        placeAddress = st1 + " " + st2 + " " + st3 + " " + st4;

        Address userPickupAddress = Address(
          placeFormattedAddress: placeAddress,
          placeName: placeAddress,
          placeId: "placeId",
          latitude: position.latitude,
          longitude: position.longitude,
        );

        context.read(pickupLocationProvider).state = userPickupAddress;
      } catch (ex) {
        placeAddress = "Failed address because not enable billing";
      }
    }
    return placeAddress;
  }

  static Future<DirectionDetails?> obtainPlaceDirectionDetails(
    LatLng initialPosition,
    LatLng finalPosition,
  ) async {
    String directionUrl =
        "https://maps.googleapis.com/maps/api/directions/json?origin=${initialPosition.latitude},${initialPosition.longitude}&destination=${finalPosition.latitude},${finalPosition.longitude}&key=${getMapKey()}";

    var res = await RequestAssistant.getRequest(directionUrl);

    if (res == "Failed") {
      return null;
    }

    DirectionDetails directionDetails = DirectionDetails();

    directionDetails.encodedPoints =
        res['routes'][0]['overview_polyline']['points'];
    directionDetails.distanceText =
        res['routes'][0]['legs'][0]['distance']['text'];
    directionDetails.distanceValue =
        res['routes'][0]['legs'][0]['distance']['value'];
    directionDetails.durationText =
        res['routes'][0]['legs'][0]['duration']['text'];
    directionDetails.durationValue =
        res['routes'][0]['legs'][0]['distance']['value'];
    return directionDetails;
  }

  static int calculateFares(DirectionDetails directionDetails) {
    double timeTraveledFare = (directionDetails.durationValue / 60) * 0.2;
    double distanceTraveledFare = (directionDetails.distanceValue / 1000) + 0.2;

    double totalFare = timeTraveledFare + distanceTraveledFare;

    // convert currency if need
    return totalFare.truncate();
  }

  static void getCurrentOnlineUserInfo() async {
    firebaseUser = FirebaseAuth.instance.currentUser;
    String userId = firebaseUser?.uid ?? "";

    DatabaseReference reference =
        FirebaseDatabase.instance.reference().child('users').child(userId);

    reference.once().then((dataSnapshot) {
      if (dataSnapshot.snapshot.value != null) {
        usersCurrentInfo = Users.fromDataSnapshot(dataSnapshot.snapshot);
      }
    });
  }
}
