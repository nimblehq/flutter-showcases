import 'package:driver_app/config_map.dart';
import 'package:driver_app/screen/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:driver_app/main.dart';
import 'package:driver_app/screen/registration/registration_screen.dart';

class LoginScreen extends StatelessWidget {
  static const String idScreen = "login";
  LoginScreen({Key? key}) : super(key: key);

  TextEditingController emailTextEdittingController = TextEditingController();
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
                'Login as a Driver',
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
                        loginAndAuthenticateUser(context);
                      },
                      child: Container(
                        height: 50,
                        child: Center(
                          child: Text(
                            'Login',
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
                      context, RegistrationScreen.idScreen, (route) => false);
                },
                child: Text('Do not have an Account? Register here.'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  void loginAndAuthenticateUser(BuildContext context) async {
    final firebaseUser = (await _firebaseAuth
            .signInWithEmailAndPassword(
                email: emailTextEdittingController.text,
                password: passwordTextEdittingController.text)
            .catchError((errorMsg) {
      displayToastMessage('Error: $errorMsg');
    }))
        .user;
    if (firebaseUser != null) {
      driversRef.child(firebaseUser.uid).once().then((snap) {
        if (snap.snapshot.value != null) {
          currentFirebaseUser = firebaseUser;
          Navigator.pushNamedAndRemoveUntil(
              context, HomeScreen.idScreen, (route) => false);
          displayToastMessage('You are logged in!');
        } else {
          _firebaseAuth.signOut();
          displayToastMessage(
              'No record exists for this user. Please create new account');
        }
      });
    } else {
      // error occured - display error msg
      displayToastMessage('Error occured. Cannot log in!');
    }
  }

  displayToastMessage(String message) {
    Fluttertoast.showToast(msg: message);
  }
}
