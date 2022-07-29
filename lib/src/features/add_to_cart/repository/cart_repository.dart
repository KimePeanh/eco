import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class CartRepository {
  Future<void> AddtoCart(
      {required String color,
      required String size,
      required int qty}) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final User user = await _auth.currentUser!;
    var cart = [];
    Map<String, dynamic> item = {};
    item.addAll({'item': color, "size": size, "qty": qty});

    await FirebaseFirestore.instance
        .collection("cart")
        .get()
        .then((QuerySnapshot querySnapshot) {
      print(querySnapshot.docs.length);
      querySnapshot.docs.forEach((doc) {
        if (doc["uid"] == user.uid) {
          cart = doc['carts'];
        }
      });
    });

    cart.add(item);
    await FirebaseFirestore.instance
        .collection("cart")
        .doc(user.uid)
        .update({'carts': cart});
  }

  Future<int> choosesize({required String size, required int index}) async {
    return index;
  }
}
