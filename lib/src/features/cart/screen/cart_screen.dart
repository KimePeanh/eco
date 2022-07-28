import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eco/src/features/login_register/screen/required_login.dart';
import 'package:eco/src/utils/constants/app_constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
   
    return FirebaseAuth.instance.currentUser == null
        ? Scaffold(
            body: RequiredLogin(),
          )
        : Scaffold(
            appBar: AppBar(
              systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark),
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Text(
                "Cart",
                style: TextStyle(
                    color: Colors.black, fontFamily: 'a', fontWeight: bold),
                textScaleFactor: 1.2,
              ),
              centerTitle: true,
            ),
            body: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("cart")
                  .where('uid',
                      isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  // return 
                  return Column(
                    children: snapshot.data!.docs.map((doc) {
                  
                      return doc['carts'].length != 0
                          ? Container(child: Text("ok"),)
                          : Expanded(
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.shopping_cart_outlined, color: Colors.grey.shade300,size: 100,), 
                                  SizedBox(height: 20,),
                                  Text("Empty Cart", style: TextStyle(color: Colors.grey.shade300, fontFamily: 'a'),textScaleFactor: 1.4,)
                                ],
                              ),
                            ),
                          );
                    }).toList(),
                  );
                } else {
                  return Container(child: Text("DATA"),);
                }
              },
            ),
          );
  }
}
