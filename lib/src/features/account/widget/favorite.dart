import 'package:eco/src/utils/constants/app_constant.dart';
import 'package:flutter/material.dart';

Widget Favorite(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.9,
    padding: EdgeInsets.all(15),
    decoration: BoxDecoration(
        color: maincolor.withOpacity(0.1),
        border: Border.all(color: maincolor, width: 0.5),
        borderRadius: BorderRadius.circular(10)),
    child: Row(
      children: [
        Icon(
          Icons.favorite,
          color: maincolor,
          size: 30,
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
            child: Text(
          "Favorite",
          style: TextStyle(fontFamily: 'a'),
          textScaleFactor: 1,
        )),
        Icon(
          Icons.arrow_forward_ios,
          color: maincolor,
        )
      ],
    ),
  );
}

Widget ShippingAdress(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.9,
    padding: EdgeInsets.all(15),
    decoration: BoxDecoration(
        color: maincolor.withOpacity(0.1),
        border: Border.all(color: maincolor, width: 0.5),
        borderRadius: BorderRadius.circular(10)),
    child: Row(
      children: [
        Icon(
          Icons.local_shipping,
          color: maincolor,
          size: 30,
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
            child: Text(
          "Shipping Adress",
          style: TextStyle(fontFamily: 'a'),
          textScaleFactor: 1,
        )),
        Icon(
          Icons.arrow_forward_ios,
          color: maincolor,
        )
      ],
    ),
  );
}

Widget Setting(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.9,
    padding: EdgeInsets.all(15),
    decoration: BoxDecoration(
        color: maincolor.withOpacity(0.1),
        border: Border.all(color: maincolor, width: 0.5),
        borderRadius: BorderRadius.circular(10)),
    child: Row(
      children: [
        Icon(
          Icons.settings,
          color: maincolor,
          size: 30,
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
            child: Text(
          "Setting",
          style: TextStyle(fontFamily: 'a'),
          textScaleFactor: 1,
        )),
        Icon(
          Icons.arrow_forward_ios,
          color: maincolor,
        )
      ],
    ),
  );
}

Widget Logout(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.9,
    padding: EdgeInsets.all(15),
    decoration: BoxDecoration(
        color: maincolor.withOpacity(0.1),
        border: Border.all(color: maincolor, width: 0.5),
        borderRadius: BorderRadius.circular(10)),
    child: Row(
      children: [
        Icon(
          Icons.logout,
          color: maincolor,
          size: 30,
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
            child: Text(
          "Logout",
          style: TextStyle(fontFamily: 'a'),
          textScaleFactor: 1,
        )),
        // Icon(
        //   Icons.arrow_forward_ios,
        //   color: maincolor,
        // )
      ],
    ),
  );
}
