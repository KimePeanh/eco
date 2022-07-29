import 'package:eco/src/utils/constants/app_constant.dart';
import 'package:flutter/material.dart';

class Colorr extends StatefulWidget {
  // const Colorr({ Key? key }) : super(key: key);
  var color;
  final String url;
  Colorr({required this.color, required this.url});

  @override
  State<Colorr> createState() => _ColorrState();
}

class _ColorrState extends State<Colorr> {
  int? id;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
            child: Text(
              "Color (${widget.color.length})",
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
                itemCount: widget.color.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    child: Column(
                      children: [
                        Container(
                          height: height * 0.18,
                          width: height * 0.15,
                          decoration: BoxDecoration(
                            // border: ,
                            border: id != null && id == index
                                ? Border.all(color: maincolor, width: 2)
                                : null,
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Column(
                            children: [
                              Container(
                                child: FadeInImage.assetNetwork(
                                    imageCacheWidth: 500,
                                    placeholder: 'assets/images/load.gif',
                                    image: widget.color[index]),
                              ),
                              Text("Color")
                            ],
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      setState(() {
                        id = index;
                      });
                    },
                  );
                }),
          ),
        ],
      ),
    );
  }
}
