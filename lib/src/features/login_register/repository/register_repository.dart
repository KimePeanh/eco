import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterRepository {
  var random = new Random();
  FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> Register(
      {required String email,
      required String password,
      required String username}) async {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    if (credential.user!.uid.isNotEmpty) {
      FirebaseFirestore.instance
          .collection('users')
          .doc(credential.user!.uid)
          .set({
            'id': random.nextInt(1000000).toString(),
            'username': username,
            'email': email,
            'password': password,
            'uid': credential.user!.uid,
            'url':
                'https://firebasestorage.googleapis.com/v0/b/newonecam-53e7c.appspot.com/o/user%20(1).png?alt=media&token=c4dafa52-3e22-4514-9482-874bd4dde42d',
          })
          .then((value) => print('SSS'))
          .catchError((e) => print(e));
      credential.user!.updateDisplayName(email);
      credential.user!.updatePhotoURL(
          'https://firebasestorage.googleapis.com/v0/b/newonecam-53e7c.appspot.com/o/user%20(1).png?alt=media&token=c4dafa52-3e22-4514-9482-874bd4dde42d');
      credential.user!.reload();

      FirebaseFirestore.instance
          .collection("cart")
          .doc(credential.user!.uid)
          .set({'carts': []});
    } else {}
  }
}
