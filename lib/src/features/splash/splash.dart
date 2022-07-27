
import 'package:eco/src/features/login_register/screen/welcome.dart';
import 'package:flutter/material.dart';





class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();

}



class _SplashScreenState extends State<SplashScreen> {

  _navigator() async{
   await Future.delayed(Duration(seconds: 2), (){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WelcomeScreen()));
  }

  @override
  void initState() {
    _navigator();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image(
          width: 150,
          height: 150,
          image: AssetImage("assets/images/logo.png")),
      ),
      
    );
  }
}