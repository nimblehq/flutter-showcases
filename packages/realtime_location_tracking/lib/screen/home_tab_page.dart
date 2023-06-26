import 'dart:async';

import 'package:driver_app/assistants/assistant_methods.dart';
import 'package:driver_app/config_map.dart';
import 'package:driver_app/main.dart';
import 'package:driver_app/notifications/push_notification_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_geofire/flutter_geofire.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeTabPage extends StatefulWidget {
  HomeTabPage({Key? key}) : super(key: key);

  @override
  State<HomeTabPage> createState() => _HomeTabPageState();
}

class _HomeTabPageState extends State<HomeTabPage> {
  Completer<GoogleMapController> _controllerGoogleMap = Completer();

  late GoogleMapController newGoogleMapController;

  final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(16.042406, 108.180583),
    zoom: 14.4746,
  );

  String driverStatus = "Offline now - Go Online";

  Color driverStatusColor = Colors.black;

  bool isDriverAvailable = false;

  @override
  void initState() {
    super.initState();

    getCurrentDriverInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          mapType: MapType.normal,
          myLocationButtonEnabled: true,
          myLocationEnabled: true,
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            _controllerGoogleMap.complete(controller);
            newGoogleMapController = controller;

            locatePosition();
          },
        ),

        // online offline driver container
        Container(
          height: 140,
          width: double.infinity,
          color: Colors.black54,
        ),

        Positioned(
          top: 60,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(driverStatusColor)),
                    onPressed: () {
                      if (!isDriverAvailable) {
                        makeDriverOnlineNow();
                        getLocationLiveUpdates();

                        setState(() {
                          driverStatusColor = Colors.green;
                          driverStatus = "Online Now";
                          isDriverAvailable = true;
                        });
                      } else {
                        makeDriverOfflineNow();
                        setState(() {
                          driverStatusColor = Colors.black;
                          driverStatus = "Offline Now - Go Online";
                          isDriverAvailable = false;
                        });
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.all(17),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            driverStatus,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Icon(
                            Icons.phone_android,
                            color: Colors.white,
                            size: 26,
                          ),
                        ],
                      ),
                    )),
              ),
            ],
          ),
        )
      ],
    );
  }

  late Position currentPosition;

  var geoLocator = GeolocatorPlatform.instance;

  locatePosition() async {
    Position position = await geoLocator.getCurrentPosition();
    currentPosition = position;

    LatLng latLngPosition = LatLng(position.latitude, position.longitude);

    CameraPosition cameraPosition =
        CameraPosition(target: latLngPosition, zoom: 14);
    newGoogleMapController
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

    // String address =
    //     await AssistantMethods.searchCoordinateAddress(position, context);
    // print("This is your address: $address");
  }

  void makeDriverOnlineNow() async {
    Position position = await geoLocator.getCurrentPosition();
    currentPosition = position;

    Geofire.initialize("availableDrivers");
    Geofire.setLocation(currentFirebaseUser?.uid ?? "",
        currentPosition.latitude, currentPosition.longitude);

    rideRequestRef?.set("searching");
    rideRequestRef?.onValue.listen((event) {});
  }

  void getLocationLiveUpdates() {
    homeTabPageStreamSubscription =
        GeolocatorPlatform.instance.getPositionStream().listen((position) {
      currentPosition = position;

      if (isDriverAvailable) {
        Geofire.setLocation(currentFirebaseUser?.uid ?? "", position.latitude,
            position.longitude);
      }
      LatLng latLng = LatLng(position.latitude, position.longitude);
      newGoogleMapController.animateCamera(CameraUpdate.newLatLng(latLng));
    });
  }

  void makeDriverOfflineNow() {
    Geofire.removeLocation(currentFirebaseUser?.uid ?? "");
    rideRequestRef?.onDisconnect();
    rideRequestRef?.remove();
    rideRequestRef = null;
  }

  void getCurrentDriverInfo() {
    currentFirebaseUser = FirebaseAuth.instance.currentUser;
    PushNotificationService pushNotificationService = PushNotificationService();
    pushNotificationService.initialize(context);
    pushNotificationService.getToken();
  }
}
