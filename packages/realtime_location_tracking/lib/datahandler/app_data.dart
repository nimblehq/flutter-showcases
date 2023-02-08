import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:driver_app/models/address.dart';

final pickupLocationProvider = StateProvider<Address>((_) => Address());
final dropoffLocationProvider = StateProvider<Address>((_) => Address());
