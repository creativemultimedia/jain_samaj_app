import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:jain_samaj_app/api_model/register_api.dart';
import 'package:jain_samaj_app/config/color.dart';

import 'package:jain_samaj_app/config/font_style.dart';

import 'package:jain_samaj_app/pages/home/categories.dart';
import 'package:jain_samaj_app/pages/home/temple_detail_page.dart';
import 'package:jain_samaj_app/pages/login_system/login_page.dart';
import 'package:video_player/video_player.dart';


import '../../api_model/cnm_api.dart';
import '../../api_model/getotp_model.dart';
import '../../api_model/home_page_api.dart';
import '../../api_model/user_details.dart';
import '../../config/comntost.dart';
class home_page extends StatefulWidget {
  const home_page({Key? key}) : super(key: key);

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  int currentIndex = 0;
  user_details_model?user_de;
  List<String> images = [
    "image/Rectangle 3.png",
    "image/Rectangle 3.png",
    "image/Rectangle 3.png",
    "image/Rectangle 3.png",
  ];
  GetStorage box=GetStorage();
  HomepageApi? home;

  Future get_home() async {


    var url = Uri.parse('http://scprojects.in.net/projects/samarpanam/api_/app/homepage/MOB/1');
    var response = await http.get(url,  headers: {
      "Content-Type": "application/x-www-form-urlencoded",
      "Client-Service": "frontend-client-samarpanam",
      "Auth-Key": "simplerestapi_samarpanam",
      "User-ID": "1",
    },
    );

    print(response.body);
    Map<String, dynamic> finalist = await jsonDecode(response.body);
    home = HomepageApi.fromMap(finalist);

    loader.hideLoading();
    if(response.statusCode==200)
    {
      if(home!.status==200)
      {
        get_user_detils();
      }
      else
      {
        loader.showErroDialog(description: home!.message!);
      }
    }else
    {
      loader.hideLoading();
      loader.showErroDialog(description: "Something went wrong");
      print("error");
    }
    return home;
  }
  Future get_user_detils() async {


    var url = Uri.parse('http://scprojects.in.net/projects/samarpanam/api_/user/user_detail/MOB/${box.read("user_id")}');
    var response = await http.get(url,  headers: {
      "Content-Type": "application/x-www-form-urlencoded",
      "Client-Service": "frontend-client-samarpanam",
      "Auth-Key": "simplerestapi_samarpanam",
      "User-ID": "1",
    },
    );

    print(response.body);
    Map<String, dynamic> finalist = await jsonDecode(response.body);
    user_de = user_details_model.fromJson(finalist);

    loader.hideLoading();
    if(response.statusCode==200)
    {
      if(user_de!.status==200)
      {
        print("name=${user_de!.response![0].name!}");
        box.write("user_name", user_de!.response![0].name!);
        box.write("main_id", user_de!.response![0].memberId!);
      }
      else
      {
        loader.showErroDialog(description: user_de!.message!);
      }
    }else
    {
      loader.hideLoading();
      loader.showErroDialog(description: "Something went wrong");
      print("error");
    }
    return user_de;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: color.white,
        title: Column(
          children: [
            Container(
                alignment: Alignment.topLeft,
                child: Text("Welcome ${box.read('user_name')}", style: homepageappbartext)),
            Container(
                alignment: Alignment.topLeft,
                child: Text("Discover more about Jain Samaj App",
                    style: homepageappbar)),
          ],
        ),
        actions: [
          Image(
            image: AssetImage('image/logo.png'),
            height: 65,
            width: 65,
          )
        ],
      ),
      body:
      Container(

        child:
        FutureBuilder(
          future:get_home(),
          builder: (context, snapshot) {

            if(snapshot.hasData)
            {
              return    home!.response!.isNotEmpty ?
              SingleChildScrollView(
                child: Column(children: [
                  Container(
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    margin: EdgeInsets.only(left: 15, right: 15, top: 4),
                    height: MediaQuery.of(context).size.height / 4.3,
                    width: MediaQuery.of(context).size.width / 1,
                    child: PageView.builder(
                      itemCount:  home!.response![0].homeBanner!.length,
                      onPageChanged: (index) {
                        setState(() {
                          currentIndex = index % home!.response![0].homeBanner!.length;
                        });
                      },
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          height: MediaQuery.of(context).size.height / 9,
                          width: MediaQuery.of(context).size.width / 1.4,
                          child: Image.network(home!.response![0].homeBanner![index].img!)
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (var i = 0; i < home!.response![0].homeBanner!.length; i++)
                        buildIndicator(currentIndex == i)
                    ],
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(top: 5,
                    ),
                    color: color.lightpink,
                    child: Container(
                        margin: EdgeInsets.only(left: 15, top: 2),
                        child: Text("Yatra Locations",
                            style: TextStyle(fontFamily: 'semibold', fontSize: 14))),
                  ),
                  Container(
                      color: color.lightpink,
                      height: MediaQuery.of(context).size.height / 3.9,
                      width: MediaQuery.of(context).size.width / 1,
                      padding: EdgeInsets.symmetric(vertical: 4),
                      child: GridView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount:  home!.response![0].yatraLocation!.length,

                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 00,
                            crossAxisSpacing: 0,
                            childAspectRatio: 0.56),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return temple_detail_page();
                              },));
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: 5,left: 10, right: 10),
                              decoration: BoxDecoration(
                                color: color.white,
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                border: Border.all(
                                  width: 1,
                                  color: color.grey,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                      margin: EdgeInsets.only(left: 5),
                                      child: Image(
                                        image: NetworkImage(  home!.response![0].yatraLocation![index].image!),
                                        fit: BoxFit.fill,
                                        height: 80,
                                        width: 50,
                                      )),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(left:5,right: 2),
                                          child: Text(home!.response![0].yatraLocation![0].title!,maxLines: 2,overflow: TextOverflow.ellipsis,style: homepageyatra),

                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left:5,right: 2),
                                          child: Row(
                                            children: [
                                              Image(image: AssetImage("image/akar-icons_location.png"),width: 15,height: 15),
                                              Text(home!.response![0].yatraLocation![0].location!,style: TextStyle(fontFamily: 'semibold',fontSize: 10),)
                                              // Text("nbvmn",style: TextStyle(fontFamily: 'semibold',fontSize: 10),)
                                            ],
                                          ),
                                        ),

                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      )),
                if(home!.response![0].yatraLocationBookingShow=="YES")...
                    {
                      Column(children: [
                        Container(
                          height: MediaQuery.of(context).size.height*0.035,
                          alignment: Alignment.topLeft,
                          color: color.lightgreen,
                          child: Container(
                              margin: EdgeInsets.only(left: 15,top: 0),
                              child: Text("Gyan Bhandar",
                                  style: TextStyle(fontFamily: 'semibold', fontSize: 14))),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height/4.8,
                          decoration: BoxDecoration(
                              color: color.lightgreen,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(10))),
                          child: ListView.separated(
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  height: 0,
                                );
                              },
                             scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return  InkWell(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                                      return Categories();
                                    },));
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(left: 12, top: 2, right: 12),
                                    width: MediaQuery.of(context).size.width / 3,
                                    decoration: BoxDecoration(
                                      color: color.white,
                                      borderRadius: BorderRadius.all(Radius.circular(5)),
                                      border: Border.all(
                                        color: color.white,
                                        width: 1,
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        Image(
                                          image: NetworkImage(home!.response![0].yatraLocationBookingInfo![index].image!),

                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 4),
                                          child: Text(home!.response![0].yatraLocationBookingInfo![index].title!,maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 13,fontFamily: 'regular')),),


