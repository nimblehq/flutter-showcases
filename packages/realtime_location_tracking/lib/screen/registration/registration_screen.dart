import 'package:driver_app/config_map.dart';
import 'package:driver_app/screen/car_info/car_info_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:driver_app/main.dart';
import 'package:driver_app/screen/home_screen_backup.dart';
import 'package:driver_app/screen/login/login_screen.dart';

class RegistrationScreen extends StatelessWidget {
  static const String idScreen = "register";
  RegistrationScreen({Key? key}) : super(key: key);

  TextEditingController nameTextEdittingController = TextEditingController();
  TextEditingController emailTextEdittingController = TextEditingController();
  TextEditingController phoneTextEdittingController = TextEditingController();
  TextEditingController passwordTextEdittingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 45,
              ),
              Image(
                image: AssetImage('assets/images/logo.png'),
                width: 390,
                height: 250,
                alignment: Alignment.center,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Register as a Driver',
                style: TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 1,
                    ),
                    TextFormField(
                      controller: nameTextEdittingController,
                      decoration: InputDecoration(
                        labelText: 'Name',
                        labelStyle: TextStyle(
                          fontSize: 14,
                        ),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 10,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 1,
                    ),
                    TextFormField(
                      controller: emailTextEdittingController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          fontSize: 14,
                        ),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 10,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 1,
                    ),
                    TextFormField(
                      controller: phoneTextEdittingController,
                      decoration: InputDecoration(
                        labelText: 'Phone',
                        labelStyle: TextStyle(
                          fontSize: 14,
                        ),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 10,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 1,
                    ),
                    TextFormField(
                      controller: passwordTextEdittingController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(
                          fontSize: 14,
                        ),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 10,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (nameTextEdittingController.text.length < 4) {
                          displayToastMessage(
                              'Name must be at least 5 characters');
                        }
                        registerNewUser(context);
                      },
                      child: Container(
                        height: 50,
                        child: Center(
                          child: Text(
                            'Create Account',
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, LoginScreen.idScreen, (route) => false);
                },
                child: Text('Already have an account? Login here'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  registerNewUser(BuildContext context) async {
    // if firebaseUser is not null, it means the user is created successfully,
    // if firebaseuser is null, it means the user is not created
    final firebaseUser = (await _firebaseAuth
            .createUserWithEmailAndPassword(
                email: emailTextEdittingController.text,
                password: passwordTextEdittingController.text)
            .catchError((errorMsg) {
      displayToastMessage('Error: $errorMsg');
    }))
        .user;

    if (firebaseUser != null) {
      // user created
      // save user info to database

      Map userDataMap = {
        "name": nameTextEdittingController.text,
        "email": emailTextEdittingController.text,
        "phone": phoneTextEdittingController.text,
      };
      driversRef.child(firebaseUser.uid).set(userDataMap);

      currentFirebaseUser = firebaseUser;

      displayToastMessage('Congratulation, your account has been created');

      Navigator.pushNamed(context, CarInfoScreen.idScreen);
    } else {
      // error occured - display error msg
      displayToastMessage('New user account has not been created.');
    }
  }

  displayToastMessage(String message) {
    Fluttertoast.showToast(msg: message);
  }
}
