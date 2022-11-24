import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:geocoding/geocoding.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jain_samaj_app/config/comntost.dart';
import 'package:jain_samaj_app/pages/login_system/login_page.dart';
import 'package:jain_samaj_app/pages/navigator.dart';
import 'package:permission_handler/permission_handler.dart' as per;

import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';
import 'package:location/location.dart';
import 'package:geolocator/geolocator.dart';
import 'config/locatio.dart';
import 'main(.dart';

void main(){

  WidgetsFlutterBinding.ensureInitialized();

  runApp( MyApp(),);
}

class MyApp extends StatefulWidget {
  static String? provider_id;
  static String? Member_name;
  static String? member_id;
  static String? Country;
  static SharedPreferences? sharedPreferences;
  static  double let=0.0;
  static double long=0.0;
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  GetStorage box =GetStorage();
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  Widget build(BuildContext context) {


    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        scrollBehavior:MyBehavior() ,
        home :Splash_Screen()
    );
  }
}
class Splash_Screen extends StatefulWidget {
  const Splash_Screen({Key? key}) : super(key: key);

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  late VideoPlayerController _controller;
  bool _visible = false;
  void initState() {
    super.initState();
    video();
    // getCurrentLocation();
  }
  Future _initLocationService() async {
    var location = Location();

    if (!await location.serviceEnabled()) {
      if (!await location.requestService()) {
        return;
      }
    }

    var permission = await location.hasPermission();
    if (permission == PermissionStatus.denied) {
      // permission = await location.requestPermission();
      if (permission != PermissionStatus.granted) {
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) {
            return login_page();
          },
        ));
      }
    }
    else
    {
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return login_page();
        },
      ));
    }

    // var loc = await location.getLocation();
    // print("hello${loc.latitude} ${loc.longitude}");
  }
  // Future<void> getCurrentLocation() async {
  //
  //
  //   Position position = await Geolocator.getCurrentPosition(
  //       desiredAccuracy:LocationAccuracy.high);
  //   double lat = position.latitude;
  //   double long = position.longitude;
  //
  //   Engstring.latitude = lat ?? 0.0;
  //   Engstring.longitude= long ?? 0.0;
  //   print("Latitude: $lat and Longitude: $long");
  //   print("Latitude112: ${ Engstring.latitude} and Longitude: ${ Engstring.longitude}");
  // }
  video()
  {
    _controller = VideoPlayerController.asset("image/spalsh.mp4");
    _controller.initialize().then((_) {
      _controller.setLooping(true);
      Timer(Duration(milliseconds: 100), () {
        setState(() {
          _controller.play();
          _visible = true;
          loaddata();
        });
      });

    });
  }
  _getVideoBackground() {
    return AnimatedOpacity(
      opacity: _visible ? 1.0 : 0.0,
      duration: Duration(seconds: 4),
      child: VideoPlayer(_controller),
    );
  }

  GetStorage box =GetStorage();
  @override
  void dispose() {
    super.dispose();

    _controller.dispose();
  }
  per.PermissionStatus? _status;
  void _updateStatus(per.PermissionStatus status) {
    if (status != _status) {
      setState(() {
        _status = status;
      });
    }
  }

  Future<void> _askPermission() async {
    await [per.Permission.location].request().then(_onStatusRequested);
  }

  void _onStatusRequested(Map<per.Permission, per.PermissionStatus> statuses) {
    final status = statuses[per.Permission.location];
    //if (status != PermissionStatus.granted) {
    //PermissionHandler().openAppSettings();
    //} else { //Ignore this, this isn't important.
    _updateStatus(status!);
  }
  loaddata() async {
    SharedPreferences.getInstance().then((value) {
      // location_permission().parmission();
      MyApp.provider_id =box.read('user_id') ;
      MyApp.Member_name =box.read('user_name') ;
      MyApp.member_id =box.read('main_id') ;
      print("vdsvsdv${box.read('user_id')}");
      MyApp.sharedPreferences = value;
    });
    await Future.delayed(Duration(seconds: 5));
    if (box.read('user_id') == null) {
      await _askPermission();
      await _initLocationService();

    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return main_pages(0);
        },
      ));
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SizedBox.expand(
        child: FittedBox(
          alignment: Alignment.center,
          fit: BoxFit.cover,
          child: SizedBox(
            width: _controller.value.size.width ?? 0,
            height: _controller.value.size.height ?? 0,
            child:

            Center(child: VideoPlayer(_controller)),
          ),
        ),
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

