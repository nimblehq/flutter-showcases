import 'package:driver_app/config_map.dart';
import 'package:driver_app/main.dart';
import 'package:driver_app/models/ride_details.dart';
import 'package:driver_app/screen/newride/new_ride_screen.dart';
import 'package:flutter/material.dart';

class NotificationDialog extends StatelessWidget {
  final RideDetails rideDetails;
  const NotificationDialog(this.rideDetails, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      backgroundColor: Colors.transparent,
      elevation: 1,
      child: Container(
        margin: EdgeInsets.all(5),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 30),
            Image.asset(
              'assets/images/taxi.png',
              width: 120,
            ),
            SizedBox(height: 10),
            Text(
              'New Ride Request',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.all(18),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/pickicon.png',
                        height: 16,
                        width: 16,
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Container(
                          child: Text(
                            rideDetails.pickUpAddress,
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/desticon.png',
                        height: 16,
                        width: 16,
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Container(
                          child: Text(
                            rideDetails.dropOffAddress,
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Divider(height: 2, color: Colors.black),
            SizedBox(height: 8),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.red,
                          ),
                          borderRadius: BorderRadius.circular(18))),
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    onPressed: () {
                      assetAudioPlayer.stop();
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Cancel',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  SizedBox(width: 20),
                  TextButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.green,
                          ),
                          borderRadius: BorderRadius.circular(18))),
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    onPressed: () {
                      assetAudioPlayer.stop();
                      checkAvailabitilyOfRide(context);
                    },
                    child: Text(
                      'Accept',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  void checkAvailabitilyOfRide(BuildContext context) {
    rideRequestRef?.once().then((dataSnapshot) {
      Navigator.pop(context);
      String rideId = "";
      if (dataSnapshot.snapshot.value != null) {
        rideId = dataSnapshot.snapshot.value.toString();
      } else {
        print("Ride not exists");
      }
      if (rideId == rideDetails.rideRequestId) {
        rideRequestRef?.set("accepted");
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NewRideScreen(rideDetails)));
      } else if (rideId == "cancelled") {
        print("Ride has been cancelled");
      } else if (rideId == "timeout") {
        print("Ride has time out.");
      } else {
        print("Ride not exists");
      }
    });
  }
}
