import 'dart:developer';

import 'package:eco/src/features/add_to_cart/bloc/cart_bloc.dart';
import 'package:eco/src/features/product/widget/color.dart';
import 'package:eco/src/features/product/widget/size_widget.dart';
import 'package:eco/src/utils/constants/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

CartBloc cartBloc = CartBloc();

Choose(context, String url, String price, var color, var size, String btn) {
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;
  bool issize = false;
  return showMaterialModalBottomSheet(
    context: context,
    builder: (context) => Container(
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            width: width,
            height: height * 0.1,
            child: Row(
              children: [
                Container(
                  height: height * 0.1 - 10,
                  width: height * 0.1 - 10,
                  child: FadeInImage.assetNetwork(
                      imageCacheWidth: 500,
                      placeholder: 'assets/images/load.gif',
                      image: url),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: Container(
                  child: Text(
                    "${price}\$",
                    style: TextStyle(
                        color: Colors.red.shade600,
                        fontFamily: 'a',
                        fontWeight: bold),
                    textScaleFactor: 1,
                  ),
                )),
                Icon(
                  Icons.close_sharp,
                  color: Colors.red.shade600,
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            width: width,
            height: 1,
            color: Colors.grey.shade200,
          ),
          Colorr(color: color, url: url),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            width: width,
            height: 1,
            color: Colors.grey.shade200,
          ),
          SizedBox(
            height: 10,
          ),
          Sizee(size: size),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            width: width,
            height: 1,
            color: Colors.grey.shade200,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  child: Text(
                    "Quantity",
                    style: TextStyle(fontFamily: 'a', fontWeight: bold),
                  ),
                )),
                Expanded(
                    child: Container(
                  height: 30,
                  width: 130,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 30,
                        width: 130,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          children: [
                            Container(
                                alignment: Alignment.center,
                                width: 30,
                                child: Text(
                                  "-",
                                  style: TextStyle(
                                      color: Colors.red.shade600,
                                      fontFamily: 'a'),
                                  textScaleFactor: 1,
                                )),
                            Container(
                              width: 1.5,
                              height: 30,
                              color: white,
                            ),
                            Container(
                                alignment: Alignment.center,
                                width: 40,
                                child: Text(
                                  "1",
                                  style: TextStyle(fontFamily: 'a'),
                                  textScaleFactor: 1,
                                )),
                            Container(
                              width: 1.5,
                              height: 30,
                              color: white,
                            ),
                            Container(
                                alignment: Alignment.center,
                                width: 30,
                                child: Text(
                                  "+",
                                  style: TextStyle(
                                      color: Colors.green.shade600,
                                      fontFamily: 'a'),
                                  textScaleFactor: 1,
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                ))
              ],
            ),
          ),
          Expanded(
              child: Container(
            padding: EdgeInsets.only(bottom: 20),
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  child: Container(
                    alignment: Alignment.center,
                    width: width * 0.9,
                    height: 50,
                    decoration: BoxDecoration(
                      color: maincolor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      btn,
                      style: TextStyle(color: white, fontWeight: bold),
                      textScaleFactor: 1.1,
                    ),
                  ),
                  onTap: (){
                    if (btn == "ADD TO CART"){
                      cartBloc.add(AddtoCartPress(color: color[index], size: size, qty: 1));
                    }
                  },
                ),
              ],
            ),
          ))
        ],
      ),
    ),
  );
}
