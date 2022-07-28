import 'package:eco/src/features/login_register/bloc/register_bloc.dart';
import 'package:eco/src/shares/loading.dart';
import 'package:eco/src/utils/constants/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:eco/src/features/otp/screen/otp.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

RegisterBloc registerBloc = RegisterBloc();

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  late GlobalKey<FormState>? _formKey = GlobalKey<FormState>();
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  TextEditingController cfpasscontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return BlocListener(
        bloc: registerBloc,
        listener: (context, state) {
          if (state is Loading) {
            loadinganimation();
          } else if (state is Error) {
            Navigator.pop(context);
          } else if (state is Success) {
            Navigator.pop(context);
            // Navigator.pop(context);
          }
        },
        child: Form(
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
                      controller: usernamecontroller,
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
                            "Username",
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
                      controller: emailcontroller,
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
                      controller: passcontroller,
                      decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.remove_red_eye,
                            color: maincolor,
                          ),
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
                      controller: cfpasscontroller,
                      decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.remove_red_eye,
                            color: maincolor,
                          ),
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
                            "Confirm Password",
                            style: TextStyle(color: white, fontFamily: 'a'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
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
                    "SINGUP",
                    style: TextStyle(
                        fontFamily: 'a', color: white, fontWeight: bold),
                    textScaleFactor: 1,
                  ),
                ),
                onTap: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => OtpScreen()));
                  if (cfpasscontroller.text.toString() ==
                      passcontroller.text.toString()) {
                    registerBloc.add(RegisterPress(
                        username: usernamecontroller.text.toString(),
                        email: emailcontroller.text.toString(),
                        password: passcontroller.text.toString()));
                  }
                },
              ),
            ],
          ),
        ));
  }
}