                                        Text(home!.response![0].yatraLocationBookingInfo![index].location!,style: TextStyle(fontSize: 13,fontFamily: 'regular'))
                                      ],
                                    ),
                                  ),
                                );
                              },
                              itemCount:
                              home!.response![0].yatraLocationBookingInfo!.length
                          ),
                        ),
                      ],)
                    }
                ]),
              )
                : Container(
            height: 500,
            width: 500,
            child: Image(image: AssetImage(""),fit: BoxFit.cover),);
            }//if conditon
            return Center(

            child: CircularProgressIndicator(),
            );
          },),
      ),
    );
  }

  Widget buildIndicator(bool isSelected) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1),
      child: Container(
        height: isSelected ? 12 : 8,
        width: isSelected ? 12 : 8,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? color.black : color.grey,
        ),
      ),
    );
  }
}




class SplashPage extends StatefulWidget {


  @override
  State<StatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late VideoPlayerController _controller;
  bool _visible = false;

  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    _controller = VideoPlayerController.asset("image/spalsh.mp4");
    _controller.initialize().then((_) {
      _controller.setLooping(true);
      Timer(Duration(milliseconds: 100), () {
        setState(() {
          _controller.play();
          _visible = true;
        });
      });
    });

    Future.delayed(Duration(seconds: 4), () {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return  login_page();
    },));
    });
  }
  @override
  void dispose() {
    super.dispose();
    if (_controller != null) {
      _controller.dispose();
    }
  }

  _getVideoBackground() {
    return AnimatedOpacity(
      opacity: _visible ? 1.0 : 0.0,
      duration: Duration(milliseconds: 10),
      child: VideoPlayer(_controller),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: <Widget>[
            _getVideoBackground(),
          ],
        ),
      ),
    );
  }
}