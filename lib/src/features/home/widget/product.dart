import 'package:cached_network_image/cached_network_image.dart';
import 'package:eco/src/features/product/product_detail_screen.dart';
import 'package:eco/src/utils/constants/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:shimmer/shimmer.dart';

class Product extends StatefulWidget {
  // const Product({Key? key}) : super(key: key);
  final String dis;
  final String disp;
  final String title;
  final String price;
  final String url;
  final String pf;
  final String name;
  final String discount;
  var color;
  var size;
  Product(
      {required this.dis,
      required this.disp,
      required this.title,
      required this.price,
      required this.url,
      required this.pf,
      required this.name,
      required this.discount, required this.color, required this.size});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  bool _enabled = true;
  @override
  Widget build(BuildContext context) {
    print(widget.url);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return InkWell(
      child: GridTile(
        child: AspectRatio(
          aspectRatio: 5 / 8,
          child: Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.all(5),
            width: width * 0.4,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.grey.shade200,
                offset: Offset(1, 1),
                blurRadius: 5,
              )
            ], color: white, borderRadius: BorderRadius.circular(5)),
            child: Column(
              children: [
                Container(
                  child: FadeInImage.assetNetwork(
                    imageCacheWidth: 500,
                    placeholder: 'assets/images/load.gif',
                    image: '${widget.url}',
                  ),
                ),
                Expanded(
                    child: Container(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 5, right: 5, top: 5),
                        child: widget.disp != ""
                            ? Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          '${widget.price}\$',
                                          style: TextStyle(
                                              color: Colors.red.shade700,
                                              fontFamily: 'a',
                                              fontWeight: bold),
                                          textScaleFactor: 1.2,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          '${widget.disp}\$',
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.lineThrough,
                                            color: Colors.grey,
                                            fontFamily: 'a',
                                            fontWeight: bold,
                                          ),
                                          // textScaleFactor: 1.2,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container()
                                ],
                              )
                            : Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '${widget.price}\$',
                                  style: TextStyle(
                                      color: Colors.red.shade700,
                                      fontFamily: 'a',
                                      fontWeight: bold),
                                  textScaleFactor: 1.2,
                                ),
                              ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          widget.title,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontFamily: 'a',
                              fontWeight: bold,
                              color: Colors.grey),
                          maxLines: 2,
                          textScaleFactor: 1,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Container(
                            padding: EdgeInsets.only(left: 10),
                            child: Row(
                              children: [
                                Container(
                                  width: 30,
                                  height: 30,
                                  child: CircleAvatar(
                                    backgroundColor: maincolor.withOpacity(0.3),
                                    backgroundImage: NetworkImage(widget.pf),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  widget.name,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontFamily: 'a'),
                                )
                              ],
                            ),
                          )),
                          Container(
                            padding: EdgeInsets.only(right: 10),
                            alignment: Alignment.centerRight,
                            child: Icon(
                              Icons.favorite_border,
                              color: maincolor,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ))
              ],
            ),
          ),
        ),
      ),
      onTap: () {
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => ProductDetailScreen(url: widget.url)));
        pushNewScreen(
          context,
          screen: ProductDetailScreen(
            url: widget.url,
            price: widget.price,
            disp: widget.disp,
            title: widget.title,
            discount: widget.discount,
            pf: widget.pf,
            name: widget.name, color: widget.color, size: widget.size,
          ),
          withNavBar: false,
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );
      },
    );
  }
}
