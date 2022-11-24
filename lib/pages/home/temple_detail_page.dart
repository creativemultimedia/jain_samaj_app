import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jain_samaj_app/config/color.dart';
import 'package:jain_samaj_app/config/comntost.dart';
import 'package:jain_samaj_app/config/font_style.dart';
import 'package:jain_samaj_app/pages/home/select_date_page.dart';
import 'package:http/http.dart' as http;

import '../../api_model/yatra_location_details.dart';
class temple_detail_page extends StatefulWidget {


  @override
  State<temple_detail_page> createState() => _temple_detail_pageState();
}

class _temple_detail_pageState extends State<temple_detail_page> {
  yatra_location_details?yatra_details;
  Future get_yatra_details() async {
    var url = Uri.parse('http://scprojects.in.net/projects/samarpanam/api_/app/yatra_location_detail/MOB/1/shri-digamber-jain-mandir');
    var response = await http.get(url,  headers: {
      "Content-Type": "application/x-www-form-urlencoded",
      "Client-Service": "frontend-client-samarpanam",
      "Auth-Key": "simplerestapi_samarpanam",
      "User-ID": "1",
    },
    );

    print(response.body);
    Map<String, dynamic> finalist = await jsonDecode(response.body);
    yatra_details = yatra_location_details.fromJson(finalist);

    loader.hideLoading();
    if(response.statusCode==200)
    {
      if(yatra_details!.status==200)
      {

      }
      else
      {
        loader.showErroDialog(description: yatra_details!.message!);
      }
    }else
    {
      loader.hideLoading();
      loader.showErroDialog(description: "Something went wrong");
      print("error");
    }
    return yatra_details;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color.blue,
        title: Text("Temple details", style: appbartext),
      ),
      body:
      Container(
        child: FutureBuilder(
          future:get_yatra_details() ,
          builder: (context, snapshot) {

            if(snapshot.hasData)
            {
              return    SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Image(
                          image: NetworkImage(yatra_details!.response![0].image!),
                          height: MediaQuery.of(context).size.height / 3.3,
                          width: MediaQuery.of(context).size.width / 1),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: color.black,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      height: MediaQuery.of(context).size.height / 12,
                      width: MediaQuery.of(context).size.width / 1,
                      margin: EdgeInsets.only(top: 30, right: 15, left: 15),
                      child: ListView.builder(
                        itemCount: yatra_details!.response![0].yatraLocationGallery!.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            margin:
                            EdgeInsets.only(left: 5, top: 10, right: 2, bottom: 10),
                            height: 60,
                            width: 60,
                            child: Image(
                              image: NetworkImage(yatra_details!.response![0].yatraLocationGallery![index].image!),
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(left: 20, top: 30),
                      child: Text("Description",
                          style: TextStyle(fontFamily: 'semibold', fontSize: 18)),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(left: 20,right:20,top: 10),
                      child: Text(
                          yatra_details!.response![0].description!,
                          style: TextStyle(fontFamily: 'regular', fontSize: 12,color: color.grey)),
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
                              return select_date(yatra_details!.response!);
                            },));

                          }, child: Text("Book Now",style: loginbutton,)),
                    ),
                  ],
                ),
              );
            }//if conditon
            return Center(

            child: CircularProgressIndicator(),
            );
          },),
      ),
    );
  }
}
