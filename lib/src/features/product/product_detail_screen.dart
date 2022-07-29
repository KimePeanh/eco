import 'dart:developer';

import 'package:eco/src/features/product/widget/choice.dart';
import 'package:eco/src/features/product/widget/shop_pf.dart';
import 'package:eco/src/utils/constants/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class ProductDetailScreen extends StatefulWidget {
  // const ProductDetailScreen({ Key? key }) : super(key: key);
  final String url;
  final String price;
  final String disp;
  final String title;
  final String discount;
  final String pf;
  final String name;
  var color;
  var size;
  ProductDetailScreen(
      {required this.url,
      required this.price,
      required this.disp,
      required this.title,
      required this.discount,
      required this.pf,
      required this.name,
      required this.color,
      required this.size});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // log(widget.color.toString());
    return Scaffold(
      backgroundColor: white,
      // extendBodyBehindAppBar: true,
      body: Column(
        children: [
          Expanded(
            child: NestedScrollView(
                controller: _scrollController,
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverOverlapAbsorber(
                      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                          context),
                      sliver: SliverSafeArea(
                        top: false,
                        sliver: SliverAppBar(
                          systemOverlayStyle: SystemUiOverlayStyle(
                              statusBarColor: maincolor,
                              statusBarIconBrightness: Brightness.light),
                          elevation: 0,
                          backgroundColor: Colors.white,
                          leading: AspectRatio(
                            aspectRatio: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: RawMaterialButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                elevation: 0.0,
                                fillColor: Colors.white.withOpacity(0.3),
                                child: Icon(Icons.arrow_back_rounded,
                                    color: maincolor),
                                shape: CircleBorder(),
                              ),
                            ),
                          ),
                          expandedHeight: width,
                          floating: false,
                          pinned: true,
                          flexibleSpace: FlexibleSpaceBar(
                              background: SafeArea(
                                  child: Stack(
                            children: [
                              FadeInImage.assetNetwork(
                                imageCacheWidth: 500,
                                placeholder: 'assets/images/load.gif',
                                image: '${widget.url}',
                              ),
                              Container(
                                padding: EdgeInsets.only(right: 20, bottom: 10),
                                alignment: Alignment.bottomRight,
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.4),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    '1/1',
                                    style: TextStyle(color: white),
                                  ),
                                ),
                              )
                            ],
                          ))),
                          actions: [
                            AspectRatio(
                              aspectRatio: 1,
                              child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white.withOpacity(0.3),
                                  ),
                                  margin: EdgeInsets.symmetric(vertical: 8),
                                  child: Icon(
                                    Icons.favorite_border,
                                    color: maincolor,
                                  )),
                            ),
                            AspectRatio(
                              aspectRatio: 1,
                              child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white.withOpacity(0.3),
                                  ),
                                  margin: EdgeInsets.symmetric(vertical: 8),
                                  child: Icon(
                                    Icons.shopping_cart_outlined,
                                    color: maincolor,
                                  )),
                            ),
                            SizedBox(
                              width: 5,
                            )
                          ],
                        ),
                      ),
                    ),
                  ];
                },
                body: Container(
                  decoration: BoxDecoration(
                      color: white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(10))),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        width: width * 0.96,
                        // height: height * 0.15,
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade200,
                                offset: Offset(1, 1),
                                blurRadius: 1,
                              ),
                              BoxShadow(
                                color: Colors.grey.shade200,
                                offset: -Offset(1, 1),
                                blurRadius: 1,
                              )
                            ]),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              child: widget.disp != ""
                                  ? Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              '${widget.price}\$',
                                              style: TextStyle(
                                                  color: Colors.red.shade600,
                                                  fontFamily: 'a',
                                                  fontWeight: bold),
                                              textScaleFactor: 1.5,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              '${widget.disp}\$',
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontFamily: 'a',
                                                  decoration: TextDecoration
                                                      .lineThrough),
                                              textScaleFactor: 1.2,
                                            )
                                          ],
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(
                                              top: 5, bottom: 5),
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            '${widget.discount}% off',
                                            style: TextStyle(
                                                color: Colors.red.shade700),
                                            textScaleFactor: 1,
                                          ),
                                        )
                                      ],
                                    )
                                  : Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        '${widget.price}\$',
                                        style: TextStyle(
                                            color: Colors.red.shade600,
                                            fontFamily: 'a',
                                            fontWeight: bold),
                                        textScaleFactor: 1.5,
                                      ),
                                    ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                widget.title,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontFamily: 'a',
                                ),
                                textScaleFactor: 1.1,
                                maxLines: 2,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ShopProfile(
                          context, widget.pf, widget.name, "1000 follower")
                    ],
                  ),
                )),
          ),
          Container(
            color: Colors.transparent,
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      decoration: BoxDecoration(
                        color: maincolor.withOpacity(0.3),
                      ),
                      child: Text(
                        "BUY NOW",
                        style: TextStyle(
                            color: maincolor,
                            fontFamily: 'a',
                            fontWeight: bold),
                        textScaleFactor: 1.1,
                      ),
                    ),
                    onTap: () {
                      Choose(context, widget.url, widget.price, widget.color,
                          widget.size, "BUY NOW");
                    },
                  ),
                ),
                Expanded(
                  child: InkWell(
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      decoration: BoxDecoration(
                        color: maincolor,
                      ),
                      child: Text(
                        "ADD TO CART",
                        style: TextStyle(
                            color: white, fontFamily: 'a', fontWeight: bold),
                        textScaleFactor: 1.1,
                      ),
                    ),
                    onTap: () {
                      Choose(context, widget.url, widget.price, widget.color,
                          widget.size, 'ADD TO CART');
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
