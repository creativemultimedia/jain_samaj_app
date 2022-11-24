import 'package:flutter/material.dart';
import 'package:jain_samaj_app/config/color.dart';
import 'package:jain_samaj_app/config/font_style.dart';
import 'package:jain_samaj_app/pages/my_order/view_order_detail.dart';

class my_order_page extends StatefulWidget {
  const my_order_page({Key? key}) : super(key: key);

  @override
  State<my_order_page> createState() => _my_order_pageState();
}

class _my_order_pageState extends State<my_order_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color.blue,
        elevation: 0,
        title: Text(
          "My Orders",
          style: appbartext,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10, right: 5, left: 2),
              height: MediaQuery.of(context).size.height / 12,
              child:
                  ListView(scrollDirection: Axis.horizontal, children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width / 5,
                  decoration: BoxDecoration(
                    color: color.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(
                      width: 1,
                      color: color.grey,
                    ),
                  ),
                  margin: EdgeInsets.all(5),
                  child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 5),
                      child: Text(
                        "All(6)",
                        style: TextStyle(fontSize: 14, fontFamily: 'regular'),
                      )),
                ),
                Container(
                  width: MediaQuery.of(context).size.width /2.8,
                  decoration: BoxDecoration(
                    color: color.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(
                      width: 1,
                      color: Colors.black12,
                    ),
                  ),
                  margin: EdgeInsets.all(5),
                  child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 5),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 7),
                              child: Icon(Icons.circle,
                                  color: color.yellow, size: 10)),
                          Text(
                            " On Delivery(3)",
                            style:
                                TextStyle(fontSize: 14, fontFamily: 'regular'),
                          ),
                        ],
                      )),
                ),
                    Container(
                      width: MediaQuery.of(context).size.width /2.8,
                      decoration: BoxDecoration(
                        color: color.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                          width: 1,
                          color: Colors.black12,
                        ),
                      ),
                      margin: EdgeInsets.all(5),
                      child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(top: 5),
                          child: Row(
                            children: [
                              Container(
                                  margin: EdgeInsets.only(left: 7),
                                  child: Icon(Icons.circle,
                                      color: color.green, size: 10)),
                              Text(
                                "  Delivered(2)",
                                style:
                                TextStyle(fontSize: 14, fontFamily: 'regular'),
                              ),
                            ],
                          )),
                    ),
              ]),
            ),
            Container(
              child:   ListView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return vieworderdetail();
                      },));
                    },
                    child: Card(
                      margin: EdgeInsets.symmetric(horizontal: 15,vertical: 7),
                      color: color.white,
                      child: ListTile(
                        trailing: Image(image: AssetImage("image/dropdownmanu.png")),
                        leading: Image(
                          image: AssetImage("image/my_order.png"),height: 45,width: 45,
                        ),
                        title: Text("Order ID",style: TextStyle(color: color.black,fontSize: 15,fontFamily: 'semibold')),
                        subtitle: Text("8/11/2022    . on Deliverey",style: TextStyle(color: color.black,fontSize: 12,fontFamily: 'regular')),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
