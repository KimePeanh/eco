import 'package:eco/src/utils/constants/app_constant.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late GlobalKey<FormState>? _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 10),
                width: width * 0.9,
                height: 48,
                child: TextFormField(
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: new BorderSide(color: maincolor)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: new BorderSide(color: maincolor)),
                      contentPadding: const EdgeInsets.only(
                          left: 14.0, bottom: 8.0, top: 8.0)),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10),
                alignment: Alignment.topLeft,
                width: width * 0.9,
                height: 60,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          top: 3, bottom: 3, left: 15, right: 15),
                      decoration: BoxDecoration(
                          color: maincolor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        "Email",
                        style: TextStyle(color: white, fontFamily: 'a'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 10),
                width: width * 0.9,
                height: 48,
                child: TextFormField(
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: new BorderSide(color: maincolor)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: new BorderSide(color: maincolor)),
                      contentPadding: const EdgeInsets.only(
                          left: 14.0, bottom: 8.0, top: 8.0)),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10),
                alignment: Alignment.topLeft,
                width: width * 0.9,
                height: 60,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          top: 3, bottom: 3, left: 15, right: 15),
                      decoration: BoxDecoration(
                          color: maincolor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        "Password",
                        style: TextStyle(color: white, fontFamily: 'a'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 3),
            width: width * 0.9,
            child: Text(
              "Forgot you password ?",
              style: TextStyle(color: Colors.grey.shade400, fontFamily: 'a'),
              textAlign: TextAlign.end,
            ),
          ),
          SizedBox(
            height: 70,
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
            onTap: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
            },
          ),
          
        ],
      ),
    );
  }
}
