import 'dart:async';
import 'dart:io';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:driver_app/models/all_users.dart';
import 'package:geolocator/geolocator.dart';

String mapKeyAndroid = "";
String mapKeyIos = "";

String getMapKey() {
  if (Platform.isIOS) {
    return mapKeyIos;
  }
  if (Platform.isAndroid) {
    return mapKeyAndroid;
  }
  return "";
}

User? firebaseUser;
Users? usersCurrentInfo;

User? currentFirebaseUser;
late StreamSubscription<Position> homeTabPageStreamSubscription;
final assetAudioPlayer = AssetsAudioPlayer();
