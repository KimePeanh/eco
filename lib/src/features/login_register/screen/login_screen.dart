import 'package:eco/src/features/login_register/screen/register_screen.dart';
import 'package:eco/src/utils/constants/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'login_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: Column(
      children: [
        Container(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: <Widget>[
                  SafeArea(
                      child: Stack(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: width * 0.05),
                        width: width,
                        height: height * 0.1,
                        child: Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            // color: maincolor.withOpacity(0.5)
                          ),
                          child: Icon(
                            Icons.arrow_back,
                            color: maincolor,
                            size: 30,
                          ),
                        ),
                      ),
                      Container(
                        width: width,
                        height: height * 0.1,
                        child: Image(
                          fit: BoxFit.fill,
                          image: AssetImage("assets/images/bar.png"),
                        ),
                      )
                    ],
                  )),
                  Container(
                    width: width * 0.9,
                    child: Text(
                      "SIGNIN",
                      style: TextStyle(
                          fontFamily: 'a', fontWeight: bold, color: maincolor),
                      textScaleFactor: 1.25,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  LoginForm(),
                ],
              ),
            ),
          ),
        ),
        Expanded(
            child: Container(
          padding: EdgeInsets.only(bottom: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: width * 0.25,
                      height: 1,
                      color: Colors.grey.shade300,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Signup with",
                      style: TextStyle(
                          fontFamily: 'a', color: Colors.grey.shade500),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: width * 0.25,
                      height: 1,
                      color: Colors.grey.shade300,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  height: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        child: NeumorphicButton(
                            margin: EdgeInsets.only(top: 12),
                            onPressed: () {},
                            style: NeumorphicStyle(
                              color: white,
                              // shadowDarkColorEmboss: Colors.green,
                              depth: 0.5,
                              intensity: 0.5,
                              surfaceIntensity: -10,
                              shape: NeumorphicShape.concave,
                              boxShape: NeumorphicBoxShape.roundRect(
                                  BorderRadius.circular(8)),
                              // boxShape: NeumorphicBoxShape.roundRect(bor)
                            ),
                            // padding: const EdgeInsets.all(12.0),
                            child: Image(
                              // width: 40,
                              // height: 40,
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images/fb.png"),
                            )),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        width: 60,
                        height: 60,
                        child: NeumorphicButton(
                            margin: EdgeInsets.only(top: 12),
                            onPressed: () {},
                            style: NeumorphicStyle(
                              color: white,
                              // shadowDarkColorEmboss: Colors.green,
                              depth: 0.5,
                              intensity: 0.5,
                              surfaceIntensity: -10,
                              shape: NeumorphicShape.concave,
                              boxShape: NeumorphicBoxShape.roundRect(
                                  BorderRadius.circular(8)),
                              // boxShape: NeumorphicBoxShape.roundRect(bor)
                            ),
                            // padding: const EdgeInsets.all(12.0),
                            child: Image(
                              // width: 40,
                              // height: 40,
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images/gg.png"),
                            )),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        width: 60,
                        height: 60,
                        child: NeumorphicButton(
                            margin: EdgeInsets.only(top: 12),
                            onPressed: () {},
                            style: NeumorphicStyle(
                              color: white,
                              // shadowDarkColorEmboss: Colors.green,
                              depth: 0.5,
                              intensity: 0.5,
                              surfaceIntensity: -10,
                              shape: NeumorphicShape.concave,
                              boxShape: NeumorphicBoxShape.roundRect(
                                  BorderRadius.circular(8)),
                              // boxShape: NeumorphicBoxShape.roundRect(bor)
                            ),
                            // padding: const EdgeInsets.all(12.0),
                            child: Image(
                              // width: 40,
                              // height: 40,
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images/apple.png"),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(child: Container()),
              InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account ? ",
                      style: TextStyle(
                          color: Colors.grey.shade400, fontFamily: 'a'),
                    ),
                    Text(
                      " Sign up",
                      style: TextStyle(color: maincolor, fontFamily: 'a'),
                    )
                  ],
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegisterScreen()));
                },
              )
            ],
          ),
        ))
      ],
    ));
  }
}
