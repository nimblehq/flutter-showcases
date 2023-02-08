import 'dart:async';
import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator_platform_interface/geolocator_platform_interface.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:driver_app/assistants/assistant_methods.dart';
import 'package:driver_app/config_map.dart';
import 'package:driver_app/datahandler/app_data.dart';
import 'package:driver_app/models/direction_details.dart';
import 'package:driver_app/screen/login/login_screen.dart';
import 'package:driver_app/widgets/divider.dart';

class HomeScreen1 extends StatefulWidget {
  static const String idScreen = "home";
  HomeScreen1({Key? key}) : super(key: key);

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(16.042406, 108.180583),
    zoom: 14.4746,
  );

  @override
  State<HomeScreen1> createState() => _HomeScreen1State();
}

class _HomeScreen1State extends State<HomeScreen1>
    with TickerProviderStateMixin {
  final colorizeColors = [
    Colors.green,
    Colors.purple,
    Colors.pink,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];

  final colorizeTextStyle = TextStyle(
    fontSize: 25.0,
  );

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  Completer<GoogleMapController> _controllerGoogleMap = Completer();

  late GoogleMapController newGoogleMapController;

  late Position currentPosition;

  var geoLocator = GeolocatorPlatform.instance;

  List<LatLng> pLineCoordinates = [];
  Set<Polyline> polylineSet = {};

  Set<Polygon> polygonSet = {};
  List<LatLng> polygonLatLngs = [];

  Set<Marker> markerSet = {};
  Set<Circle> circleSet = {};

  double rideDetailContainerHeight = 0;
  double requestRideContainerHeight = 0;
  double searchContaierHeight = 300;

  bool drawerOpen = true;

  void displayRequestRideContainer() {
    setState(() {
      requestRideContainerHeight = 250;
      rideDetailContainerHeight = 0;
      bottomPaddingOfMap = 230;
      drawerOpen = true;
    });

    saveRideRequest();
  }

  resetApp() {
    setState(() {
      drawerOpen = true;
      searchContaierHeight = 300;
      rideDetailContainerHeight = 0;
      bottomPaddingOfMap = 230;
      requestRideContainerHeight = 0;

      polygonSet.clear();
      polylineSet.clear();
      markerSet.clear();
      circleSet.clear();
      pLineCoordinates.clear();
    });

    locatePosition();
  }

  void displayRideDetailsContainer() async {
    await getPlaceDirection();

    setState(() {
      searchContaierHeight = 0;
      rideDetailContainerHeight = 240;
      bottomPaddingOfMap = 230;
      drawerOpen = false;
    });
  }

  DirectionDetails? tripDirectionDetail;

  double bottomPaddingOfMap = 0;

  locatePosition() async {
    Position position = await geoLocator.getCurrentPosition();
    currentPosition = position;

    LatLng latLngPosition = LatLng(position.latitude, position.longitude);

    CameraPosition cameraPosition =
        CameraPosition(target: latLngPosition, zoom: 14);
    newGoogleMapController
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

    String address =
        await AssistantMethods.searchCoordinateAddress(position, context);
    print("This is your address: $address");
  }

  @override
  void initState() {
    super.initState();

    AssistantMethods.getCurrentOnlineUserInfo();
  }

  DatabaseReference? rideRequestRef;
  void saveRideRequest() {
    rideRequestRef =
        FirebaseDatabase.instance.reference().child("Ride Requests").push();

    var pickUp = context.read(pickupLocationProvider.notifier).state;
    var dropOff = context.read(dropoffLocationProvider.notifier).state;

    Map pickUpLocMap = {
      "latitude": pickUp.latitude.toString(),
      "longitude": pickUp.longitude.toString(),
    };

    Map dropOffLocMap = {
      "latitude": dropOff.latitude.toString(),
      "longitude": dropOff.longitude.toString(),
    };

    Map rideInfoMap = {
      "driver_id": "waiting",
      "payment_method": "cash",
      "pickup": pickUpLocMap,
      "dropoff": dropOffLocMap,
      "created_at": DateTime.now().toString(),
      "rider_name": usersCurrentInfo?.name ?? "",
      "rider_phone": usersCurrentInfo?.phone ?? "",
      "pickup_address": pickUp.placeName,
      "dropoff_address": dropOff.placeName,
    };

    rideRequestRef?.set(rideInfoMap);
  }

  void cancelRideRequest() {
    rideRequestRef?.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Home screen'),
      ),
      drawer: Container(
        color: Colors.white,
        width: 255,
        child: Drawer(
          child: ListView(
            children: [
              Container(
                height: 165,
                child: DrawerHeader(
                    decoration: BoxDecoration(color: Colors.white),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/user_icon.png',
                          height: 65,
                          width: 65,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Profile Name',
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text('Visit Profile'),
                          ],
                        )
                      ],
                    )),
              ),
              DividerWidget(),
              SizedBox(height: 12),
              // Drawer body controller
              ListTile(
                leading: Icon(Icons.history),
                title: Text(
                  'History',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text(
                  'Visit Profile',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              ListTile(
                leading: Icon(Icons.info),
                title: Text(
                  'About',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  await FirebaseAuth.instance.signOut();

                  Navigator.pushNamedAndRemoveUntil(
                      context, LoginScreen.idScreen, (route) => false);
                },
                child: ListTile(
                  leading: Icon(Icons.info),
                  title: Text(
                    'Sign Out',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          GoogleMap(
            padding: EdgeInsets.only(bottom: bottomPaddingOfMap),
            mapType: MapType.normal,
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
            zoomGesturesEnabled: true,
            zoomControlsEnabled: true,
            polylines: polylineSet,
            polygons: polygonSet,
            markers: markerSet,
            circles: circleSet,
            initialCameraPosition: HomeScreen1._kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controllerGoogleMap.complete(controller);
              newGoogleMapController = controller;

              setState(() {
                bottomPaddingOfMap = 300;
              });

              locatePosition();
            },
            onTap: (latLgn) {
              setState(() {
                polygonLatLngs.add(latLgn);
                drawPolygon();
              });
            },
          ),
          // HamburgerButton for Drawer
          Positioned(
            top: 38,
            left: 22,
            child: GestureDetector(
              onTap: () {
                if (drawerOpen) {
                  scaffoldKey.currentState?.openDrawer();
                } else {
                  resetApp();
                }
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 6,
                        spreadRadius: 0.5,
                        offset: Offset(0.7, 0.7),
                      )
                    ]),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    (drawerOpen) ? Icons.menu : Icons.close,
                    color: Colors.black,
                  ),
                  radius: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void drawPolygon() {
    polygonSet.add(Polygon(
      polygonId: const PolygonId('polygonId'),
      points: polygonLatLngs.length > 3
          ? calculatePolygon(polygonLatLngs)
          : polygonLatLngs,
      strokeWidth: 2,
      strokeColor: Colors.yellow,
      fillColor: Colors.yellow.withOpacity(0.15),
    ));
  }

  List<LatLng> calculatePolygon(List<LatLng> points) {
    final copiedPoints = points.toList();

    return convexHull(copiedPoints, copiedPoints.length);
  }

  var p0 = LatLng(0, 0);

  //////////// calculate points
  LatLng nextToTop(List<LatLng> ps) {
    return ps[ps.length - 2];
  }

  double distSq(LatLng p1, LatLng p2) {
    return ((p1.latitude - p2.latitude) * (p1.latitude - p2.latitude) +
        (p1.longitude - p2.longitude) * (p1.longitude - p2.longitude));
  }

  int orientation(LatLng p, LatLng q, LatLng r) {
    var a = ((q.longitude - p.longitude) * (r.latitude - q.latitude) -
        (q.latitude - p.latitude) * (r.longitude - q.longitude));
    if (a == 0) {
      return 0; // collinear
    } else if (a > 0) {
      return 1; // clock wise
    } else {
      return 2; // counterclock wise
    }
  }

  int compare(LatLng p1, LatLng p2) {
    var o = orientation(p0, p1, p2);
    if (o == 0) {
      if (distSq(p0, p2) >= distSq(p0, p1)) {
        return -1;
      } else {
        return 1;
      }
    } else {
      if (o == 2) {
        return -1;
      } else {
        return 1;
      }
    }
  }

  List<LatLng> convexHull(List<LatLng> points, n) {
    var ymin = points[0].longitude;
    var min = 0;
    points.asMap().forEach((key, value) {
      if (key == 0) return;

      var y = value.longitude;

      if ((y < ymin) || (ymin == y && value.latitude < points[min].latitude)) {
        ymin = value.longitude;
        min = key;
      }
    });

    points[0] = points[min];
    points[min] = points[0];

    p0 = points[0];
    points.sort((c1, c2) => compare(c1, c2));

    var m = 1;

    for (int i = 1; i < n; i++) {
      while ((i < n - 1) && (orientation(p0, points[i], points[i + 1]) == 0)) {
        i += 1;
      }
      points[m] = points[i];
      m += 1;
    }
    // If modified array of points has less than 3 points,
    // convex hull is not possible
    if (m < 3) {
      return [];
    }

    List<LatLng> s = [];
    s.add(points[0]);
    s.add(points[1]);
    s.add(points[2]);

    for (int i = 3; i < m; i++) {
      while ((s.length > 1) &&
          (orientation(nextToTop(s), s.last, points[i]) != 2)) {
        s.removeLast();
      }
      s.add(points[i]);
    }

    return s;
  }

  //////////////////////////

  Future<void> getPlaceDirection() async {
    var initialPos = context.read(pickupLocationProvider.notifier).state;
    var finalPos = context.read(dropoffLocationProvider.notifier).state;

    var pickUpLatLng = LatLng(initialPos.latitude, initialPos.longitude);
    var dropOffLatLng = LatLng(finalPos.latitude, finalPos.longitude);

    var details = await AssistantMethods.obtainPlaceDirectionDetails(
        pickUpLatLng, dropOffLatLng);

    setState(() {
      tripDirectionDetail = details;
    });

    print('This is Encoded Points: ${details?.encodedPoints}');

    PolylinePoints polylinePoints = PolylinePoints();
    List<PointLatLng> decodedPolylinePointsResult =
        polylinePoints.decodePolyline(details?.encodedPoints ?? "");

    pLineCoordinates.clear();
    if (decodedPolylinePointsResult.isNotEmpty) {
      for (var pointLatLng in decodedPolylinePointsResult) {
        pLineCoordinates
            .add(LatLng(pointLatLng.latitude, pointLatLng.longitude));
      }
    }

    polylineSet.clear();

    setState(() {
      Polyline polyline = Polyline(
        color: Colors.pink,
        polylineId: PolylineId("PolylineID"),
        jointType: JointType.round,
        points: pLineCoordinates,
        width: 5,
        startCap: Cap.roundCap,
        endCap: Cap.roundCap,
        geodesic: true,
      );

      polylineSet.add(polyline);
    });

    LatLngBounds latLngBounds;
    if (pickUpLatLng.latitude > dropOffLatLng.latitude &&
        pickUpLatLng.longitude > dropOffLatLng.longitude) {
      latLngBounds =
          LatLngBounds(southwest: dropOffLatLng, northeast: pickUpLatLng);
    } else if (pickUpLatLng.longitude > dropOffLatLng.longitude) {
      latLngBounds = LatLngBounds(
          southwest: LatLng(pickUpLatLng.latitude, dropOffLatLng.longitude),
          northeast: LatLng(dropOffLatLng.latitude, pickUpLatLng.longitude));
    } else if (pickUpLatLng.latitude > dropOffLatLng.latitude) {
      latLngBounds = LatLngBounds(
          southwest: LatLng(dropOffLatLng.latitude, pickUpLatLng.longitude),
          northeast: LatLng(pickUpLatLng.latitude, dropOffLatLng.longitude));
    } else {
      latLngBounds =
          LatLngBounds(southwest: pickUpLatLng, northeast: dropOffLatLng);
    }

    newGoogleMapController
        .animateCamera(CameraUpdate.newLatLngBounds(latLngBounds, 30));

    Marker pickUpLocMarker = Marker(
      markerId: MarkerId("pickUpId"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
      infoWindow:
          InfoWindow(title: initialPos.placeName, snippet: "my location"),
      position: pickUpLatLng,
    );

    Marker dropOffLocMarker = Marker(
      markerId: MarkerId("dropOffId"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      infoWindow:
          InfoWindow(title: finalPos.placeName, snippet: "DropOff Location"),
      position: dropOffLatLng,
    );

    setState(() {
      markerSet.add(pickUpLocMarker);
      markerSet.add(dropOffLocMarker);
    });

    Circle pickUpLocCircle = Circle(
      circleId: CircleId("pickUpId"),
      center: pickUpLatLng,
      radius: 12,
      strokeWidth: 4,
      strokeColor: Colors.blueAccent,
      fillColor: Colors.blueAccent,
    );
    Circle dropOffLocCircle = Circle(
      circleId: CircleId("dropOffId"),
      center: dropOffLatLng,
      radius: 12,
      strokeWidth: 4,
      fillColor: Colors.deepPurple,
      strokeColor: Colors.purple,
    );

    setState(() {
      circleSet.add(pickUpLocCircle);
      circleSet.add(dropOffLocCircle);
    });
  }
}
