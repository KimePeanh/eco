

import 'package:eco/src/utils/constants/app_constant.dart';
import 'package:flutter/material.dart';

Widget Status(BuildContext context, String image, String text) {
  return Expanded(
      child: Container(
        height: 50,
    child: Column(
      children: [
        Container(
          // height: 50,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: maincolor,
          ),
          child: Image(
            image: AssetImage(image),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text("${text}")
      ],
    ),
  ));
}
