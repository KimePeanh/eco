import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eco/src/features/account/widget/profile.dart';
import 'package:eco/src/features/account/widget/status.dart';
import 'package:eco/src/features/login_register/screen/required_login.dart';
import 'package:eco/src/utils/constants/app_constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    print('${FirebaseAuth.instance.currentUser}');
    return FirebaseAuth.instance.currentUser == null
        ? RequiredLogin()
        : Scaffold(
            body: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("users")
                  .where('uid',
                      isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  return SingleChildScrollView(
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 20,
                          ),
                          UserProfile(snapshot.data!.docs[0].get('url'),
                              snapshot.data!.docs[0].get('username')),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.95,
                            height: 100,
                            child: Row(
                              children: [
                                // Status(context, "assets/images/money.png","Payment"),
                                // SizedBox(width: 10,),
                                // Status(context, "assets/images/money.png","Payment"),
                                // SizedBox(width: 10,),
                                // Status(context, "assets/images/money.png","Payment"),
                                // SizedBox(width: 10,),
                                // Status(context, "assets/images/money.png","Payment")
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return Text("data");
                }
              },
            ),
          );
  }
}
