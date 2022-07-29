import 'dart:developer';

import 'package:eco/src/features/add_to_cart/bloc/cart_bloc.dart';
import 'package:eco/src/utils/constants/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

CartBloc cartBloc = CartBloc();

class Sizee extends StatefulWidget {
  // const Size({ Key? key }) : super(key: key);
  var size;
  Sizee({required this.size});

  @override
  State<Sizee> createState() => _SizeeState();
}

class _SizeeState extends State<Sizee> {
  int? id;
  @override
  Widget build(BuildContext context) {
    log(widget.size.toString() + "SIZEE");
    return Container(
      child: Column(
        children: [
          widget.size != null
              ? BlocListener(
                  bloc: cartBloc,
                  listener: (context, state) {
                    if (state is Choosingsize) {
                    } else if (state is Errorhoosingsize) {
                    } else if (state is Choosedsize) {
                      // issize = true;
                    }
                    // print(issize);
                    // log(cartBloc.sizeindex.toString());
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
                        itemCount: widget.size.length,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              InkWell(
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    border: id != null && id == index
                                        ? Border.all(color: maincolor, width: 2)
                                        : null,
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Text(
                                    widget.size[index],
                                    style: TextStyle(fontFamily: 'a'),
                                  ),
                                ),
                                onTap: () {
                                  setState(() {
                                    id = index;
                                  });
                                  cartBloc.add(choosesize(
                                      size: widget.size[index], index: index));
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
        ],
      ),
    );
  }
}
