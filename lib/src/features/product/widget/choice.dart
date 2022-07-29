import 'dart:developer';

import 'package:eco/src/features/add_to_cart/bloc/cart_bloc.dart';
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
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
            child: Text(
              "Color (${color.length})",
              style: TextStyle(fontFamily: 'a', fontWeight: bold),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.centerLeft,
            // color: maincolor,
            padding: EdgeInsets.only(left: 10),
            height: height * 0.18,
            // width: height * 0.20,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: color.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        height: height * 0.18,
                        width: height * 0.15,
                        decoration: BoxDecoration(
                          // border: ,
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Column(
                          children: [
                            Container(
                              child: FadeInImage.assetNetwork(
                                  imageCacheWidth: 500,
                                  placeholder: 'assets/images/load.gif',
                                  image: url),
                            ),
                            Text("Color")
                          ],
                        ),
                      ),
                    ],
                  );
                }),
          ),
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
          size != null
              ? Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    "Size",
                    style: TextStyle(fontFamily: 'a', fontWeight: bold),
                  ),
                )
              : Container(),
          SizedBox(
            height: 10,
          ),
          size != null
              ? BlocListener(
                  bloc: cartBloc,
                  listener: (context, state) {
                    if (state is Choosingsize) {
                    } else if (state is Errorhoosingsize) {
                    } else if (state is Choosedsize) {
                      issize = true;
                    }
                    print(issize);
                    log(cartBloc.sizeindex.toString());
                  },
                  child: Container(
                    alignment: Alignment.centerLeft,
                    // color: maincolor,
                    padding: EdgeInsets.only(left: 10),
                    height: 50,
                    // width: height * 0.20,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: size.length,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              InkWell(
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    border: cartBloc.sizeindex != null
                                        ? Border.all(color: maincolor, width: 2)
                                        : null,
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Text(
                                    size[index],
                                    style: TextStyle(fontFamily: 'a'),
                                  ),
                                ),
                                onTap: () {
                                  cartBloc.add(choosesize(
                                      size: size[index], index: index));
                                },
                              ),
                              SizedBox(
                                width: 10,
                              )
                            ],
                          );
                        }),
                  ),
                )
              : Container(),
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
                Container(
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
              ],
            ),
          ))
        ],
      ),
    ),
  );
}
