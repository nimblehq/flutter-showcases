import 'package:driver_app/config_map.dart';
import 'package:driver_app/main.dart';
import 'package:driver_app/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CarInfoScreen extends StatelessWidget {
  CarInfoScreen({Key? key}) : super(key: key);

  static const String idScreen = "/car-info";

  TextEditingController carModelTextEditingController = TextEditingController();
  TextEditingController carNumberTextEditingController =
      TextEditingController();
  TextEditingController carColorTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 22),
            Image.asset(
              "assets/images/logo.png",
              width: 390,
              height: 250,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(22, 22, 22, 32),
              child: Column(
                children: [
                  SizedBox(height: 12),
                  Text(
                    "Enter Car Details",
                    style: TextStyle(fontSize: 24),
                  ),
                  SizedBox(height: 26),
                  TextField(
                    controller: carModelTextEditingController,
                    decoration: InputDecoration(
                      labelText: "Car Model",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 10),
                    ),
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: carNumberTextEditingController,
                    decoration: InputDecoration(
                      labelText: "Car Number",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 10),
                    ),
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: carColorTextEditingController,
                    decoration: InputDecoration(
                      labelText: "Car Color",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 10),
                    ),
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(height: 42),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: ElevatedButton(
                        onPressed: () {
                          if (carModelTextEditingController.text.isEmpty) {
                            displayToastMessage("Please write car model");
                          } else {
                            saveDriverCarInfo(context);
                          }
                        },
                        child: Padding(
                          padding: EdgeInsets.all(17),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Next",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                                size: 26,
                              ),
                            ],
                          ),
                        )),
                  )
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }

  void saveDriverCarInfo(BuildContext context) {
    String userId = currentFirebaseUser?.uid ?? "";

    Map carInfoMap = {
      "car_color": carColorTextEditingController.text,
      "car_number": carNumberTextEditingController.text,
      "car_model": carModelTextEditingController.text
    };

    driversRef.child(userId).child("car_details").set(carInfoMap);

    Navigator.pushNamedAndRemoveUntil(
        context, HomeScreen.idScreen, (route) => false);
  }

  displayToastMessage(String message) {
    Fluttertoast.showToast(msg: message);
  }
}
