import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jain_samaj_app/config/color.dart';
import 'package:jain_samaj_app/config/font_style.dart';
import 'package:jain_samaj_app/pages/home/sucsses_page.dart';
import 'package:http/http.dart' as http;
class book_yatra extends StatefulWidget {


  @override
  State<book_yatra> createState() => _book_yatraState();
}

class _book_yatraState extends State<book_yatra> {
  // Future get_add_memebr() async {
  //   Map map_login = {
  //     "device_type":"MOB",
  //     "user_id":"MOB",
  //     "slug":"shri-digamber-jain-mandir ",
  //     "date_series":"2022-11-30,2022-12-01",
  //     "yatra_travel_mode_id":"1",
  //     "members":"1,2,3,4,8",
  //     "country":"India",
  //     "state":"Maharashtra",
  //     "city":"Palghar",
  //     "pincode":"401404",
  //
  //   };
  //   var url = Uri.parse('https://scprojects.in.net/projects/samarpanam/api_/app/yatra_location_booking');
  //   var response = await http.post(url, body: map_login, headers: {
  //     "Content-Type": "application/x-www-form-urlencoded",
  //     "Client-Service": "frontend-client-samarpanam",
  //     "Auth-Key": "simplerestapi_samarpanam",
  //     "User-ID": "1",
  //   },encoding: Encoding.getByName('utf-8'),
  //   );
  //   print(" dvklnx $map_login");
  //   print(response.body);
  //   Map<String, dynamic> finalist = await jsonDecode(response.body);
  //   add_member = yatra_add_menber_add.fromJson(finalist);
  //   loader.hideLoading();
  //   if(response.statusCode==200)
  //   {
  //     if(add_member!.status==200)
  //     {
  //       box.write("user_id", add_member!.response![0].userId!);
  //
  //     }
  //     else
  //     {
  //       loader.showErroDialog(description: add_member!.message!);
  //     }
  //   }
  //   else if(response.statusCode==400)
  //   {
  //     Map<String, dynamic> finalist = await jsonDecode(response.body);
  //
  //     BAD.badrespondce_model?bad = BAD.badrespondce_model.fromJson(finalist);
  //     loader.showErroDialog(description: bad.message!);
  //   }
  //   else
  //   {
  //     loader.hideLoading();
  //     loader.showErroDialog(description: "Something went wrong");
  //     print("error");
  //   }
  //   return add_member;
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color.blue,
          title: Text(
            "Booking Confirmation",
            style: appbartext,
          )),
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
              // height: MediaQuery.of(context).size.height/7,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 45,left: 15,right: 7),
                    width:MediaQuery.of(context).size.width/2.4,
                    height: MediaQuery.of(context).size.height/18.5,
                    child: ElevatedButton(

                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white, //background color of button
                          side: BorderSide( color:color.blue), //border width and color
                          elevation: 3, //elevation of button
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          //content padding inside button
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return sucessfully();
                          },));
                        }, child: Text("Cancel Booking",style: skipbutton,)),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 45,left: 15,right: 7),
                    width:MediaQuery.of(context).size.width/2.4,
                    height: MediaQuery.of(context).size.height/18.5,
                    child: ElevatedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: color.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {

                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return sucessfully();
                          },));

                        }, child: Text("Confirm Booking",style: loginbutton,)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
