import 'package:eco/src/features/bottom_navigation.dart/bottom_navigation.dart';
import 'package:eco/src/utils/constants/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SafeArea(
                child: Container(
                  // color: maincolor,
                  width: width * 0.9,
                  height: height * 0.25,
                  child: Lottie.asset(
                      "assets/images/74569-two-factor-authentication.json"),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                "Verification",
                style: TextStyle(fontFamily: 'a', fontWeight: bold),
                textScaleFactor: 1.1,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Enter OTP code send to your email.",
                style: TextStyle(fontFamily: 'a', color: Colors.grey.shade500),
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                "kimepeanh.me@gmail.com",
                style: TextStyle(fontFamily: 'a', color: Colors.grey.shade500),
              ),
              SizedBox(
                height: 20,
              ),
              OtpTextField(
                numberOfFields: 5,
                fieldWidth: 50,
                borderColor: Color(0xFF512DA8),
                showFieldAsBox: true,
                onCodeChanged: (String code) {},
                onSubmit: (String verificationCode) {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottomNavigator()));
                }, // end onSubmit
              ),
            ],
          ),
        ),
      ),
    );
  }
}
