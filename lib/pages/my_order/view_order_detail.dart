import 'package:flutter/material.dart';
import 'package:jain_samaj_app/config/color.dart';
import 'package:jain_samaj_app/config/font_style.dart';
import 'package:jain_samaj_app/pages/my_order/order_tracking.dart';

class vieworderdetail extends StatefulWidget {
  const vieworderdetail({Key? key}) : super(key: key);

  @override
  State<vieworderdetail> createState() => _vieworderdetailState();
}

class _vieworderdetailState extends State<vieworderdetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color.blue,
        elevation: 0,
        title: Text(
          "Order Details",
          style: appbartext,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: 20, left: 20),
              child: Text("Products",
                  style: TextStyle(fontSize: 15, fontFamily: 'semibold')),
            ),
            Container(
              decoration: BoxDecoration(
                color: color.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(
                  width: 1,
                  color: color.grey,
                ),
              ),
              margin: EdgeInsets.only(
                left: 20,
                right: 15,
                top: 10,
              ),
              height: MediaQuery.of(context).size.height / 7,
              width: MediaQuery.of(context).size.width / 1,
              child: Row(
                children: [
                  Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(top: 15, bottom: 15, left: 30),
                      child: Image(
                        image: AssetImage("image/book_1.png"),
                      )),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                            margin: EdgeInsets.only(left: 15, top: 10),
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Product 3",
                              style: TextStyle(
                                  fontFamily: 'semibold', fontSize: 15),
                            )),
                        Container(
                          margin: EdgeInsets.only(left: 15, top: 5),
                          alignment: Alignment.topLeft,
                          child: Text(
                            "English, 3 months",
                            style:
                                TextStyle(fontFamily: 'regular', fontSize: 10),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: 15,
                            top: 5,
                          ),
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Return till 12/02/2023 to Mumbai Gyan Bandar",
                            style: TextStyle(
                                fontFamily: 'regular',
                                fontSize: 7,
                                color: color.red),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                      margin: EdgeInsets.only(right: 10),
                      child: Text(
                        "₹1999",
                        style: TextStyle(fontSize: 14, fontFamily: 'semibold'),
                      )),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: color.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(
                  width: 1,
                  color: color.grey,
                ),
              ),
              margin: EdgeInsets.only(
                left: 20,
                right: 15,
                top: 10,
              ),
              height: MediaQuery.of(context).size.height / 7,
              width: MediaQuery.of(context).size.width / 1,
              child: Row(
                children: [
                  Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(top: 15, bottom: 15, left: 30),
                      child: Image(
                        image: AssetImage("image/book_1.png"),
                      )),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                            margin: EdgeInsets.only(left: 15, top: 10),
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Product 3",
                              style: TextStyle(
                                  fontFamily: 'semibold', fontSize: 15),
                            )),
                        Container(
                          margin: EdgeInsets.only(left: 15, top: 5),
                          alignment: Alignment.topLeft,
                          child: Text(
                            "English, 3 months",
                            style:
                                TextStyle(fontFamily: 'regular', fontSize: 10),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: 15,
                            top: 5,
                          ),
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Return till 12/02/2023 to Mumbai Gyan Bandar",
                            style: TextStyle(
                                fontFamily: 'regular',
                                fontSize: 7,
                                color: color.red),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                      margin: EdgeInsets.only(right: 10),
                      child: Text(
                        "₹1999",
                        style: TextStyle(fontSize: 14, fontFamily: 'semibold'),
                      )),
                ],
              ),
            ),
            Divider(
              thickness: 4,
              color: Colors.black12,
              height: 50,
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 20),
              child: Text("Order Details",
                  style: TextStyle(fontSize: 15, fontFamily: 'semibold')),
            ),
            Container(
              decoration: BoxDecoration(
                color: color.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(
                  width: 1,
                  color: color.grey,
                ),
              ),
              margin: EdgeInsets.only(
                left: 20,
                right: 15,
                top: 10,
                bottom: 20
              ),
              height: MediaQuery.of(context).size.height /4,
              width: MediaQuery.of(context).size.width / 1,
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                          margin: EdgeInsets.only(top: 10, left: 10),
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Order Id",
                            style: TextStyle(fontFamily: 'regular'),
                          )),
                      Container(
                          margin: EdgeInsets.only(top: 10, left: 30),
                          alignment: Alignment.topLeft,
                          child: Text(
                            "#0012345",
                            style: TextStyle(fontFamily: 'regular'),
                          )),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                          margin: EdgeInsets.only(top: 10, left: 10),
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Quantity",
                            style: TextStyle(fontFamily: 'regular'),
                          )),
                      Container(
                          margin: EdgeInsets.only(top: 10, left: 30),
                          alignment: Alignment.topLeft,
                          child: Text(
                            "1000",
                            style: TextStyle(fontFamily: 'regular'),
                          )),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                          margin: EdgeInsets.only(top: 10, left: 10),
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Order Total",
                            style: TextStyle(fontFamily: 'regular'),
                          )),
                      Container(
                          margin: EdgeInsets.only(top: 10, left: 30),
                          alignment: Alignment.topLeft,
                          child: Text(
                            "₹8144",
                            style: TextStyle(fontFamily: 'semibold'),
                          )),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                          margin: EdgeInsets.only(top: 10, left: 10),
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Order Status",
                            style: TextStyle(fontFamily: 'regular'),
                          )),
                      Container(
                          margin: EdgeInsets.only(top: 10, left: 30),
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Sucess",
                            style: TextStyle(fontFamily: 'semibold',color: Colors.green),
                          )),
                    ],
                  ),
                  Divider(color: Colors.black12,thickness: 2,),
                  Row(
                    children: [
                      Container(
                          margin: EdgeInsets.only(top: 10, left: 10),
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Download Invoice",
                            style: TextStyle(fontFamily: 'regular'),
                          )),
                     Spacer(),
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        child: Icon(Icons.chevron_right_rounded,size: 30),)
                    ]
                  ),
                ],
              ),
            ),
            Divider(color: Colors.black12,thickness: 2,),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return order_tracking();
                },));
              },
              child: Row(
                  children: [
                    Container(
                        margin: EdgeInsets.only(top: 10, left: 20),
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Order Tracking",
                          style: TextStyle(fontFamily: 'regular'),
                        )),
                    Spacer(),
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      child: Icon(Icons.chevron_right_rounded,size: 30),)
                  ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}
