import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jain_samaj_app/config/color.dart';
import 'package:jain_samaj_app/config/font_style.dart';
import 'package:jain_samaj_app/pages/login_system/login_page.dart';
import 'package:jain_samaj_app/pages/my_order/my_order_page.dart';
import 'package:jain_samaj_app/pages/profile/my_yataras.dart';
import 'package:shared_preferences/shared_preferences.dart';

class profile_page extends StatefulWidget {
  const profile_page({Key? key}) : super(key: key);

  @override
  State<profile_page> createState() => _profile_pageState();
}

class _profile_pageState extends State<profile_page> {
  GetStorage box =GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          title: Text(
            "Profile",
            style: appbartext,
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
            alignment: Alignment.center,
              child: Image(image: AssetImage("image/profileimage.png"),height: 150,width: 150),
            ),
            Container(
              child: Text("Prashanth",style: TextStyle(fontFamily: 'semibold',fontSize: 18,color: color.blue)),
            ),
            Container(
              child: Text("Member Id: IMH58",style: TextStyle(fontSize: 12,fontFamily: 'semibold')),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return my_order_page();
                },));
              },
              child: Row(
                children: [
                  Container(

                    margin: EdgeInsets.only(top: 30,left: 30),
                    child: Text("My Orders",style: TextStyle(fontFamily: 'semibold',fontSize: 15)),
                  ),
                  Spacer(),
                  Container(
                    margin: EdgeInsets.only(top: 30,right: 40),
                    child:Icon(Icons.chevron_right_rounded,size: 30,)
                  )
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return my_yatras();
                },));
              },
              child: Row(
                children: [
                  Container(

                    margin: EdgeInsets.only(top: 10,left: 30),
                    child: Text("My Yatra",style: TextStyle(fontFamily: 'semibold',fontSize: 15)),
                  ),
                  Spacer(),
                  Container(
                      margin: EdgeInsets.only(top: 10,right: 40),
                      child:Icon(Icons.chevron_right_rounded,size: 30,)
                  )
                ],
              ),
            ),
            InkWell(
              child: Row(
                children: [
                  Container(

                    margin: EdgeInsets.only(top: 10,left: 30),
                    child: Text("Edit Profile",style: TextStyle(fontFamily: 'semibold',fontSize: 15)),
                  ),
                  Spacer(),
                  Container(
                      margin: EdgeInsets.only(top: 10,right: 40),
                      child:Icon(Icons.chevron_right_rounded,size: 30,)
                  )
                ],
              ),
            ),
            InkWell(
              child: Row(
                children: [
                  Container(

                    margin: EdgeInsets.only(top: 10,left: 30),
                    child: Text("Language Change",style: TextStyle(fontFamily: 'semibold',fontSize: 15)),
                  ),
                  Spacer(),
                  Container(
                      margin: EdgeInsets.only(top: 10,right: 40),
                      child:Icon(Icons.chevron_right_rounded,size: 30,)
                  )
                ],
              ),
            ),
            InkWell(
              child: Row(
                children: [
                  Container(

                    margin: EdgeInsets.only(top: 10,left: 30),
                    child: Text("Terms & Conditions",style: TextStyle(fontFamily: 'semibold',fontSize: 15)),
                  ),
                  Spacer(),
                  Container(
                      margin: EdgeInsets.only(top: 10,right: 40),
                      child:Icon(Icons.chevron_right_rounded,size: 30,)
                  )
                ],
              ),
            ),
            InkWell(
              child: Row(
                children: [
                  Container(

                    margin: EdgeInsets.only(top: 10,left: 30),
                    child: Text("Privacy Policy",style: TextStyle(fontFamily: 'semibold',fontSize: 15)),
                  ),
                  Spacer(),
                  Container(
                      margin: EdgeInsets.only(top: 10,right: 40),
                      child:Icon(Icons.chevron_right_rounded,size: 30,)
                  )
                ],
              ),
            ),


            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: new Text('Are you sure Logout?'),
                    content: new Text('Do you want to Logout an App'),
                    actions: <Widget>[
                      TextButton(
                        style: TextButton.styleFrom(

                        ),
                        onPressed: () async{


                          box.remove('user_id');
                          box.remove('user_name');
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (context) => login_page(),
                              ),
                                  (route) => false);
                        },
                        child: Text(
                          'YES',
                          style: TextStyle(

                              fontSize: 16),
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(

                        ),
                        onPressed: () {
                          Get.back();
                        },
                        child: Text(
                          'NO',
                          style: TextStyle(

                              fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                );
              },
              child: Row(
                children: [
                  Container(

                    margin: EdgeInsets.only(top: 10,left: 30),
                    child: Text("Log out",style: TextStyle(fontFamily: 'semibold',fontSize: 15)),
                  ),
                  Spacer(),
                  Container(
                      margin: EdgeInsets.only(top: 10,right: 40),
                      child:Icon(Icons.chevron_right_rounded,size: 30,)
                  )
                ],
              ),
            ),
            

          ],
        ),
      ),
    );
  }
}
