import 'package:eco/src/utils/constants/app_constant.dart';
import 'package:flutter/material.dart';

Widget ShopProfile(
    BuildContext context, String url, String name, String follower) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.96,
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            offset: Offset(1, 1),
            blurRadius: 1,
          ),
        ]),
    child: Row(
      children: [
        Container(
          width: 50,
          height: 50,
          child: CircleAvatar(
            backgroundColor: maincolor.withOpacity(0.3),
            backgroundImage: NetworkImage(url),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            children: [
              Container(
                // alignment: Alignment.centerLeft,
                // width: MediaQuery.of(context).size.width - 200,
                  alignment: Alignment.centerLeft,
                  child: Text(name,
                      style: TextStyle(
                        fontFamily: 'a',
                      ), textScaleFactor: 1.05,)),
                      SizedBox(height: 5,),
              Container(
                  // width: MediaQuery.of(context).size.width - 200,
                  alignment: Alignment.centerLeft,
                  child: Text(follower,
                      style: TextStyle(
                        fontFamily: 'a',color: Colors.grey
                      ),)),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.3,
          height: 40,
          decoration: BoxDecoration(
            color: maincolor.withOpacity(0.4),
            borderRadius: BorderRadius.circular(10),

          ),
          child: Text("Follow", style: TextStyle(color: maincolor, fontFamily: 'a'),textScaleFactor: 1,),
        )
      ],
    ),
  );
}
