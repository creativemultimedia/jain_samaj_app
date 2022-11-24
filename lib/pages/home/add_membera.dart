import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jain_samaj_app/config/color.dart';
import 'package:jain_samaj_app/config/comntost.dart';
import 'package:jain_samaj_app/config/font_style.dart';
import 'package:jain_samaj_app/main.dart';
import 'package:jain_samaj_app/pages/home/add_membe_second.dart';
import 'package:jain_samaj_app/pages/home/book_yatra.dart';
import 'package:http/http.dart' as http;
import '../../api_model/add_member.dart';
import '../../api_model/user_details.dart' as Ad;
import '../../api_model/yatra_add_member.dart'as CD;
import '../../api_model/bad_responce.dart' as BAD;
class add_members extends StatefulWidget {

  @override
  State<add_members> createState() => _add_membersState();
}

class _add_membersState extends State<add_members> {

  Ad.user_details_model?user_de;
  yatra_add_menber_add?add_member;
  GetStorage box=GetStorage();

  Future get_add_memebr() async {
    Map map_login = {
      "device_type":"MOB",
      "search":"IGU23",
      "user_id":"8",
      "slug":"shri-digamber-jain-mandir"
    };
    var url = Uri.parse('https://scprojects.in.net/projects/samarpanam/api_/app/search_user_for_yatra_location');
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
    add_member = yatra_add_menber_add.fromJson(finalist);
    loader.hideLoading();
    if(response.statusCode==200)
    {
      if(add_member!.status==200)
      {
        box.write("user_id", add_member!.response![0].userId!);
      }
      else
      {
        loader.showErroDialog(description: add_member!.message!);
      }
    }
    else if(response.statusCode==400)
    {
      Map<String, dynamic> finalist = await jsonDecode(response.body);

      BAD.badrespondce_model?bad = BAD.badrespondce_model.fromJson(finalist);
      loader.showErroDialog(description: bad.message!);
    }
    else
    {
      loader.hideLoading();
      loader.showErroDialog(description: "Something went wrong");
      print("error");
    }
    return add_member;
  }
  List<String> member_add=["${MyApp.Member_name}"];
  TextEditingController te =TextEditingController();
  List<Response> _foundereusers = [];
  onserach(String serach) {
    setState(() {
      if(te.text.isNotEmpty)
      {
        _foundereusers = add_member!.response!
            .where((user) => user.memberId!.toString().contains(serach))
            .toList();

      }
      else
      {
        _foundereusers.clear();
      }

    });
  }
  CD.yatra_location_menber_add?yatra_memer;
  String my_mode="";
  String?travel_mode;
  String?travel_mode_id;
  Future get_yatra_add_mem() async {
    var url = Uri.parse('https://scprojects.in.net/projects/samarpanam/api_/app/yatra_travel_mode/MOB/1');
    var response = await http.get(url,  headers: {
      "Content-Type": "application/x-www-form-urlencoded",
      "Client-Service": "frontend-client-samarpanam",
      "Auth-Key": "simplerestapi_samarpanam",
      "User-ID": "1",
    },
    );

    print(response.body);
    Map<String, dynamic> finalist = await jsonDecode(response.body);
    yatra_memer = CD.yatra_location_menber_add.fromJson(finalist);

    loader.hideLoading();
    if(response.statusCode==200)
      {

      if(  yatra_memer!.status==200)
      {
        get_add_memebr();
      }
      else
      {
        loader.showErroDialog(description: yatra_memer!.message!);
      }
    }else
    {
      loader.hideLoading();
      loader.showErroDialog(description: "Something went wrong");
      print("error");
    }
    return yatra_memer;
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color.blue,
          title: Text(
        "Add Members",
        style: appbartext,
      )),
      body: Container(
        child:
          FutureBuilder(
            future:get_yatra_add_mem() ,
            builder: (context, snapshot) {

              if(snapshot.hasData)
              {
                return  SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(left: 20,top: 40),
                            child: Text(
                              "Add 5 Members to book Yatra",
                              style: TextStyle(fontSize: 14, fontFamily: 'regular'),
                            )),


                        Container(
                          height: MediaQuery.of(context).size.height/10*member_add.length,
                          child: ListView.separated(

                              itemBuilder: (context, index) {
                            return
                              GestureDetector(
                                onTap: () {

                                },
                                child: Container(
                                decoration: BoxDecoration(
                                  color: color.white,
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  border: Border.all(
                                    width: 1,
                                    color: color.grey,
                                  ),
                                ),
                                margin: EdgeInsets.only(top: 10,left: 20,right: 20),
                                height: MediaQuery.of(context).size.height/15,
                                width: MediaQuery.of(context).size.width/1,
                                child: Row(
                                  children: [
                                    Container(
                                        margin: EdgeInsets.only(left: 30),
                                        child: Text(member_add[index],style: TextStyle(fontFamily: 'semibold',fontSize: 12))),
                                    Spacer(),
                                    Container(
                                      margin: EdgeInsets.only(right: 30),
                                      child: Image(image: AssetImage("image/delete_logo.png"),height: 25),)
                                  ],
                                ),
                            ),
                              );
                          }, separatorBuilder: (context, index) {
                            return Divider();
                          }, itemCount: member_add.length),
                        ),

                        Container(
                          margin: EdgeInsets.only(top: 20),
                          width:MediaQuery.of(context).size.width/2.7,
                          height: MediaQuery.of(context).size.height/18.5,
                          child: ElevatedButton(

                              style: ElevatedButton.styleFrom(
                                primary: Colors.white, //background color of button
                                side: BorderSide( color:color.green), //border width and color
                                elevation: 3, //elevation of button
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                //content padding inside button
                              ),

                              onPressed: () {
                               showModalBottomSheet(context: context, builder: (context) {
                                 return  Container(
                                   decoration: BoxDecoration(
                                     color: Colors.black12,
                                     borderRadius: BorderRadius.all(Radius.circular(10)),
                                   ),
                                   margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                                   height: MediaQuery.of(context).size.height / 2.5,
                                   width: MediaQuery.of(context).size.width / 1,
                                   child: Column(
                                     children: [
                                       Container(
                                         alignment: Alignment.topRight,
                                         margin: EdgeInsets.only(right: 15,top: 10),
                                         child: Image(image: AssetImage("image/cancle.png"),height: 20),
                                       ),


                                       Container(
                                         height: MediaQuery.of(context).size.height/17,
                                         margin: EdgeInsets.symmetric(horizontal: 12),
                                         decoration: BoxDecoration(
                                           color: color.white,
                                           borderRadius: BorderRadius.all(Radius.circular(15.0)),
                                           border: Border.all(
                                             width: 1,
                                             color: color.white,
                                           ),
                                         ),

                                         child: TextField(
                                           controller: te,
                                           onChanged: (value) =>  onserach(value),
                                           decoration: new InputDecoration(
                                             contentPadding: EdgeInsets.all(2),
                                             prefixIcon: Icon(Icons.search_rounded,
                                                 size: 22),
                                             disabledBorder:OutlineInputBorder(
                                                 borderRadius: BorderRadius.all(
                                                   Radius.circular(15.0),
                                                 ),
                                                 borderSide: new BorderSide(color: color.white)) ,
                                             border: new OutlineInputBorder(
                                                 borderRadius: BorderRadius.all(
                                                   Radius.circular(15.0),
                                                 ),
                                                 borderSide: new BorderSide(color: color.white)),
                                             focusedBorder: OutlineInputBorder(
                                               borderRadius: BorderRadius.all(
                                                 Radius.circular(15.0),
                                               ),
                                               borderSide: BorderSide(color: color.white),
                                             ),
                                             hintText: 'Search member by Member ID / Mobile No.',
                                             hintStyle:hinttext,

                                           ),

                                         ),
                                       ),

                                       Container(
                                         height: 100,
                                         child: ListView.separated(itemBuilder: (context, index) {
                                           return  Column(
                                             children: [
                                               if(te.text==_foundereusers[index].memberId!)...
                                               {

                                                 GestureDetector(
                                                   onTap:
                                                       () {

                                           setState(() {
                                             member_add.add(_foundereusers[index].name!);
                                           });
                                                     Navigator.pop(context);


                                                   },
                                                   child: Container(
                                                     decoration: BoxDecoration(
                                                       color: color.white,
                                                       borderRadius: BorderRadius.all(Radius.circular(10)),
                                                       border: Border.all(
                                                         width: 1,
                                                         color: color.white,
                                                       ),
                                                     ),
                                                     margin: EdgeInsets.only(top: 30,left: 15,right: 15),
                                                     height: MediaQuery.of(context).size.height/10,
                                                     width: MediaQuery.of(context).size.width/1,
                                                     child: Row(
                                                       children: [
                                                         Container(
                                                           margin: EdgeInsets.only(left:10),
                                                           child: Image(image: AssetImage("image/member.png"),height: 20),),
                                                         Expanded(
                                                           child: Column(
                                                             children: [
                                                               Container(
                                                                   alignment: Alignment.topLeft,
                                                                   margin: EdgeInsets.only(left:20,top: 10),
                                                                   child: Text(_foundereusers[index].name!,style: TextStyle(fontFamily: 'semibold',fontSize: 14))),
                                                               Container(
                                                                   alignment: Alignment.topLeft,
                                                                   margin: EdgeInsets.only(left:20,top: 10),
                                                                   child: Text(_foundereusers[index].memberId!,style: TextStyle(fontFamily: 'regular',fontSize: 13,color: color.grey))),
                                                             ],
                                                           ),
                                                         ),
                                                       ],
                                                     ),
                                                   ),
                                                 )
                                               }
                                             ],
                                           );
                                         }, separatorBuilder: (context, index) {
                                           return Divider();
                                         }, itemCount: _foundereusers.length),
                                       ),
                                       Container(
                                         margin: EdgeInsets.only(top: 20),
                                         width:MediaQuery.of(context).size.width/2.7,
                                         height: MediaQuery.of(context).size.height/18.5,
                                         child: ElevatedButton(
                                             style: OutlinedButton.styleFrom(
                                               backgroundColor:color.blue,
                                               shape: RoundedRectangleBorder(
                                                 borderRadius: BorderRadius.circular(12),
                                               ),
                                             ),
                                             onPressed: () {
                                               Navigator.push(context, MaterialPageRoute(builder: (context) {
                                                 return add_members();
                                               },));

                                             }, child: Text("Add",style: loginbutton,)),
                                       ),
                                     ],
                                   ),
                                 );
                               },);




                                // Navigator.push(context, MaterialPageRoute(builder: (context) {
                                //   return add_member_secondn();
                                // },));


                              }, child:
                          Text("+ Add Member",style: skipbutton,)),
                        ),
                        Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(left: 20,top: 20),
                            child: Text(
                              "Select the Travel Mode",
                              style: TextStyle(fontSize: 14, fontFamily: 'semibold'),
                            )),

                        Container(
                          height: MediaQuery.of(context).size.height*0.07,
                          margin: EdgeInsets.only(top: 10,left: 15,right: 15),
                          decoration: BoxDecoration(
                            color: color.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(
                              width: 1,
                              color: color.grey,
                            ),
                          ),
                          child: Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 6),
                            child: DropdownButton(

                              underline: SizedBox.shrink() ,
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              elevation: 0,
                              hint: my_mode.isEmpty
                                  ? Padding(
                                padding:  EdgeInsets.symmetric(horizontal: 12),
                                child: Text("Select the travel mode",style: TextStyle(fontFamily: 'semibold',fontSize: 12,color: color.grey)),
                              )
                                  : Text(travel_mode!,
                                style: hinttext,
                              ),
                              value: travel_mode,
                              isExpanded: true,
                              iconSize: 30.0,
                              style:hinttext,
                              items: yatra_memer!.response!.map((item) {
                                return  DropdownMenuItem(

                                  onTap: () {
                                    travel_mode_id=item.yatraTravelModeId!;
                                  },
                                  child:  Text(item.name!),
                                  value: item.name!.toString(),
                                );
                              }).toList() ,
                              onChanged: (newValue) {
                                setState(() {
                                  travel_mode = newValue!;

                                });
                              },
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
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return book_yatra();
                                },));

                              }, child: Text("Book Yatra",style: loginbutton,)),
                        ),
                      ],
                    ));
              }//if conditon
              return Center(

              child: CircularProgressIndicator(),
              );
            },)




      ),
    );
  }
}
