import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jain_samaj_app/config/color.dart';
import 'package:jain_samaj_app/config/comntost.dart';
import 'package:jain_samaj_app/config/font_style.dart';
import 'package:jain_samaj_app/pages/navigator.dart';
import 'package:http/http.dart' as http;

import '../../api_model/Educatiion_api.dart';
import '../../api_model/bad_responce.dart';
import '../../api_model/blood_group_model.dart';
import '../../api_model/details_register_modle.dart';
import '../../api_model/family_model.dart';
import '../../api_model/gaccha_model.dart';
import '../../main(.dart';
const double borderRadius = 25.0;
class detalisforragistration extends StatefulWidget {

  @override
  State<detalisforragistration> createState() => _detalisforragistrationState();
}

class _detalisforragistrationState extends State<detalisforragistration>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;

  PageController get pageController => _pageController;


  String blood="";
  String education="";
  String gacchh="";
  String blood_id="";
  String education_id="";
  String gacchh_id="";


  set pageController(PageController pageController) {
    _pageController = pageController;
  }
  int activePageIndex = 0;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    get_jain_edu();
    get_gacchha();
  }
  bool chek=false;
  DateTime selectedate =DateTime.now();
  String? selecteddates;
  String? fem_selecteddates;
  String? my_blood;
  String? my_edu;
  String? my_gachh;
  bloodgroup_api?b_group;
  jain_education_api?edu_jain;
  details_register__model?detail_register;
  gaccgha__model?gacch;

  Future get_bloodgroup() async {
    var url = Uri.parse('http://scprojects.in.net/projects/samarpanam/api_/app/blood_group/MOB');
    var response = await http.get(url, headers: {
      "Content-Type": "application/x-www-form-urlencoded",
      "Client-Service": "frontend-client-samarpanam",
      "Auth-Key": "simplerestapi_samarpanam",
      "User-ID": "1",
    }
    );
    print(response.body);

    loader.hideLoading();
    if(response.statusCode==200)
    {

      Map<String, dynamic> finalist = await jsonDecode(response.body);
      b_group = bloodgroup_api.fromJson(finalist);

      if(b_group!.status==200)
      {

      }
      else
      {
        loader.showErroDialog(description: b_group!.message!);
      }
    }
    else if(response.statusCode==400)
    {
      Map<String, dynamic> finalist = await jsonDecode(response.body);

      badrespondce_model?bad = badrespondce_model.fromJson(finalist);
      loader.showErroDialog(description: bad.message!);
    }
    else
    {
      loader.hideLoading();
      loader.showErroDialog(description: "Something went wrong");
      print("error");
    }
    Future.delayed(Duration(seconds: 3));
    return b_group;
  }

  Future get_jain_edu() async {
    var url = Uri.parse('http://scprojects.in.net/projects/samarpanam/api_/app/jain_education/MOB');
    var response = await http.get(url, headers: {
      "Content-Type": "application/x-www-form-urlencoded",
      "Client-Service": "frontend-client-samarpanam",
      "Auth-Key": "simplerestapi_samarpanam",
      "User-ID": "1",
    }
    );

    loader.hideLoading();
    if(response.statusCode==200)
    { print(response.body);
    Map<String, dynamic> finalist = await jsonDecode(response.body);
    edu_jain = jain_education_api.fromJson(finalist);
      if(edu_jain!.status==200)
      {

      }
      else
      {
        loader.showErroDialog(description: edu_jain!.message!);
      }
    }
    else if(response.statusCode==400)
    {
      Map<String, dynamic> finalist = await jsonDecode(response.body);

      badrespondce_model?bad = badrespondce_model.fromJson(finalist);

      loader.showErroDialog(description: bad.message!);
    }
    else
    {
      loader.hideLoading();
      loader.showErroDialog(description: "Something went wrong");
      print("error");
    }
    return edu_jain;
  }
  Future get_gacchha() async {
    var url = Uri.parse('http://scprojects.in.net/projects/samarpanam/api_/app/gacch/MOB/1');
    var response = await http.get(url, headers: {
      "Content-Type": "application/x-www-form-urlencoded",
      "Client-Service": "frontend-client-samarpanam",
      "Auth-Key": "simplerestapi_samarpanam",
      "User-ID": "1",
    }
    );

    loader.hideLoading();
    if(response.statusCode==200)
    { print(response.body);
    Map<String, dynamic> finalist = await jsonDecode(response.body);
    gacch = gaccgha__model.fromJson(finalist);
      if(gacch!.status==200)
      {

      }
      else
      {
        loader.showErroDialog(description: gacch!.message!);
      }
    }
    else if(response.statusCode==400)
    {
      Map<String, dynamic> finalist = await jsonDecode(response.body);

      badrespondce_model?bad = badrespondce_model.fromJson(finalist);

      loader.showErroDialog(description: bad.message!);
    }
    else
    {
      loader.hideLoading();
      loader.showErroDialog(description: "Something went wrong");
      print("error");
    }
    return gacch;
  }
  TextEditingController B_tithi=TextEditingController();
  TextEditingController n_place=TextEditingController();
  TextEditingController educati=TextEditingController();
  TextEditingController p_businnes=TextEditingController();
  String b_tithi="";
  String native="";
  String educations="";
  String prof="";
  GetStorage box =GetStorage();

  TextEditingController family_name=TextEditingController();
  TextEditingController family_ralation=TextEditingController();
  TextEditingController family_tithi=TextEditingController();
  TextEditingController family_mobile=TextEditingController();
  String fam_nme ="";
  String fam_rela ="";
  String fem_gen="";
  String? fem_DOB;
  String fem_tithi="";
  String fem_group="";
  String fem_mob="";
  String fem_blood_id="";
  List<FamilyModel>? family_details =[
    FamilyModel(birthTithi: 'ecu',bloodGroup: 'wdiqj',dob: 'acbyuc',email: 'aucb',gender: 'ashh',mobile: "ljknx",name: "axa",relation: "knckl"),
  ];
  Future get_detilse_register() async {
    loader.showLoading();
    Map map_login = {
      "device_type":"MOB",
      "user_id":box.read("user_id"),
      "dob":FormatedDate(selecteddates),
      "gacch":gacchh_id,
      "birth_tithi":b_tithi,
      "blood_group":blood_id,
      "jain_education":education_id,
      "native_place":native,
      "education":educations,
      "business":prof,
      "family_detail":familyModelToJson(family_details!),
    };
    var url = Uri.parse('http://scprojects.in.net/projects/samarpanam/api_/user/update_other_info');
    var response = await http.post(url, body: map_login, headers: {
      "Content-Type": "application/x-www-form-urlencoded",
      "Client-Service": "frontend-client-samarpanam",
      "Auth-Key": "simplerestapi_samarpanam",
      "User-ID": "1",
    },encoding: Encoding.getByName('utf-8'),);
    print(" dvklnx $map_login");
    print(response.body);
    loader.hideLoading();
    if(response.statusCode==200)
    {   Map<String, dynamic> finalist = await jsonDecode(response.body);
    detail_register = details_register__model.fromJson(finalist);
    setState(() {});
      if(detail_register!.status==200)
      {
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
          return main_pages(0);
        },), (route) => false);
      }
      else
      {
        loader.showErroDialog(description: detail_register!.message!);
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


    return detail_register;
  }

  DateTime selectedDate = DateTime.now();
  DateTime fem_selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1700, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
      selecteddates=selectedDate.toString();

    }
  }
  Future<void> fem_selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: fem_selectedDate,
        firstDate: DateTime(1700, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != fem_selectedDate) {
      setState(() {
        fem_selectedDate = picked;
      });
      fem_selecteddates=fem_selectedDate.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color.blue,
        title: Container(
            margin: EdgeInsets.only(left: 50),
            child: Text("Details for registration", style: appbartext)),
      ),
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child:
            FutureBuilder(
              future:get_bloodgroup() ,
              builder: (context, snapshot) {

                if(snapshot.hasData)
                {
                  return
                    Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Padding(
                          padding:  EdgeInsets.only(top: 0),
                          child: _menuBar(context),
                        ),
                        Expanded(
                          flex: 2,
                          child: PageView(
                            controller: _pageController,
                            physics: NeverScrollableScrollPhysics(),
                            onPageChanged: (int i) {
                              FocusScope.of(context).requestFocus(FocusNode());
                              setState(() {
                                activePageIndex = i;
                              });
                            },
                            children: <Widget>[
                              ConstrainedBox(
                                  constraints: const BoxConstraints.expand(),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [

                                        Container(
                                          margin: EdgeInsets.only(top: 20,left: 15,right: 15),
                                          child:
                                          TextField(
                                            cursorColor: color.grey,
                                            readOnly: true,
                                            decoration: InputDecoration(
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
                                              hintText: selecteddates==null?'Date of Birth*':FormatedDate(selecteddates),
                                              suffixIcon:
                                              GestureDetector(
                                                  onTap: () => _selectDate(context),
                                                  child: Icon(Icons.calendar_month_outlined,size: 26,)),
                                              hintStyle:hinttext,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 20,left: 15,right: 15),
                                          child: TextField(
                                            controller: B_tithi,
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
                                              hintText: 'Birth Tithi*',
                                              hintStyle:hinttext,
                                            ),
                                          ),
                                        ),
                                        Container(
                                            height: MediaQuery.of(context).size.height*0.07,
                                            margin: EdgeInsets.only(top: 20,left: 15,right: 15),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: color.grey
                                                ),
                                                borderRadius: BorderRadius.all(Radius.circular(15.0))
                                            ),
                                            child:
                                            Padding(
                                              padding:  EdgeInsets.symmetric(horizontal: 6),
                                              child: DropdownButton(
                                                elevation: 0,
                                                underline: SizedBox.shrink() ,
                                                hint: blood.isEmpty
                                                    ? Text('Blood Group')
                                                    : Text(blood,
                                                  style: hinttext,
                                                ),
                                                value: my_blood,
                                                isExpanded: true,
                                                iconSize: 30.0,
                                                style:hinttext,
                                                items: b_group!.response!.map((item) {
                                                  return  DropdownMenuItem(
                                                    onTap: () {
                                                 blood_id=item.bloodGroupId!;
                                                    },
                                                    child:  Text(item.name!),
                                                    value: item.name!.toString(),
                                                  );
                                                }).toList() ,

                                                onChanged: (newValue) {
                                                  setState(() {
                                                    my_blood = newValue!;
                                                    print(my_blood);
                                                    print("sdfbnf${blood}");
                                                  });
                                                },
                                              ),
                                            )
                                        ),
                                        Container(
                                            height: MediaQuery.of(context).size.height*0.07,
                                            margin: EdgeInsets.only(top: 20,left: 15,right: 15),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: color.grey
                                                ),
                                                borderRadius: BorderRadius.all(Radius.circular(15.0))
                                            ),
                                            child:
                                            Padding(
                                              padding:  EdgeInsets.symmetric(horizontal: 6),
                                              child: DropdownButton(
                                                elevation: 0,
                                                underline: SizedBox.shrink() ,
                                                hint: gacchh.isEmpty
                                                    ? Text('Gachch')
                                                    : Text(gacchh,
                                                  style: hinttext,
                                                ),
                                                value: my_gachh,
                                                isExpanded: true,
                                                iconSize: 30.0,
                                                style:hinttext,
                                                items: gacch!.response!.map((item) {
                                                  return new DropdownMenuItem(
                                                    onTap: () {
                                                      gacchh_id=item.gacchId!;
                                                    },
                                                    child: new Text(item.name!),
                                                    value: item.name!.toString(),
                                                  );
                                                }).toList() ,
                                                onChanged: (String? newValue) {
                                                  setState(() {
                                                    my_gachh = newValue!;
                                                    
                                                    print(my_gachh);
                                                  });
                                                },
                                              ),
                                            )

                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 20,left: 15,right: 15),
                                          child: TextField(
                                            controller: n_place,
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
                                              hintText: 'Native Place*',
                                              hintStyle:hinttext,
                                            ),
                                          ),
                                        ),
                                        Container(
                                            height: MediaQuery.of(context).size.height*0.07,
                                            margin: EdgeInsets.only(top: 20,left: 15,right: 15),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: color.grey
                                                ),
                                                borderRadius: BorderRadius.all(Radius.circular(15.0))
                                            ),
                                            child:
                                            Padding(
                                              padding:  EdgeInsets.symmetric(horizontal: 6),
                                              child: DropdownButton(
                                                elevation: 0,
                                                underline: SizedBox.shrink() ,
                                                hint: education.isEmpty
                                                    ? Text('jain Eduction')
                                                    : Text(education,
                                                  style: hinttext,
                                                ),
                                                value: my_edu,
                                                isExpanded: true,
                                                iconSize: 30.0,
                                                style:hinttext,
                                                items: edu_jain!.response!.map((item) {
                                                  return new DropdownMenuItem(
                                                    onTap: () {
                                                      education_id=item.jainEducationId!;
                                                    },
                                                    child: new Text(item.name!),
                                                    value: item.name!.toString(),
                                                  );
                                                }).toList() ,
                                                onChanged: (String? newValue) {
                                                  setState(() {
                                                    my_edu = newValue!;
                                                    print(my_edu);
                                                  });
                                                },
                                              ),
                                            )

                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 20,left: 15,right: 15),
                                          child: TextField(
                                            cursorColor: color.grey,
                                            controller: educati,
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
                                              hintText: 'Education',
                                              hintStyle:hinttext,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 20,left: 15,right: 15),
                                          child: TextField(
                                            controller: p_businnes,
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
                                              hintText: 'Profession / Business',
                                              hintStyle:hinttext,
                                            ),
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
                                                prof=p_businnes.text;
                                                b_tithi=B_tithi.text;
                                                native=n_place.text;
                                                educations=educati.text;

                                               setState(() {


                                                 if(
                                                 prof.isEmpty||
                                                     b_tithi.isEmpty||
                                                     educations.isEmpty||
                                                     selecteddates==null||
                                                     my_blood!.isEmpty||
                                                     my_gachh!.isEmpty||
                                                     my_edu!.isEmpty||
                                                     native.isEmpty
                                                 )
                                                 {
                                                   Fluttertoast.showToast(
                                                     msg: "Please Enter your all details",
                                                     toastLength: Toast.LENGTH_SHORT,

                                                   );
                                                 }
                                                 else
                                                 {
                                                   _onBuyNowButtonPress();
                                                 }

                                               });
                                              }, child: Text("Next",style: loginbutton,)),
                                        ),
                                      ],
                                    ),
                                  )
                              ),
                              ConstrainedBox(
                                constraints: const BoxConstraints.expand(),
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Container(
                                        alignment: Alignment.topLeft,
                                        margin: EdgeInsets.only(top: 10,left: 20),
                                        child: Text("Family Details",style: resendotp),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 20,left: 15,right: 15),
                                        child: TextField(
                                          controller: family_name,
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
                                            hintText: 'Family Member Name',
                                            hintStyle:hinttext,
                                          ),
                                        ),
                                      ),
                                      Container(
                                          margin: EdgeInsets.only(top: 20,left: 15,right: 15),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: color.grey
                                              ),
                                              borderRadius: BorderRadius.all(Radius.circular(15.0))
                                          ),
                                          child:
                                          Padding(
                                            padding:  EdgeInsets.symmetric(horizontal: 6),
                                            child: DropdownButton(    underline: SizedBox.shrink() ,
                                              hint: fem_gen.isEmpty
                                                  ? Text('Gender')
                                                  : Text(fem_gen,
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

                                                        fem_gen=newValue!;

                                                  },
                                                );
                                              },
                                            ),
                                          )

                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 20,left: 15,right: 15),
                                        child: TextField(
                                          cursorColor: color.grey,
                                          controller: family_ralation,
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
                                            hintText: 'Relation',
                                            hintStyle:hinttext,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 20,left: 15,right: 15),
                                        child:

                                        TextField(
                                          cursorColor: color.grey,
                                          readOnly: true,

                                          decoration: InputDecoration(
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
                                            hintText: selecteddates==null?'Date of Birth*':FormatedDate(selecteddates),
                                            suffixIcon:
                                            GestureDetector(
                                                onTap: () => _selectDate(context),
                                                child: Icon(Icons.calendar_month_outlined,size: 26,)),
                                            hintStyle:hinttext,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 20,left: 15,right: 15),
                                        child: TextField(
                                          controller: family_tithi,
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
                                            hintText:'Birth Tithi',
                                            hintStyle:hinttext,
                                          ),
                                        ),
                                      ),
                                      Container(
                                          height: MediaQuery.of(context).size.height*0.07,
                                          margin: EdgeInsets.only(top: 20,left: 15,right: 15),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: color.grey
                                              ),
                                              borderRadius: BorderRadius.all(Radius.circular(15.0))
                                          ),
                                          child:
                                          Padding(
                                            padding:  EdgeInsets.symmetric(horizontal: 6),
                                            child: DropdownButton(
                                              elevation: 0,
                                              underline: SizedBox.shrink() ,
                                              hint: fem_group.isEmpty
                                                  ? Text('Blood Group')
                                                  : Text(fem_group,
                                                style: hinttext,
                                              ),
                                              value: my_blood,
                                              isExpanded: true,
                                              iconSize: 30.0,
                                              style:hinttext,
                                              items: b_group!.response!.map((item) {
                                                return  DropdownMenuItem(
                                                  onTap: () {
                                                    blood_id=item.bloodGroupId!;
                                                  },
                                                  child:  Text(item.name!),
                                                  value: item.name!.toString(),
                                                );
                                              }).toList() ,

                                              onChanged: (newValue) {
                                                setState(() {
                                                  my_blood = newValue!;
                                                  print(my_blood);
                                                  print("sdfbnf${fem_group}");
                                                });
                                              },
                                            ),
                                          )

                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 20,left: 15,right: 15),
                                        child: TextField(
                                          cursorColor: color.grey,
                                          controller: family_mobile,
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
                                            hintText: 'Mobile Number',
                                            hintStyle:hinttext,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 20,left: 15,right: 15),
                                        child: TextField(
                                          readOnly: true,
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
                                            hintText: 'Add a Memeber',
                                            prefixIcon: Icon(Icons.add,size: 30),
                                            hintStyle:hinttext,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        // height: MediaQuery.of(context).size.height/7,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(top: 20),
                                              width:MediaQuery.of(context).size.width/2.7,
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

                                                    get_detilse_register();


                                                  }, child: Text("Skip",style: skipbutton,)),
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
                                                    get_detilse_register();

                                                  }, child: Text("Next",style: loginbutton,)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }//if conditon
                return
                  Padding(
                    padding:EdgeInsets.only(top: MediaQuery.of(context).size.height*0.4),
                    child: Center(


                child: CircularProgressIndicator(),
                ),
                  );
              },)


          ),
        ));
  }

  Widget _menuBar(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width/4.5,
      height: MediaQuery.of(context).size.height/19,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: InkWell(
              borderRadius: BorderRadius.circular(100),

              child: Container(
                width: MediaQuery.of(context).size.width,

                alignment: Alignment.center,
                decoration: (activePageIndex == 0) ? const BoxDecoration(
                  color: color.blue,
                  borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                ) : null,
                child: Text(
                  "1",
                  style: (activePageIndex == 0) ? TextStyle(color: Colors.white) : TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),

          Expanded(
            child: InkWell(
              borderRadius: BorderRadius.circular(100),

              child: Container(
                width: MediaQuery.of(context).size.width/5,

                alignment: Alignment.center,
                decoration: (activePageIndex == 1) ? const BoxDecoration(
                  color: color.blue,
                  borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                ) : null,
                child: Text(
                  "2",
                  style: (activePageIndex == 1) ? TextStyle(color: Colors.white, fontWeight: FontWeight.bold) : TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onPlaceBidButtonPress() {
    _pageController.animateToPage(0,
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  void _onBuyNowButtonPress() {
    _pageController.animateToPage(1,
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
  }

}




