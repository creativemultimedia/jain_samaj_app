import 'dart:convert';
import 'package:permission_handler/permission_handler.dart' as per;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:jain_samaj_app/config/color.dart';
import 'package:jain_samaj_app/config/comntost.dart';
import 'package:jain_samaj_app/config/font_style.dart';
import 'package:jain_samaj_app/pages/login_system/register.dart';
import 'package:jain_samaj_app/pages/login_system/verification_code_page.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../api_model/bad_responce.dart';
import '../../api_model/getotp_model.dart';
import '../../api_model/login_model.dart';
import '../../config/locatio.dart';
class login_page extends StatefulWidget {
  const login_page({Key? key}) : super(key: key);

  @override
  State<login_page> createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  login_api? login;
  getotp_api? otp_send;
  String? mob = "";
  TextEditingController Mobileno = TextEditingController();
  GetStorage box = GetStorage();

  Future get_login() async {
    loader.showLoading();
    Map map_login = {
      "device_type": "MOB",
      "username": mob,
    };
    var url = Uri.parse(
        'https://scprojects.in.net/projects/samarpanam/api_/login/login_check');
    var response = await http.post(
      url,
      body: map_login,
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        "Client-Service": "frontend-client-samarpanam",
        "Auth-Key": "simplerestapi_samarpanam",
        "User-ID": "1",
      },
      encoding: Encoding.getByName('utf-8'),
    );
    print(" dvklnx $map_login");
    print(response.body);
    Map<String, dynamic> finalist = await jsonDecode(response.body);
    login = login_api.fromJson(finalist);
    setState(() {});
    loader.hideLoading();
    if (response.statusCode == 200) {
      if (login!.status == 200) {
        box.write("user_id", login!.response![0].userId!);
        box.write("user_name", login!.response![0].name!);
        get_otp();
      } else {
        loader.showErroDialog(description: login!.message!);
      }
    } else if (response.statusCode == 400) {
      Map<String, dynamic> finalist = await jsonDecode(response.body);

      badrespondce_model? bad = badrespondce_model.fromJson(finalist);
      setState(() {});
      loader.showErroDialog(description: bad.message!);
    } else {
      loader.hideLoading();
      loader.showErroDialog(description: "Something went wrong");
      print("error");
    }
    return login;
  }

  Future get_otp() async {
    loader.showLoading();
    Map map_login = {
      "device_type": "MOB",
      "mobile": mob,
      "user_id": box.read("user_id"),
    };
    var url = Uri.parse(
        'https://scprojects.in.net/projects/samarpanam/api_/otp/validate/1');
    var response = await http.post(
      url,
      body: map_login,
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        "Client-Service": "frontend-client-samarpanam",
        "Auth-Key": "simplerestapi_samarpanam",
        "User-ID": "1",
      },
      encoding: Encoding.getByName('utf-8'),
    );
    print(" dvklnx $map_login");
    print(response.body);
    Map<String, dynamic> finalist = await jsonDecode(response.body);
    otp_send = getotp_api.fromJson(finalist);
    setState(() {});
    loader.hideLoading();
    if (response.statusCode == 200) {
      if (otp_send!.status == 200) {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return verification_code_page("login", mob);
          },
        ));
      } else {
        loader.showErroDialog(description: otp_send!.message!);
      }
    } else {
      loader.hideLoading();
      loader.showErroDialog(description: "Something went wrong");
      print("error");
    }
    return otp_send;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 6,
              ),
              alignment: Alignment.topCenter,
              child: Image(
                image: AssetImage('image/logo.png'),
                height: MediaQuery.of(context).size.height / 3,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 40, left: 20),
              alignment: Alignment.topLeft,
              child: Text("Enter your Mobile Number", style: entermobile),
            ),
            Container(
              margin: EdgeInsets.only(right: 20, left: 20, top: 10),
              child: Material(
                borderRadius: BorderRadius.all(
                  Radius.circular(15.0),
                ),
                elevation: 5.0,
                shadowColor: Colors.grey,
                child: TextField(
                  cursorColor: color.grey,
                  controller: Mobileno,
                  decoration: new InputDecoration(
                    hintText: "Enter your Mobile Number",
                    border: new OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                        borderSide: new BorderSide(color: color.grey)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                      borderSide: BorderSide(color: color.grey),
                    ),
                  ),
                ),
              )
            ),
            Container(
              margin: EdgeInsets.only(top: 40),
              width: MediaQuery.of(context).size.width / 2.7,
              height: MediaQuery.of(context).size.height / 18.5,
              child: ElevatedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: color.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () async {
                    setState(()  {
                      mob = Mobileno.text;

                    });
                    if (mob!.isEmpty) {
                      Fluttertoast.showToast(
                        msg: "Please Enter your mobile no",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                      );
                    } else {
                      await _initLocationService();
                      // get_login();
                    }
                  },
                  child: Text(
                    "Log in",
                    style: loginbutton,
                  )),
            ),
            Container(
                margin: EdgeInsets.only(top: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Dont't have an account?", style: donthaveanaccount),
                    InkWell(
                        onTap: () async {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return register();
                            },
                          ));
                        },
                        child: Text(
                          " Register",
                          style: registerfont,
                        ))
                  ],
                ))
          ],
        ),
      ),
    );
  }
  Future _initLocationService() async {
    var location = Location();

    if (!await location.serviceEnabled()) {
      if (!await location.requestService()) {
        return;
      }
    }

    var permission = await location.hasPermission();
    if (permission != per.PermissionStatus.granted) {
        get_login();
    }
    // if (permission == per.PermissionStatus.denied) {
    //   // permission = await location.requestPermission();
    //   if (permission != per.PermissionStatus.granted) {
    //
    //   }
    // }
    // else
    // {
    //   Fluttertoast.showToast(
    //     msg: "Please Location On",
    //     toastLength: Toast.LENGTH_SHORT,
    //     gravity: ToastGravity.CENTER,
    //   );
    // }

    // var loc = await location.getLocation();
    // print("hello${loc.latitude} ${loc.longitude}");
  }
}
