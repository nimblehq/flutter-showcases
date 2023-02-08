import 'package:firebase_database/firebase_database.dart';

class Users {
  String? id;
  String? name;
  String? email;
  String? phone;

  Users(this.id, this.name, this.email, this.phone);

  factory Users.fromDataSnapshot(DataSnapshot dataSnapshot) {
    Map<String, dynamic>? dataValue =
        dataSnapshot.value as Map<String, dynamic>?;
    return Users(
      dataSnapshot.key,
      dataValue!['name'],
      dataValue['email'],
      dataValue['phone'],
    );
  }
}
