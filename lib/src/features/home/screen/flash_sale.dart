import 'package:flutter/material.dart';
import 'package:eco/src/utils/constants/app_constant.dart';

class FlashSale extends StatefulWidget {
  const FlashSale({Key? key}) : super(key: key);

  @override
  State<FlashSale> createState() => _FlashSaleState();
}

class _FlashSaleState extends State<FlashSale> {
  List<String> flasesale = [
    "assets/images/tb_image_share_1645953828218.jpg.png",
    "assets/images/tb_image_share_1646760326383.jpg.png",
    "assets/images/flase3.png",
    "assets/images/flase4.png",
    "assets/images/flase5.png",
  ];
  List<String> price = [
    "7.00 \$",
    "6.00 \$",
    "4.67 \$",
    "9.93 \$",
    "3.44 \$",
  ];
  List<String> discount = [
    "20% off",
    "50% off",
    "60% off",
    "30% off",
    "30% off",
  ];
  List<String> before = [
    "10.00 \$",
    "12.00 \$",
    "10.67 \$",
    "13.13 \$",
    "5.34 \$",
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.all(10),
      width: width * 0.95,
      height: height * 0.23,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: white,
          boxShadow: [
            // BoxShadow(
            //     color: Colors.grey.shade300,
            //     offset: Offset(1, 1),
            //     blurRadius: 5)
          ]),
      child: Column(
        children: [
          Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Flase Sale",
                style: TextStyle(fontFamily: 'a', fontWeight: bold, color: Colors.red.shade600),
                textScaleFactor: 1.1,
              )),
          Expanded(
              child: Container(
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      Container(
                        width: width * 0.23,
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: white,
                            boxShadow: [
                              // BoxShadow(
                              //     color: Colors.grey.shade200,
                              //     offset: Offset(1, 1),
                              //     blurRadius: 5),
                              // BoxShadow(
                              //   color: Colors.white,
                              //   offset: -Offset(1, 1),
                              //   blurRadius: 5
                              // )
                            ]),
                        child: Column(
                          children: <Widget>[
                            Image(image: AssetImage(flasesale[index])),
                            SizedBox(
                              height: 5,
                            ),
                            Expanded(
                                child: Column(
                              children: [
                                Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      price[index],
                                      style: TextStyle(
                                          color: Colors.red.shade800,
                                          fontFamily: 'a',
                                          fontWeight: bold),
                                      textScaleFactor: 1,
                                    )),
                                Stack(
                                  children: [
                                    Text(before[index], style: TextStyle(color: Colors.grey),),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 50),
                                      child: Divider(
                                        
                                        color: Colors.grey,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ))
                          ],
                        ),
                      ),
                      Container(
                        width: width * 0.25,
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.only(top: 6),
                        child: Row(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              // width: 40,
                              height: 20,
                              color: Colors.red.shade600.withOpacity(0.5),
                              child: Text(
                                discount[index],
                                style: TextStyle(
                                    color: white,
                                    fontFamily: 'a',
                                    fontWeight: bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }),
          ))
        ],
      ),
    );
  }
}
