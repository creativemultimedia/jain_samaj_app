import 'package:flutter/material.dart';
import 'package:jain_samaj_app/config/color.dart';
import 'package:jain_samaj_app/config/font_style.dart';
import 'package:jain_samaj_app/pages/my_order/view_order_detail.dart';
import 'package:jain_samaj_app/pages/navigator.dart';

import '../../main(.dart';

class order_sucssesfully extends StatefulWidget {
  const order_sucssesfully({Key? key}) : super(key: key);

  @override
  State<order_sucssesfully> createState() => _order_sucssesfullyState();
}

class _order_sucssesfullyState extends State<order_sucssesfully> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 90),
              alignment: Alignment.center,
              child: Image(image: AssetImage("image/Capture.PNG"),),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Text("Order Sucessfully Placed",style: TextStyle(fontFamily: 'semibold',fontSize: 14)),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text("We have recieved your Order. ",style: TextStyle(fontFamily: 'regular',fontSize: 12,color: color.grey)),
            ),
            Container(
              child: Text("sucessfully and will be delivered soon ",style: TextStyle(fontFamily: 'regular',fontSize: 12,color: color.grey)),
            ),

            Container(
              margin: EdgeInsets.only(top: 45,left: 15,right: 7),
              width:MediaQuery.of(context).size.width/2,
              height: MediaQuery.of(context).size.height/18.5,
              child: ElevatedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor:color.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return vieworderdetail();
                    },));

                  }, child: Text("View Order Details",style: loginbutton,)),
            ),
            Container(
              margin: EdgeInsets.only(top: 20,left: 15,right: 7),
              width:MediaQuery.of(context).size.width/2,
              height: MediaQuery.of(context).size.height/18.5,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: color.white, //background color of button
                    side: BorderSide( color:color.blue), //border width and color
                    elevation: 3, //elevation of button
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    //content padding inside button
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return main_pages(0);
                    },));
                  }, child: Text("Back to Home",style: skipbutton,)),
            ),
          ],
        ),
      ),
    );
  }
}
