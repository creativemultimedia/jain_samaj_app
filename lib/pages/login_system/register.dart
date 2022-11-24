import 'dart:convert';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:get/get.dart';
import 'package:jain_samaj_app/config/locatio.dart';
import 'package:location/location.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jain_samaj_app/api_model/register_api.dart';
import 'package:jain_samaj_app/config/color.dart';
import 'package:jain_samaj_app/config/font_style.dart';
import 'package:jain_samaj_app/pages/login_system/verification_code_page.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';
import '../../api_model/bad_responce.dart';
import '../../api_model/cnm_api.dart';
import '../../api_model/getotp_model.dart';
import '../../config/comntost.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart' as GEOC;
import '../../main.dart';

class register extends StatefulWidget {


  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {

  // List of items in our dropdown menu

  TextEditingController Full_name=TextEditingController();
  TextEditingController Mobileno=TextEditingController();
  TextEditingController Email=TextEditingController();
  TextEditingController Gender=TextEditingController();
  TextEditingController pass=TextEditingController();
  TextEditingController Cnf_pass=TextEditingController();
  bool securepasword = true;
  bool securepasword_cnf = true;

  String? f_name ="";
  String? mob ="";
  String? mail ="";
  String? gen ="";
  String? passwrod ="";
  String? confirm_pass="";
  register_model?register;
  getotp_api?otp_send;

  GetStorage box =GetStorage();
  String country = '';
  String name = '';
  String street = '';
  String postalCode = '';
  Future<void> getLocation() async {
    Location location = Location();
    LocationData _locationData = await location.getLocation();
    //
    //   print("lati =${_locationData.latitude}");
    //   print("longoi=${_locationData.longitude}");
      Engstring.latitude = _locationData.latitude ?? 0.0;
      Engstring.longitude = _locationData.longitude ?? 0.0;
      Engstring.locationpermission = true;
    List<GEOC.Placemark> placemark = await GEOC.placemarkFromCoordinates(Engstring.latitude, Engstring.longitude);
    print("country=${placemark[0].country}");
    print(placemark[0].name);
    print(placemark[0].street);
    print(placemark[0].postalCode);

    setState(() {
      country = placemark[0].country!;
      name = placemark[0].name!;
      street = placemark[0].street!;
      postalCode = placemark[0].postalCode!;
    });
    MyApp.Country=country;
  }
  Future get() async {
    loader.showLoading();
    Map map_login = {
      "device_type":"MOB",
      "name":f_name,
      "email":mail,
      "country_code":"",
      "country":"India",
      "mobile":mob,
      "state":"Gujrat",
      "gender":gen,

    };
    var url = Uri.parse('http://scprojects.in.net/projects/samarpanam/api_/user/create');
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
    register = register_model.fromJson(finalist);
    setState(() {});
    //9915504088
    loader.hideLoading();
   if(response.statusCode==200)
     {
       if(register!.status==200)
       {
         box.write("user_id", register!.response![0].userId!);

         print("ndvndv${box.read("user_id")}");
         get_otp();
       }
       else
       {
         loader.showErroDialog(description: register!.message!);
       }
     }
   else if(response.statusCode==400)
   {
     Map<String, dynamic> finalist = await jsonDecode(response.body);

     badrespondce_model?bad = badrespondce_model.fromJson(finalist);
     setState(() {});
     loader.showErroDialog(description: bad.message!);
   }
   else
       {
         loader.hideLoading();
         loader.showErroDialog(description: "Something went wrong");
         print("error");
       }
    return register;
  }


  Future get_otp() async {
    loader.showLoading();
    Map map_login = {
      "device_type":"MOB",
      "mobile":mob,
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
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return verification_code_page("register",mob) ;
        },));
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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.white,
       body: SingleChildScrollView(
         child: Column(
           children: [
             Container(
               margin: EdgeInsets.only(top: 40),
               alignment: Alignment.topCenter,
               child: Image(image: AssetImage('image/logo.png'),height: MediaQuery.of(context).size.height/3,),
             ),
             Container(
               alignment: Alignment.topLeft,
               margin: EdgeInsets.only(left: 20,top: 20),
               child: Text("Register",style: registername),
             ),
             Container(
               margin: EdgeInsets.only(top: 20,left: 15,right: 15),
               child: Material(
                 borderRadius: BorderRadius.all(
                   Radius.circular(15.0),
                 ),
                 elevation: 5.0,
                 shadowColor: Colors.grey,
                 child: TextField(
                   controller: Full_name,
                   cursorColor: color.grey,
                   decoration: new InputDecoration(
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
                     hintText: 'Full Name*',
                     hintStyle:hinttext,
                   ),
                 ),
               ),
             ),
            if(MyApp.Country=="India")...
            {
              Container(
                height: MediaQuery.of(context).size.height/10.5,
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width/4.7,
                      margin: EdgeInsets.only(top: 20,left: 15,right: 10),
                      child: Material(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                        elevation: 5.0,
                        shadowColor: Colors.grey,
                        child: TextField(
                          cursorColor: color.grey,
                          readOnly: true,
                          decoration: new InputDecoration(
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
                            hintText: '+91',
                            hintStyle:hinttext,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width/1.5 ,
                      margin: EdgeInsets.only(top: 20,right: 15),
                      child:Material(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                        elevation: 5.0,
                        shadowColor: Colors.grey,
                        child:  TextField(
                          controller: Mobileno,
                          cursorColor: color.grey,
                          decoration: new InputDecoration(
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
                            hintText: 'Mobile Number*',
                            hintStyle:hinttext,
                          ),
                        ),
                      )
                    ),

                  ],
                ),
              ),
            },
             if(MyApp.Country!="India")...
               {
                 Container(
                   margin: EdgeInsets.only(top: 20,left: 15,right: 15),
                   child: Material(
                     borderRadius: BorderRadius.all(
                       Radius.circular(15.0),
                     ),
                     elevation: 5.0,
                     shadowColor: Colors.grey,
                     child: TextField(
                       controller: Email,
                       cursorColor: color.grey,
                       decoration: new InputDecoration(
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
                         hintText: 'Email',
                         hintStyle:hinttext,
                       ),
                     ),
                   )
                 ),
               },
             Container(
               margin: EdgeInsets.only(top: 20,left: 15,right: 15),
               child:Material(
                 borderRadius: BorderRadius.all(
                   Radius.circular(15.0),
                 ),
                 elevation: 5.0,
                 shadowColor: Colors.grey,
                 child: DropdownButtonFormField2(
                   buttonHeight: 55,
                   decoration: InputDecoration(
                     isDense: true,
                     contentPadding: EdgeInsets.zero,
                     focusedBorder: OutlineInputBorder(
                       borderRadius: BorderRadius.all(
                         Radius.circular(15.0),
                       ),
                       borderSide: BorderSide(color: color.grey),
                     ),
                     border: OutlineInputBorder(
                       borderSide: BorderSide(color: Colors.grey),
                       borderRadius: BorderRadius.circular(15),
                     ),),
                   dropdownDecoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(15),
                   ),
                   hint: gen!.isEmpty
                       ? Text('Gender')
                       : Text(gen!,
                     style: hinttext,
                   ),
                   isExpanded: true,
                   iconSize: 30.0,
                   style:hinttext,
                   items: ['Male', 'Female', ].map(
                         (val) {
                       return DropdownMenuItem<String>(
                         value: val,
                         child: Text(val),
                       );
                     },
                   ).toList(),
                   onChanged: (String? newValue) {
                     setState(
                           () {

                         gen=newValue!;

                       },
                     );
                   },
                 ),
               )

             ),
             Container(
               margin: EdgeInsets.only(top: 20),
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
                     f_name=Full_name.text;
                     mob=Mobileno.text;
                     mail=Email.text;




                      if(
                      f_name!.isEmpty ||
                          gen!.isEmpty
                      )
                        {
                          Fluttertoast.showToast(
                              msg: "Please Enter your details",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                          );

                        }
                      else if(  f_name!.isEmpty ) {
                          Fluttertoast.showToast(
                            msg: "Please Enter your details",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                          );
                        }
                       if(MyApp.Country=="India")
                      {
                        if(mob!.isEmpty)
                          {
                            Fluttertoast.showToast(
                              msg: "Please Enter mobile",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                            );
                          }
                      }
                       if(MyApp.Country!="India")
                        {
                         if(mail!.isEmpty)
                           {
                             Fluttertoast.showToast(
                               msg: "Please Enter Email",
                               toastLength: Toast.LENGTH_SHORT,
                               gravity: ToastGravity.CENTER,
                             );
                           }
                        }
                      else if(  gen!.isEmpty ) {
                        Fluttertoast.showToast(
                          msg: "Please Enter your Gender",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                        );
                      }

                      else
                        {
                          // get_register_api();
                          get();
                        }
                    });
                   }, child: Text("Sign Up",style: loginbutton,)),
             ),
             Container(
                 margin: EdgeInsets.only(top: 25),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text("Already a member?",style: donthaveanaccount),
                     InkWell(
                         onTap: () {


                         },
                         child: Text(" Sign In",style: registerfont,))
                   ],
                 )
             ),
           ],
         ),
       ),
    );
  }
}













