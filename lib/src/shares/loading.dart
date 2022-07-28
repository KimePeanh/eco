import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Widget loadinganimation() {
  return Center(
    child: Container(
        height: 70, child: Lottie.asset("assets/images/loading.json")),
  );
}
