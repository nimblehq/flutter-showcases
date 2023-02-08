import 'package:google_maps_flutter/google_maps_flutter.dart';

class RideDetails {
  String pickUpAddress;
  String dropOffAddress;
  LatLng pickup;
  LatLng dropOff;
  String rideRequestId;
  String paymentMethod;
  String riderName;
  String riderPhone;

  RideDetails(
      {this.pickUpAddress = '',
      this.dropOffAddress = '',
      this.pickup = const LatLng(0, 0),
      this.dropOff = const LatLng(0, 0),
      this.rideRequestId = '',
      this.paymentMethod = '',
      this.riderName = '',
      this.riderPhone = ''});
}
