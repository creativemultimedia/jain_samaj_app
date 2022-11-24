import 'package:flutter/material.dart';
import 'package:jain_samaj_app/config/color.dart';
import 'package:jain_samaj_app/config/font_style.dart';
import 'package:jain_samaj_app/pages/navigator.dart';

import '../../main(.dart';

class yatra_detail extends StatefulWidget {
  const yatra_detail({Key? key}) : super(key: key);

  @override
  State<yatra_detail> createState() => _yatra_detailState();
}

class _yatra_detailState extends State<yatra_detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color.blue,
        elevation: 0,
        title: Text(
          "Yatra Details",
          style: appbartext,
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 20),
              child: Icon(
            Icons.wifi_calling_3,
          )),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(left: 20,top: 20),
                child: Text(
                  "Yatra Details",
                  style: TextStyle(fontSize: 14, fontFamily: 'semibold'),
                )),
            Container(
              decoration: BoxDecoration(
                color: color.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(
                  width: 1,
                  color: color.black,
                ),
              ),
              margin: EdgeInsets.only(top: 20,left: 15,right: 15),
              height: MediaQuery.of(context).size.height/2.8,
              width: MediaQuery.of(context).size.width/1,
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left:10,top: 10),
                        child: Image(image: AssetImage("image/birthdatelogo.png"),height:20,color: color.black),),
                      Container(
                          margin: EdgeInsets.only(left:10,top: 10),
                          child: Text("Yatra Date: 11/11/2022 to 13/11/2022",style: TextStyle(fontFamily: 'semibold',fontSize: 12))),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left:10,top: 10),
                        child: Image(image: AssetImage("image/akar-icons_location.png"),height:20,color: color.black),),
                      Container(
                          margin: EdgeInsets.only(left:10,top: 10),
                          child: Text("Yatra Location:: Delhi",style: TextStyle(fontFamily: 'semibold',fontSize: 12))),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left:10,top: 10),
                        child: Image(image: AssetImage("image/profile_logo (2).png"),height:20,color: color.black),),
                      Container(
                          margin: EdgeInsets.only(left:10,top: 10),
                          child: Text("Members Details",style: TextStyle(fontFamily: 'semibold',fontSize: 12))),
                    ],
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(left:40,top: 10),
                    child: Text("1. Rakesh Chirra (IMH10) ",style: TextStyle(fontSize: 12,fontFamily: 'regular')),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(left:40,top: 10),
                    child: Text("2. Akashay Jain (IMH12) ",style: TextStyle(fontSize: 12,fontFamily: 'regular')),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(left:40,top: 10),
                    child: Text("3. Neha Pathak (IMH13)  ",style: TextStyle(fontSize: 12,fontFamily: 'regular')),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(left:40,top: 10),
                    child: Text("4. Mayuresh Jain (IMH14)  ",style: TextStyle(fontSize: 12,fontFamily: 'regular')),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(left:40,top: 10),
                    child: Text("5. Pranavnath (IMH15)  ",style: TextStyle(fontSize: 12,fontFamily: 'regular')),
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left:10,top: 10),
                        child: Image(image: AssetImage("image/car.png"),height:20,color: color.black),),
                      Container(
                          margin: EdgeInsets.only(left:10,top: 10),
                          child: Text("Travel Mode:",style: TextStyle(fontFamily: 'semibold',fontSize: 12))),
                      Container(
                          margin: EdgeInsets.only(left:10,top: 10),
                          child: Text("Car",style: TextStyle(fontFamily: 'semibold',fontSize: 12))),
                    ],
                  ),
                ],
              ),
            ),
            Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(left: 20,top: 20),
                child: Text(
                  "Travel Details",
                  style: TextStyle(fontSize: 14, fontFamily: 'semibold'),
                )),
            Container(
              decoration: BoxDecoration(
                color: color.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(
                  width: 1,
                  color: color.black,
                ),
              ),
              margin: EdgeInsets.only(top: 20,left: 15,right: 15),
              height: MediaQuery.of(context).size.height/2.8,
              width: MediaQuery.of(context).size.width/1,
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                          margin: EdgeInsets.only(left:10,top: 10),
                          child: Text("Agent Name: ",style: TextStyle(fontFamily: 'semibold',fontSize: 12))),
                      Container(
                          margin: EdgeInsets.only(left:10,top: 10),
                          child: Text(" Manohar travels",style: TextStyle(fontFamily: 'regular',fontSize: 12))),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                          margin: EdgeInsets.only(left:10,top: 10),
                          child: Text("Mobile No.: ",style: TextStyle(fontFamily: 'semibold',fontSize: 12))),
                      Container(
                          margin: EdgeInsets.only(left:30,top: 10),
                          child: Text("124567890",style: TextStyle(fontFamily: 'regular',fontSize: 12))),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                          margin: EdgeInsets.only(left:10,top: 10),
                          child: Text("Remark: ",style: TextStyle(fontFamily: 'semibold',fontSize: 12))),
                      Container(
                          margin: EdgeInsets.only(left:50,top: 10,right: 10),
                          child: Text("We have booked agent for your"
                             ,style: TextStyle(fontFamily: 'regular',fontSize: 12))),

                    ],
                  ),
                  Container(
                      margin: EdgeInsets.only(left:115,right: 10),
                      child: Text("travel dates. Agent's Car will be Maruti Swift Desire Registration number: MH04BK1646 In case of any queries feel free to contact us: +91 8667387474"
                          ,style: TextStyle(fontFamily: 'regular',fontSize: 12))),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20,left: 15,right: 7,bottom: 10),
              width:MediaQuery.of(context).size.width/2,
              height: MediaQuery.of(context).size.height/18.5,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: color.blue, //background color of button
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
                  }, child: Text("Download Ticket",style: TextStyle(
                fontSize:14.5,
                fontFamily: 'regular',
                color: color.white,
              ),)),
            ),
          ],
        ),
      ),
    );
  }
}
