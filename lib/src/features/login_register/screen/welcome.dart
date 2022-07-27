import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:eco/src/features/login_register/screen/login_screen.dart';
import 'package:eco/src/utils/constants/app_constant.dart';
import 'package:lottie/lottie.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: width * 0.9,
              child: Lottie.asset("assets/images/login.json"),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Welcome to Jong Tinh...",
              style: TextStyle(
                  fontFamily: 'a',
                  fontWeight: FontWeight.bold,
                  color: maincolor),
              textScaleFactor: 1.3,
            ),
            SizedBox(
              height: 30,
            ),
            InkWell(
              child: Container(
                alignment: Alignment.center,
                width: width * 0.78,
                height: 40,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [maincolor, maincolor.withOpacity(0.5)],
                        stops: [0.0, 1.0],
                        begin: FractionalOffset.topCenter,
                        end: FractionalOffset.bottomCenter,
                        tileMode: TileMode.repeated)),
                child: Text(
                  "LOGIN",
                  style:
                      TextStyle(fontFamily: 'a', color: white, fontWeight: bold),
                  textScaleFactor: 1,
                ),
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
              },
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              alignment: Alignment.center,
              width: width * 0.78,
              height: 40,
              decoration: BoxDecoration(
                color: white,
                border: Border.all(color: maincolor),
              ),
              child: Text(
                "SIGNUP",
                style: TextStyle(
                    fontFamily: 'a', color: maincolor, fontWeight: bold),
                textScaleFactor: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
