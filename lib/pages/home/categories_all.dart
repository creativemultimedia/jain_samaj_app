import 'package:flutter/material.dart';
import 'package:jain_samaj_app/config/color.dart';
import 'package:jain_samaj_app/config/font_style.dart';
import 'package:jain_samaj_app/pages/home/categories.dart';
import 'package:jain_samaj_app/pages/home/product_page.dart';
import 'package:jain_samaj_app/pages/navigator.dart';
import 'package:jain_samaj_app/pages/profile/profile_page.dart';

import '../../main(.dart';

class categories_all extends StatefulWidget {
  const categories_all({Key? key}) : super(key: key);

  @override
  State<categories_all> createState() => _categories_allState();
}

class _categories_allState extends State<categories_all> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color.blue,
        title: Text(
          "Categories",
          style: appbartext,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width:MediaQuery.of(context).size.width/7,
                    height: MediaQuery.of(context).size.height/19,
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
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return main_pages(0);
                          },));
                        }, child: Text("All",style: skipbutton,)),
                  ),
                  Container(
                    width:MediaQuery.of(context).size.width/2.9,
                    height: MediaQuery.of(context).size.height/19,
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
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return main_pages(0);
                          },));
                        }, child: Text("GeneralBooks",style: skipbutton,)),
                  ),
                  Container(
                    width:MediaQuery.of(context).size.width/3.1,
                    height: MediaQuery.of(context).size.height/19,
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
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return main_pages(0);
                          },));
                        }, child: Text("Novel Books",style: skipbutton,)),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height/1,
              width: MediaQuery.of(context).size.width/1,
              child:  GridView.builder(
                itemCount: 6,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: 0.90),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return product_page();
                      },));
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 2, top: 2, right: 2),
                      height: MediaQuery.of(context).size.height / 20,
                      width: MediaQuery.of(context).size.width / 20,
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
                          Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Image(
                                image: AssetImage("image/book_1.png"),
                                height: 125,
                              )),
                          Container(
                            margin: EdgeInsets.only(top: 5),
                            child: Text("Product",style: TextStyle(fontSize: 13,fontFamily: 'regular')),),
                          Container(
                            margin: EdgeInsets.only(top: 5),
                            child: Image(
                              image: AssetImage("image/button.png"),
                              height: 20,
                            ),)
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
