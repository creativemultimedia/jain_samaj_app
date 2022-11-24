import 'package:flutter/material.dart';
import 'package:jain_samaj_app/config/color.dart';
import 'package:jain_samaj_app/config/font_style.dart';
import 'package:jain_samaj_app/pages/home/categories.dart';
import 'package:jain_samaj_app/pages/my_cart/my_cart_page.dart';

class product_page extends StatefulWidget {
  const product_page({Key? key}) : super(key: key);

  @override
  State<product_page> createState() => _product_pageState();
}

class _product_pageState extends State<product_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: color.blue,
          elevation: 0,
          title: Text(
            "Product",
            style: appbartext,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              child: Image(
                image: AssetImage("image/Rectangle 511.png"),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text("M.R.P:",
                      style: TextStyle(
                        fontFamily: 'regular',
                        fontSize: 15,
                      )),
                ),
                Container(
                  child: Text(" Rs 800",
                      style: TextStyle(
                          fontFamily: 'regular',
                          fontSize: 15,
                          color: color.blue)),
                ),
              ],
            ),
            Divider(
              color: Colors.black12,
              thickness: 4,
            ),
            Container(
              margin: EdgeInsets.only(top: 10, left: 15),
              alignment: Alignment.topLeft,
              child: Text("Product name",
                  style: TextStyle(
                    fontFamily: 'semibold',
                    fontSize: 15,
                  )),
            ),
            Container(
              margin: EdgeInsets.only(top: 5, left: 15),
              alignment: Alignment.topLeft,
              child: Text("Prakashak- Prakashak Name",
                  style: TextStyle(
                    fontFamily: 'semibold',
                    fontSize: 12,
                  )),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 5, left: 15),
                  alignment: Alignment.topLeft,
                  child: Text("Quantity   ",
                      style: TextStyle(
                        fontFamily: 'semibold',
                        fontSize: 12,
                      )),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: color.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(
                      width: 1,
                      color: color.grey,
                    ),
                  ),
                  margin: EdgeInsets.only(
                    top: 10,
                  ),
                  height: MediaQuery.of(context).size.height / 22,
                  width: MediaQuery.of(context).size.width / 7,
                  child: Container(
                      margin: EdgeInsets.only(
                        top: 8,
                      ),
                      child: Text(
                        "1",
                        style: TextStyle(fontFamily: 'semibold', fontSize: 12),
                        textAlign: TextAlign.center,
                      )),
                ),
              ],
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: 10, left: 15),
              child: Text("Select Language",
                  style: TextStyle(
                    fontFamily: 'semibold',
                    fontSize: 14,
                  )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20),
                  width: MediaQuery.of(context).size.width / 3.4,
                  height: MediaQuery.of(context).size.height / 18.5,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: color.blue,
                        //background color of button
                        // side: BorderSide( color:color.green), //border width and color
                        elevation: 3,
                        //elevation of button
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        //content padding inside button
                      ),
                      onPressed: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context) {
                        //   return add_member_secondn();
                        // },));
                      },
                      child: Text(
                        "English",
                        style: skipbutton,
                      )),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  width: MediaQuery.of(context).size.width / 3.4,
                  height: MediaQuery.of(context).size.height / 18.5,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        //background color of button
                        side: BorderSide(color: color.grey),
                        //border width and color
                        elevation: 3,
                        //elevation of button
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        //content padding inside button
                      ),
                      onPressed: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context) {
                        //   return add_member_secondn();
                        // },));
                      },
                      child: Text(
                        "hindi",
                        style: skipbutton,
                      )),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  width: MediaQuery.of(context).size.width / 3.4,
                  height: MediaQuery.of(context).size.height / 18.5,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        //background color of button
                        side: BorderSide(color: color.grey),
                        //border width and color
                        elevation: 3,
                        //elevation of button
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        //content padding inside button
                      ),
                      onPressed: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context) {
                        //   return add_member_secondn();
                        // },));
                      },
                      child: Text(
                        "Gujarati",
                        style: skipbutton,
                      )),
                ),
              ],
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: 20, left: 15),
              child: Text("Select number of Months",
                  style: TextStyle(
                    fontFamily: 'semibold',
                    fontSize: 14,
                  )),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      height: MediaQuery.of(context).size.height / 14,
                      width: MediaQuery.of(context).size.width / 7,
                      decoration: BoxDecoration(
                        color: color.white,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: color.grey, width: 1),
                      ),
                      child: Center(
                          child: Text("1",
                              style: TextStyle(
                                  color: color.black, fontSize: 15)))),
                  Container(
                      height: MediaQuery.of(context).size.height / 14,
                      width: MediaQuery.of(context).size.width / 7,
                      decoration: BoxDecoration(
                        color: color.white,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: color.grey, width: 1),
                      ),
                      child: Center(
                          child: Text("2",
                              style: TextStyle(
                                  color: color.black, fontSize: 15)))),
                  Container(
                      height: MediaQuery.of(context).size.height / 14,
                      width: MediaQuery.of(context).size.width / 7,
                      decoration: BoxDecoration(
                        color: color.blue,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: color.grey, width: 1),
                      ),
                      child: Center(
                          child: Text("3",
                              style: TextStyle(
                                  color: color.white, fontSize: 15)))),
                  Container(
                      height: MediaQuery.of(context).size.height / 14,
                      width: MediaQuery.of(context).size.width / 7,
                      decoration: BoxDecoration(
                        color: color.white,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: color.grey, width: 1),
                      ),
                      child: Center(
                          child: Text("4",
                              style: TextStyle(
                                  color: color.black, fontSize: 15)))),
                  Container(
                      height: MediaQuery.of(context).size.height / 14,
                      width: MediaQuery.of(context).size.width / 7,
                      decoration: BoxDecoration(
                        color: color.white,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: color.grey, width: 1),
                      ),
                      child: Center(
                          child: Text("5",
                              style: TextStyle(
                                  color: color.black, fontSize: 15)))),
                ],
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: 15, left: 15),
              child: Text("Video",
                  style: TextStyle(
                    fontFamily: 'semibold',
                    fontSize: 14,
                  )),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, right: 5, left: 2),
              height: MediaQuery.of(context).size.height / 6.7,
              child:
                  ListView(scrollDirection: Axis.horizontal, children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width / 2.5,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                  ),
                  margin: EdgeInsets.all(5),
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 5),
                    child: Image(
                      image: AssetImage("image/video_play.png"),
                      height: 25,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2.5,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                  ),
                  margin: EdgeInsets.all(5),
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 5),
                    child: Image(
                      image: AssetImage("image/video_play.png"),
                      height: 25,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2.5,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                  ),
                  margin: EdgeInsets.all(5),
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 5),
                    child: Image(
                      image: AssetImage("image/video_play.png"),
                      height: 25,
                    ),
                  ),
                ),
              ]),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: 15, left: 15),
              child: Text("PDF",
                  style: TextStyle(
                    fontFamily: 'semibold',
                    fontSize: 14,
                  )),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, right: 5, left: 2),
              height: MediaQuery.of(context).size.height / 6.7,
              child:
                  ListView(scrollDirection: Axis.horizontal, children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width / 2.5,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                  ),
                  margin: EdgeInsets.all(5),
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 5),
                    child: Image(
                      image: AssetImage("image/pdf.png"),
                      height: 25,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2.5,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                  ),
                  margin: EdgeInsets.all(5),
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 5),
                    child: Image(
                      image: AssetImage("image/pdf.png"),
                      height: 25,
                    ),
                  ),
                ),
              ]),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: 15, left: 15),
              child: Text("Product Description",
                  style: TextStyle(
                    fontFamily: 'semibold',
                    fontSize: 14,
                  )),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: 10, left: 15,right: 15),
              child: Text(
                  "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an"
                      " unknown printer took a galley of type and scrambled it to make a type specimen book."
                      " It has survived not only five centuries, but also the leap into electronic typesetting, "
                      "remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets "
                      "containing  Lorem Ipsum passages, and more"
                      " recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                  style: TextStyle(
                    fontFamily: 'regular',
                    fontSize: 14,
                  )),
            ),
            Container(
              // height: MediaQuery.of(context).size.height/7,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10,left: 15,right: 7),
                    width:MediaQuery.of(context).size.width/2.4,
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
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return product_page();
                          },));
                        }, child: Text("Add to Cart",style: skipbutton,)),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10,left: 15,right: 7),
                    width:MediaQuery.of(context).size.width/2.4,
                    height: MediaQuery.of(context).size.height/18.5,
                    child: ElevatedButton(
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return my_cart_page();
                          },));

                        }, child: Text("Order Now",style: loginbutton,)),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: 15, left: 15),
              child: Text("Similar Products",
                  style: TextStyle(
                    fontFamily: 'semibold',
                    fontSize: 14,
                  )),
            ),
            Container(
              height: MediaQuery.of(context).size.height/4,
              width: MediaQuery.of(context).size.width/1,
              child:  GridView.builder(
                itemCount: 3,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.75),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return Categories();
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
                                image: AssetImage("image/gyanbhandarimage.png"),
                                height: 105,
                                width: 105,
                              )),
                          Container(
                            margin: EdgeInsets.only(top: 5),
                            child: Text("GyanBhandar",style: TextStyle(fontSize: 13,fontFamily: 'regular')),),
                          Container(
                            child: Text("in Delhi",style: TextStyle(fontSize: 13,fontFamily: 'regular')),)
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ]),
        ));
  }
}
