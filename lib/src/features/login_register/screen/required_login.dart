import 'package:eco/src/features/login_register/screen/login_screen.dart';
import 'package:eco/src/features/login_register/screen/register_screen.dart';
import 'package:eco/src/utils/constants/app_constant.dart';
import 'package:flutter/material.dart';

class RequiredLogin extends StatefulWidget {
  const RequiredLogin({Key? key}) : super(key: key);

  @override
  State<RequiredLogin> createState() => _RequiredLoginState();
}

class _RequiredLoginState extends State<RequiredLogin> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              child: Container(
                alignment: Alignment.center,
                width: width * 0.9,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: maincolor.withOpacity(0.4),
                ),
                child: Text(
                  "Login",
                  style: TextStyle(
                      color: maincolor, fontFamily: 'a', fontWeight: bold),
                  textScaleFactor: 1.1,
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              child: Container(
                alignment: Alignment.center,
                width: width * 0.9,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: maincolor,
                ),
                child: Text(
                  "Register",
                  style: TextStyle(
                      color: white, fontFamily: 'a', fontWeight: bold),
                  textScaleFactor: 1.1,
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RegisterScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
