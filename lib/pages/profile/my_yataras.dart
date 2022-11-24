import 'package:flutter/material.dart';
import 'package:jain_samaj_app/config/color.dart';
import 'package:jain_samaj_app/config/font_style.dart';
import 'package:jain_samaj_app/pages/profile/yatra_detail.dart';

class my_yatras extends StatefulWidget {
  const my_yatras({Key? key}) : super(key: key);

  @override
  State<my_yatras> createState() => _my_yatrasState();
}

class _my_yatrasState extends State<my_yatras> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color.blue,
        elevation: 0,
        title: Text(
          "My Yatras",
          style: appbartext,
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
        children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Colors.black12,
                )),
                height: MediaQuery.of(context).size.height / 16,
                width: MediaQuery.of(context).size.width / 2,
                child: Container(
                  alignment: Alignment.center,
                    child: Text("Upcoming Yatra",
                        style: TextStyle(
                            color: color.blue,
                            fontSize: 12,
                            fontFamily: 'semibold'))),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                    )),
                height: MediaQuery.of(context).size.height / 16,
                width: MediaQuery.of(context).size.width / 2,
                child: Container(
                    alignment: Alignment.center,
                    child: Text("Past Yatra",
                        style: TextStyle(
                            color: color.black,
                            fontSize: 12,
                            fontFamily: 'semibold'))),
              ),
        ],
      ),
              InkWell(
                 onTap: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context) {
                     return yatra_detail();
                   },));
                 },
                child: Container(
                  height: MediaQuery.of(context).size.height/9.5,
                  margin: EdgeInsets.only(left: 10, top: 40, right: 10),
                  decoration: BoxDecoration(
                    color: color.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(
                      width: 1,
                      color: Colors.black12,
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 5),
                          child: Image(
                            image: AssetImage("image/homepage.png"),
                            height: 55,
                            width: 55,
                          )),
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.only(top: 5,left:5,right: 2),
                              child: Text("Shri Digambar Jain Lal Mandir",style: TextStyle(fontFamily: 'semibold',fontSize: 12)),
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.only(left:5,right: 2),
                              child: Text("Date of Booking: 08/11/2022",style: TextStyle(fontFamily: 'regular',fontSize: 12)),
                            ),
                            Container(
                              margin: EdgeInsets.only(left:5,right: 2),
                              child: Row(
                                children: [
                                  Image(image: AssetImage("image/akar-icons_location.png"),width: 17,height: 17),
                                  Text("Delhi",style: TextStyle(fontFamily: 'regular',fontSize: 12),)
                                ],
                              ),
                            ),
                            Spacer(),
                            Container(
                              margin: EdgeInsets.only(left: 200),
                              width: MediaQuery.of(context).size.width/3.8,
                              alignment: Alignment.topRight,
                              decoration:BoxDecoration(
                                color: color.green,
                                borderRadius: BorderRadius.only(bottomRight:Radius.circular(10) ,topLeft: Radius.circular(5)),
                                border: Border.all(
                                  width: 1,
                                  color: color.grey,
                                ),

                              ) ,
                                child: Text(" Tickets Generated  ",style: TextStyle(color: color.white,fontSize: 10,fontFamily: 'regular'),)
                            ),

                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return yatra_detail();
                  },));
                },
                child: Container(
                  height: MediaQuery.of(context).size.height/9.5,
                  margin: EdgeInsets.only(left: 10, top: 10, right: 10),
                  decoration: BoxDecoration(
                    color: color.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(
                      width: 1,
                      color: Colors.black12,
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 5),
                          child: Image(
                            image: AssetImage("image/homepage.png"),
                            height: 55,
                            width: 55,
                          )),
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.only(top: 5,left:5,right: 2),
                              child: Text("Shri Digambar Jain Lal Mandir",style: TextStyle(fontFamily: 'semibold',fontSize: 12)),
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.only(left:5,right: 2),
                              child: Text("Date of Booking: 08/11/2022",style: TextStyle(fontFamily: 'regular',fontSize: 12)),
                            ),
                            Container(
                              margin: EdgeInsets.only(left:5,right: 2),
                              child: Row(
                                children: [
                                  Image(image: AssetImage("image/akar-icons_location.png"),width: 17,height: 17),
                                  Text("Delhi",style: TextStyle(fontFamily: 'regular',fontSize: 12),)
                                ],
                              ),
                            ),
                            Spacer(),
                            Container(
                                margin: EdgeInsets.only(left: 200),
                                width: MediaQuery.of(context).size.width/3.8,
                                alignment: Alignment.topRight,
                                decoration:BoxDecoration(
                                  color: color.green,
                                  borderRadius: BorderRadius.only(bottomRight:Radius.circular(10) ,topLeft: Radius.circular(5)),
                                  border: Border.all(
                                    width: 1,
                                    color: color.grey,
                                  ),

                                ) ,
                                child: Text(" Tickets Generated  ",style: TextStyle(color: color.white,fontSize: 10,fontFamily: 'regular'),)
                            ),

                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return yatra_detail();
                  },));
                },
                child: Container(
                  height: MediaQuery.of(context).size.height/9.5,
                  margin: EdgeInsets.only(left: 10, top: 10, right: 10),
                  decoration: BoxDecoration(
                    color: color.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(
                      width: 1,
                      color: Colors.black12,
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 5),
                          child: Image(
                            image: AssetImage("image/homepage.png"),
                            height: 55,
                            width: 55,
                          )),
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.only(top: 5,left:5,right: 2),
                              child: Text("Shri Digambar Jain Lal Mandir",style: TextStyle(fontFamily: 'semibold',fontSize: 12)),
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.only(left:5,right: 2),
                              child: Text("Date of Booking: 08/11/2022",style: TextStyle(fontFamily: 'regular',fontSize: 12)),
                            ),
                            Container(
                              margin: EdgeInsets.only(left:5,right: 2),
                              child: Row(
                                children: [
                                  Image(image: AssetImage("image/akar-icons_location.png"),width: 17,height: 17),
                                  Text("Delhi",style: TextStyle(fontFamily: 'regular',fontSize: 12),)
                                ],
                              ),
                            ),
                            Spacer(),
                            Container(
                                margin: EdgeInsets.only(left: 200),
                                width: MediaQuery.of(context).size.width/3.8,
                                alignment: Alignment.topRight,
                                decoration:BoxDecoration(
                                  color: color.green,
                                  borderRadius: BorderRadius.only(bottomRight:Radius.circular(10) ,topLeft: Radius.circular(5)),
                                  border: Border.all(
                                    width: 1,
                                    color: color.grey,
                                  ),

                                ) ,
                                child: Text(" Tickets Generated  ",style: TextStyle(color: color.white,fontSize: 10,fontFamily: 'regular'),)
                            ),

                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
