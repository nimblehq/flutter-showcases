import 'package:driver_app/models/ride_details.dart';
import 'package:flutter/material.dart';

class NewRideScreen extends StatefulWidget {
  final RideDetails rideDetails;
  const NewRideScreen(this.rideDetails, {Key? key}) : super(key: key);

  @override
  _NewRideScreenState createState() => _NewRideScreenState();
}

class _NewRideScreenState extends State<NewRideScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("New Ride")),
      body: Center(
        child: Text("THis is new ride page"),
      ),
    );
  }
}
