import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jain_samaj_app/config/color.dart';
import 'package:jain_samaj_app/config/comntost.dart';
import 'package:jain_samaj_app/config/font_style.dart';
import 'package:jain_samaj_app/pages/login_system/details_page.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:http/http.dart' as http;

import '../../api_model/bad_responce.dart';
import '../../api_model/getotp_model.dart';
import '../../api_model/otp_verfy_model.dart';
import '../../main(.dart';

class verification_code_page extends StatefulWidget {

  String?type;
  String?mobile;


  verification_code_page(this.type, this.mobile);

  @override
  State<verification_code_page> createState() => _verification_code_pageState();
}

class _verification_code_pageState extends State<verification_code_page> {
  OtpFieldController OTP = OtpFieldController();
  String otp = "";
  GetStorage box = GetStorage();
  badrespondce_model?bad;
  otp_verify_model?otp_verfy;
  var re = RegExp(r'\d(?!\d{0,2}$)'); // keep last 3 digits
  // print('123456789'.replaceAll(re, '-')); // ------789

  getotp_api?otp_send;

  Future get_resend_otp() async {
    loader.showLoading();
    Map map_login = {
      "device_type":"MOB",
      "mobile":widget.mobile,
      "user_id":box.read("user_id"),
    };
    var url = Uri.parse('https://scprojects.in.net/projects/samarpanam/api_/otp/validate/1');
    var response = await http.post(url, body: map_login, headers: {
      "Content-Type": "application/x-www-form-urlencoded",
      "Client-Service": "frontend-client-samarpanam",
      "Auth-Key": "simplerestapi_samarpanam",
      "User-ID": "1",
    },encoding: Encoding.getByName('utf-8'),
    );
    print(" dvklnx $map_login");
    print(response.body);
    Map<String, dynamic> finalist = await jsonDecode(response.body);
    otp_send = getotp_api.fromJson(finalist);
    setState(() {});
    loader.hideLoading();
    if(response.statusCode==200)
    {
      if(otp_send!.status==200)
      {

Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
  return verification_code_page("login",widget.mobile) ;
},), (route) => false);
      }
      else
      {
        loader.showErroDialog(description: otp_send!.message!);
      }
    }else
    {
      loader.hideLoading();
      loader.showErroDialog(description: "Something went wrong");
      print("error");
    }
    return otp_send;
  }
  Future get_otp() async {
    loader.showLoading();
    Map map_login = {
      "device_type": "MOB",
      "mobile": widget.mobile,
      "user_id": box.read("user_id"),
      "otp": otp,
    };
    var url = Uri.parse(
        'https://scprojects.in.net/projects/samarpanam/api_/otp/validate/0');
    var response = await http.post(url, body: map_login, headers: {
      "Content-Type": "application/x-www-form-urlencoded",
      "Client-Service": "frontend-client-samarpanam",
      "Auth-Key": "simplerestapi_samarpanam",
      "User-ID": "1",
    }, encoding: Encoding.getByName('utf-8'),
    );
    print(" dvklnx $map_login");
    print(response.body);
    Map<String, dynamic> finalist = await jsonDecode(response.body);
    otp_verfy = otp_verify_model.fromJson(finalist);
    setState(() {

    });

    loader.hideLoading();
    if (response.statusCode == 200) {
      if (otp_verfy!.status == 200) {
        if(widget.type=="register")
          {
            setState(() {
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
                return detalisforragistration();
              },), (route) => false);
            });
          }
        else
          {
            setState(() {
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
                return main_pages(0);
              },), (route) => false);
            });
          }


      }

      else {
        loader.showErroDialog(description: otp_verfy!.message!);
      }
    }
    else if (response.statusCode == 400) {
      Map<String, dynamic> finalist = await jsonDecode(response.body);
      bad = badrespondce_model.fromJson(finalist);
      setState(() {});
      loader.showErroDialog(description: bad!.message!);
    }

    else {
      loader.hideLoading();
      loader.showErroDialog(description: "Something went wrong");
      print("error");
    }
    return otp_verfy;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(
        backgroundColor: color.blue,
        title: Container(
            margin: EdgeInsets.only(left: 50),
            child: Text("verification Code", style: appbartext)),
      ),
      body: SingleChildScrollView(child:
      Column(
        children: [
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 70),
            child: Text("We have sent the verification code to the",
                style: verifivationtext),
          ),
          Container(
            alignment: Alignment.center,
            child: Text("registered mobile number", style: verifivationtext),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Text( widget.mobile!.replaceAll(re, '*'), style: verifivationtext),
              ),

              Container(
                child: Icon(Icons.edit, color: color.grey, size: 15,),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: OTPTextField(
              controller: OTP,
              length: 4,
              width: MediaQuery.of(context).size.width,
              fieldWidth: 50,
              style: TextStyle(
                  fontSize: 17
              ),
              textFieldAlignment: MainAxisAlignment.spaceEvenly,
              fieldStyle: FieldStyle.box,
              onCompleted: (pin) {
                otp=pin;
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 40),
            width:MediaQuery.of(context).size.width/2.7,
            height: MediaQuery.of(context).size.height/18.5,
            child: ElevatedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: color.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  setState(() {

                    if(otp.isEmpty)
                      {
                        Fluttertoast.showToast(
                          msg: "Please Enter your Otp",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                        );
                      }
                    else
                      {
get_otp();
                      }
                  });

                }, child: Text("Submit",style: loginbutton,)),
          ),
          Container(
            margin: EdgeInsets.only(top: 25),
            child: InkWell(
                onTap: () {
                  get_resend_otp();
                },
                child: Text("Resend OTP",style: resendotp,)),
          ),


        ],
      )
      ),
    );
  }
}
