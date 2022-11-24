import 'package:flutter/material.dart';
import 'package:jain_samaj_app/config/color.dart';
import 'package:jain_samaj_app/config/font_style.dart';
import 'package:timeline_tile/timeline_tile.dart';

class order_tracking extends StatefulWidget {
  const order_tracking({Key? key}) : super(key: key);

  @override
  State<order_tracking> createState() => _order_trackingState();
}

class _order_trackingState extends State<order_tracking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color.blue,
          elevation: 0,
          title: Text(
            "Order Details",
            style: appbartext,
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: 20, left: 20),
              child: Text("Order Details",
                  style: TextStyle(fontSize: 15, fontFamily: 'semibold')),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: 5, left: 20),
              child: Row(
                children: [
                  Text("Order id :",
                      style: TextStyle(fontSize: 15, fontFamily: 'regular')),
                  Text(" #0012345",
                      style: TextStyle(fontSize: 15, fontFamily: 'semibold')),
                  Spacer(),
                  Text("Delivery Date : 22/11/2022   ",
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'regular',
                          color: color.grey)),
                ],
              ),
            ),
            Divider(
              color: Colors.black12,
              thickness: 2,
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: 10, left: 20),
              child: Text("Tracking",
                  style: TextStyle(fontSize: 15, fontFamily: 'semibold')),
            ),
            Container(
              margin: EdgeInsets.only(left: 25),
              alignment: Alignment.topLeft,
              height: MediaQuery.of(context).size.height / 1.3,
              child: Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1,
                    height: MediaQuery.of(context).size.height / 6,
                    child: TimelineTile(
                      alignment: TimelineAlign.start,
                      endChild: Column(
                        children: [
                          Container(
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.only(top: 60, left: 10),
                              child: Text(
                                'Sender Information',
                                style: TextStyle(
                                    fontFamily: 'semibold', fontSize: 13),
                              )),
                          Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(top: 10, left: 10),
                            child: Text("Rakesh Chirra (+91 1234567890)",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: color.grey,
                                    fontFamily: 'regular')),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(top: 5, left: 10),
                            child: Text(
                                "The destination of this package is place",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: color.grey,
                                    fontFamily: 'regular')),
                          )
                        ],
                      ),
                      afterLineStyle:
                          LineStyle(color: Colors.blue, thickness: 6),
                      isFirst: true,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1,
                    height: MediaQuery.of(context).size.height / 4,
                    child: TimelineTile(
                      alignment: TimelineAlign.start,
                      endChild: Column(
                        children: [
                          Container(
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.only(top: 90, left: 10),
                              child: Text(
                                'Shipment Information',
                                style: TextStyle(
                                    fontFamily: 'semibold', fontSize: 13),
                              )),
                          Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(top: 5, left: 10),
                            child: Text("Packed has moved from",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: color.grey,
                                    fontFamily: 'regular')),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(top: 5, left: 10),
                            child: Text("Packed has moved reached",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: color.grey,
                                    fontFamily: 'regular')),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(top: 5, left: 10),
                            child: Text("Packed has moved from",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: color.grey,
                                    fontFamily: 'regular')),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(top: 5, left: 10),
                            child: Text("Packed has moved reached",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: color.grey,
                                    fontFamily: 'regular')),
                          ),
                        ],
                      ),
                      beforeLineStyle:
                          LineStyle(color: color.blue, thickness: 6),
                      afterLineStyle:
                          LineStyle(color: color.blue, thickness: 6),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1,
                    height: MediaQuery.of(context).size.height / 6,
                    child: TimelineTile(
                      alignment: TimelineAlign.start,
                      endChild: Column(
                        children: [
                          Container(
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.only(top: 60, left: 10),
                              child: Text(
                                'Out for Delivery',
                                style: TextStyle(
                                    fontFamily: 'semibold', fontSize: 13),
                              )),
                          Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(top: 5, left: 10),
                            child: Text("The order will be delivered by 9PM",
                                style: TextStyle(
                                    fontSize: 13,
                                    color: color.blue,
                                    fontFamily: 'semibold')),
                          ),
                        ],
                      ),
                      beforeLineStyle:
                          LineStyle(color: color.blue, thickness: 6),
                      afterLineStyle:
                          LineStyle(color: color.blue, thickness: 6),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1,
                    height: MediaQuery.of(context).size.height / 6,
                    child: TimelineTile(
                      alignment: TimelineAlign.start,
                      endChild: Column(
                        children: [
                          Container(
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.only(top: 55, left: 10),
                              child: Text(
                                'Order Delivered',
                                style: TextStyle(
                                    fontFamily: 'semibold', fontSize: 13),
                              )),
                        ],
                      ),
                      beforeLineStyle: LineStyle(thickness: 6),
                      isLast: true,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 2,
              color: Colors.black12,
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 20),
              child: Text("Package Details",
                  style: TextStyle(fontFamily: 'semibold', fontSize: 15)),
            ),
          ],
        ),
      ),
    );
  }
}
