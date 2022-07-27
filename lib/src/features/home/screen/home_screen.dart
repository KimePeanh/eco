// import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:eco/src/utils/constants/app_constant.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'flash_sale.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var product = [];

  final colors = [
    Colors.red,
    Colors.redAccent,
  ];

  final heights = [200, 250];
  Future getmydetail() async {
    FirebaseFirestore.instance
        .collection("product")
        .get()
        .then((QuerySnapshot querySnapshot) {
      print(querySnapshot.docs.length);
      querySnapshot.docs.forEach((doc) {
        if (doc['uid'].toString() == 'c6hNS6Ze21oc4VrcOYkJ') {
          print(doc['products']);
          product = doc['products'];
        } else {
          print("object");
          print(doc['uid']);
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getmydetail();
    print(product.length);
    final List<Map> myProducts = List.generate(
        100000, (index) => {"id": index, "name": "Product $index"}).toList();
    List<Widget> Images = [
      Image(
          width: MediaQuery.of(context).size.width * 0.9,
          fit: BoxFit.fitWidth,
          image: AssetImage("assets/images/1248.jpg")),
      Image(
          width: MediaQuery.of(context).size.width * 0.9,
          fit: BoxFit.fitWidth,
          image: AssetImage("assets/images/full-shot-smiley-woman-studio.jpg")),
      Image(
          width: MediaQuery.of(context).size.width * 0.9,
          fit: BoxFit.fitWidth,
          image: AssetImage("assets/images/black.jpg")),
      Image(
          width: MediaQuery.of(context).size.width * 0.9,
          fit: BoxFit.fitWidth,
          image: AssetImage("assets/images/5140499.jpg")),
    ];
    List<Widget> card = List.generate(
        10,
        (index) => Container(
              width: MediaQuery.of(context).size.width / 2,
              height: 200,
              margin: EdgeInsets.all(10),
              color: maincolor,
            ));
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    print(product.toString());
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: maincolor,
                statusBarIconBrightness: Brightness.light),
            backgroundColor: maincolor,
            elevation: 0,
            expandedHeight: height * 0.27,
            // toolbarHeight: 120,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: const EdgeInsets.only(top: 80),
                child: CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: false,
                    aspectRatio: 2.4,
                    enlargeCenterPage: true,
                  ),
                  items: Images,
                ),
              ),
              centerTitle: true,
            ),
            title: Container(
              // margin: EdgeInsets.only(bottom: 50),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: white.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(5)),
                    child: Icon(
                      Icons.favorite_outline,
                      color: white,
                      size: 22,
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                      child: Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    height: 40,
                    decoration: BoxDecoration(
                      color: white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.search,
                          color: white,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Search",
                          style: TextStyle(color: white, fontFamily: 'a'),
                        )
                      ],
                    ),
                  )),
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: white.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(5)),
                    child: Icon(
                      Icons.notifications_outlined,
                      color: white,
                    ),
                  )
                ],
              ),
            ),

            // leading: Icon(Icons.baby_changing_station),
          ),
          // SliverAnimatedOpacity(opacity: 0.5, duration: Duration(seconds: 1)),
          SliverToBoxAdapter(
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    width: width * 0.9,
                    child: Text(
                      "Categories",
                      style: TextStyle(fontFamily: 'a'),
                      textScaleFactor: 1,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    width: width * 0.9,
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(10),
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade300,
                                  offset: Offset(1, 1),
                                  blurRadius: 1,
                                ),
                                BoxShadow(
                                  color: Colors.white,
                                  offset: Offset(1, 1),
                                  blurRadius: 1,
                                )
                              ]),
                          child: Image(
                            image: AssetImage("assets/images/skincare.png"),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 60,
                          height: 60,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade300,
                                  offset: Offset(1, 1),
                                  blurRadius: 1,
                                ),
                                BoxShadow(
                                  color: Colors.white,
                                  offset: Offset(1, 1),
                                  blurRadius: 1,
                                )
                              ]),
                          child: Image(
                            image: AssetImage("assets/images/dress.png"),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade300,
                                  offset: Offset(1, 1),
                                  blurRadius: 1,
                                ),
                                BoxShadow(
                                  color: Colors.white,
                                  offset: Offset(1, 1),
                                  blurRadius: 1,
                                )
                              ]),
                          child: Image(
                            image: AssetImage("assets/images/sneakers.png"),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 60,
                          height: 60,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade300,
                                  offset: Offset(1, 1),
                                  blurRadius: 1,
                                ),
                                BoxShadow(
                                  color: Colors.white,
                                  offset: Offset(1, 1),
                                  blurRadius: 1,
                                )
                              ]),
                          child: Image(
                            image:
                                AssetImage("assets/images/free-delivery.png"),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 60,
                          height: 60,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade300,
                                  offset: Offset(1, 1),
                                  blurRadius: 1,
                                ),
                                BoxShadow(
                                  color: Colors.white,
                                  offset: Offset(1, 1),
                                  blurRadius: 1,
                                )
                              ]),
                          child: Image(
                            image: AssetImage("assets/images/flash-sale.png"),
                          ),
                        )
                      ],
                    ),
                  ),
                  // GridView.builder(
                  //   itemCount: 25,
                  //   gridDelegate: ,
                  //   itemBuilder: (context, index){

                  //   })
                  FlashSale(),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    width: width * 0.9,
                    child: Text(
                      "What's new",
                      style: TextStyle(fontFamily: 'a'),
                      textScaleFactor: 1,
                    ),
                  ),

                  // StreamBuilder(
                  //     stream: FirebaseFirestore.instance
                  //         .collection("product")
                  //         .where('uid', isEqualTo: "c6hNS6Ze21oc4VrcOYkJ")
                  //         .snapshots(),
                  //     builder:
                  //         (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  //       if (snapshot.hasData) {
                  //         print("object");
                  //         log(snapshot.data!.docs.toString());
                  //         return GridView.builder(
                  //             // itemCount: snapshot.data!.docs[0].get("product").length,
                  //             shrinkWrap: true,
                  //             physics: NeverScrollableScrollPhysics(),
                  //             gridDelegate:
                  //                 SliverGridDelegateWithFixedCrossAxisCount(
                  //                     crossAxisCount: 2),
                  //             itemBuilder: (context, index) {
                  //               return Container(
                  //                 width: width * 0.4,
                  //                 color: maincolor,
                  //                 height: 100,
                  //                 padding: EdgeInsets.all(10),
                  //                 child: Column(
                  //                   children: <Widget>[],
                  //                 ),
                  //               );
                  //             });
                  //       } else {
                  //         return Text("data");
                  //       }
                  //     })

                  GridView.builder(
                      itemCount: product.length,
                      shrinkWrap: true,
                      primary: false,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 5 / 8, crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        return product[index]['discount'] != null
                            ? Container(
                                alignment: Alignment.topCenter,
                                margin: EdgeInsets.all(5),
                                width: width * 0.4,
                                decoration: BoxDecoration(
                                    color: white,
                                    borderRadius: BorderRadius.circular(5)),
                                // color: maincolor,
                                // height: 300,
                                // padding: EdgeInsets.only(),
                                child: Flexible(
                                  child: Column(
                                    // mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        alignment: Alignment.topCenter,
                                        color: white,
                                        // height: 200,
                                        // width: width * 0.4,
                                        child: Image(
                                          // fit: BoxFit.fitHeight,
                                          image: NetworkImage(
                                              product[index]['pic']),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                '${product[index]['price']}\$',
                                                style: TextStyle(
                                                    color: Colors.red.shade600,
                                                    fontWeight: bold,
                                                    fontFamily: 'a'),
                                                textScaleFactor: 1.2,
                                              )),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                              // alignment: Alignment.topLeft,
                                              child: product[index]['disp'] !=
                                                      null
                                                  ? Text(
                                                      '${product[index]['disp']}\$',
                                                      style: TextStyle(
                                                          color: Colors.grey,
                                                          fontWeight: bold,
                                                          fontFamily: 'a',
                                                          decoration:
                                                              TextDecoration
                                                                  .lineThrough),
                                                    )
                                                  : null)
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        child: Text(
                                          product[index]['title'],
                                          style: TextStyle(
                                              fontFamily: 'a',
                                              fontWeight: bold),
                                          softWrap: false,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Expanded(
                                          child: Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            color: maincolor,
                                            child: Text('${product[index]['discount']}% off', style: TextStyle(color: white),),
                                          ),
                                          Expanded(
                                            child: Container(
                                              padding: EdgeInsets.only(right: 10),
                                              alignment: Alignment.centerRight,
                                              child: Icon(Icons.favorite_outline,
                                                  color: maincolor),
                                            ),
                                          ),
                                        ],
                                      ))
                                      // Expanded(child: Container(child: Text(product[index]['des']),))
                                      // , Expanded(child: Container())
                                    ],
                                  ),
                                ),
                              )
                            : Container(
                                alignment: Alignment.topCenter,
                                margin: EdgeInsets.all(5),
                                width: width * 0.4,
                                decoration: BoxDecoration(
                                    color: white,
                                    borderRadius: BorderRadius.circular(5)),
                                // color: maincolor,
                                // height: 300,
                                // padding: EdgeInsets.only(),
                                child: Flexible(
                                  child: Column(
                                    // mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        alignment: Alignment.topCenter,
                                        color: white,
                                        // height: 200,
                                        // width: width * 0.4,
                                        child: Image(
                                          // fit: BoxFit.fitHeight,
                                          image: NetworkImage(
                                              product[index]['pic']),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                '${product[index]['price']}\$',
                                                style: TextStyle(
                                                    color: Colors.red.shade600,
                                                    fontWeight: bold,
                                                    fontFamily: 'a'),
                                                textScaleFactor: 1.2,
                                              )),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                              // alignment: Alignment.topLeft,
                                              child: product[index]['disp'] !=
                                                      null
                                                  ? Text(
                                                      '${product[index]['price']}\$',
                                                      style: TextStyle(
                                                          color: Colors.grey,
                                                          fontWeight: bold,
                                                          fontFamily: 'a',
                                                          decoration:
                                                              TextDecoration
                                                                  .lineThrough),
                                                    )
                                                  : null)
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        child: Text(
                                          product[index]['title'],
                                          style: TextStyle(
                                              fontFamily: 'a',
                                              fontWeight: bold),
                                          softWrap: false,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Expanded(
                                          child: Container(
                                        padding: EdgeInsets.only(right: 10),
                                        alignment: Alignment.centerRight,
                                        child: Icon(Icons.favorite_outline,
                                            color: maincolor),
                                      ))
                                      // Expanded(child: Container(child: Text(product[index]['des']),))
                                      // , Expanded(child: Container())
                                    ],
                                  ),
                                ),
                              );
                      })
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
