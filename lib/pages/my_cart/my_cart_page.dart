import 'package:flutter/material.dart';
import 'package:jain_samaj_app/config/color.dart';
import 'package:jain_samaj_app/config/font_style.dart';
import 'package:jain_samaj_app/pages/home/order_sucssesfully.dart';

class my_cart_page extends StatefulWidget {
  const my_cart_page({Key? key}) : super(key: key);

  @override
  State<my_cart_page> createState() => _my_cart_pageState();
}

class _my_cart_pageState extends State<my_cart_page> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.black;
    }

    return Scaffold(
      appBar: AppBar(
       backgroundColor: color.blue,
        elevation: 0,
        title: Text(
          "Cart",
          style: appbartext,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 20, top: 10),
              child: Text("Address",
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'semibold',
                  )),
            ),
            Container(
              decoration: BoxDecoration(
                color: color.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(
                  width: 1,
                  color: color.white,
                ),
              ),
              margin: EdgeInsets.only(top: 20, left: 20, right: 15),
              height: MediaQuery.of(context).size.height / 10,
              width: MediaQuery.of(context).size.width / 1,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Image(
                        image: AssetImage("image/member.png"), height: 15),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(left: 10, top: 5),
                            child: Text("Home",
                                style: TextStyle(
                                    fontFamily: 'semibold', fontSize: 14))),
                        Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(left: 10),
                            child: Text(
                                "5-11-38, Naimnagar, Hanamkonda, 506007",
                                style: TextStyle(
                                    fontFamily: 'regular',
                                    fontSize: 12,
                                    color: color.grey))),
                      ],
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.edit,
                    size: 20,
                  )
                ],
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 20, top: 10),
              child: Text("Products",
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'semibold',
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
                left: 20,
                right: 15,
                top: 10,
              ),
              height: MediaQuery.of(context).size.height / 7,
              width: MediaQuery.of(context).size.width / 1,
              child: Row(
                children: [
                  Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(top: 15, bottom: 15, left: 30),
                      child: Image(
                        image: AssetImage("image/book_1.png"),
                      )),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                            margin: EdgeInsets.only(left: 15, top: 5),
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Product 3",
                              style: TextStyle(
                                  fontFamily: 'semibold', fontSize: 15),
                            )),
                        Container(
                          margin: EdgeInsets.only(
                            left: 15,
                          ),
                          alignment: Alignment.topLeft,
                          child: Text(
                            "English, 3 months",
                            style:
                                TextStyle(fontFamily: 'regular', fontSize: 10),
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: color.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                border: Border.all(
                                  width: 0.5,
                                  color: color.grey,
                                ),
                              ),
                              margin:
                                  EdgeInsets.only(top: 10, left: 15, right: 5),
                              height: MediaQuery.of(context).size.height / 27,
                              width: MediaQuery.of(context).size.width / 12,
                              child: Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "+",
                                    style: TextStyle(
                                        fontFamily: 'regular', fontSize: 20),
                                    textAlign: TextAlign.center,
                                  )),
                            ),
                            Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(top: 7),
                                child: Text("1")),
                            Container(
                              decoration: BoxDecoration(
                                color: color.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                border: Border.all(
                                  width: 0.5,
                                  color: color.grey,
                                ),
                              ),
                              margin:
                                  EdgeInsets.only(top: 10, left: 5, right: 5),
                              height: MediaQuery.of(context).size.height / 27,
                              width: MediaQuery.of(context).size.width / 12,
                              child: Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "-",
                                    style: TextStyle(
                                        fontFamily: 'regular', fontSize: 20),
                                    textAlign: TextAlign.center,
                                  )),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Text(
                            "₹1999",
                            style:
                                TextStyle(fontSize: 14, fontFamily: 'semibold'),
                          )),
                      Image(
                        image: AssetImage("image/delete_logo.png"),
                        height: 25,
                        color: color.grey,
                      )
                    ],
                  )
                ],
              ),
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
                left: 20,
                right: 15,
                top: 10,
              ),
              height: MediaQuery.of(context).size.height / 7,
              width: MediaQuery.of(context).size.width / 1,
              child: Row(
                children: [
                  Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(top: 15, bottom: 15, left: 30),
                      child: Image(
                        image: AssetImage("image/book_1.png"),
                      )),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                            margin: EdgeInsets.only(left: 15, top: 5),
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Product 4",
                              style: TextStyle(
                                  fontFamily: 'semibold', fontSize: 15),
                            )),
                        Container(
                          margin: EdgeInsets.only(
                            left: 15,
                          ),
                          alignment: Alignment.topLeft,
                          child: Text(
                            "English, 3 months",
                            style:
                                TextStyle(fontFamily: 'regular', fontSize: 10),
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: color.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                border: Border.all(
                                  width: 0.5,
                                  color: color.grey,
                                ),
                              ),
                              margin:
                                  EdgeInsets.only(top: 10, left: 15, right: 5),
                              height: MediaQuery.of(context).size.height / 27,
                              width: MediaQuery.of(context).size.width / 12,
                              child: Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "+",
                                    style: TextStyle(
                                        fontFamily: 'regular', fontSize: 20),
                                    textAlign: TextAlign.center,
                                  )),
                            ),
                            Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(top: 7),
                                child: Text("1")),
                            Container(
                              decoration: BoxDecoration(
                                color: color.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                border: Border.all(
                                  width: 0.5,
                                  color: color.grey,
                                ),
                              ),
                              margin:
                                  EdgeInsets.only(top: 10, left: 5, right: 5),
                              height: MediaQuery.of(context).size.height / 27,
                              width: MediaQuery.of(context).size.width / 12,
                              child: Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "-",
                                    style: TextStyle(
                                        fontFamily: 'regular', fontSize: 20),
                                    textAlign: TextAlign.center,
                                  )),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Text(
                            "₹1999",
                            style:
                                TextStyle(fontSize: 14, fontFamily: 'semibold'),
                          )),
                      Image(
                        image: AssetImage("image/delete_logo.png"),
                        height: 25,
                        color: color.grey,
                      )
                    ],
                  )
                ],
              ),
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
              margin: EdgeInsets.only(left: 20, right: 15, top: 20, bottom: 20),
              height: MediaQuery.of(context).size.height / 15,
              width: MediaQuery.of(context).size.width / 1,
              child: Row(
                children: [
                  Container(
                    height: 25,
                    width: 25,
                    margin: EdgeInsets.only(
                      left: 20,
                    ),
                    child: Checkbox(
                      value: isChecked,
                      onChanged: (value) {
                        setState(() {
                          isChecked = value!;
                        });
                        print(isChecked);
                      },
                      side: BorderSide(
                        color: Colors.grey, //your desire colour here
                        width: 1.5,
                      ),
                      checkColor: Colors.white,
                      fillColor: MaterialStateProperty.resolveWith(getColor),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text("Do you want to make some Donation?"),
                  )
                ],
              ),
            ),
            Divider(
              thickness: 5,
              color: Colors.black12,
            ),
            Container(
              alignment: Alignment.topLeft,
               margin: EdgeInsets.only(left: 20,top: 10),
                child: Text(
              "Bill Details",
              style: TextStyle(fontFamily: 'semibold', fontSize: 14),
            )),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10,left: 20),
                  child: Text("Items Total",style: TextStyle(fontFamily: 'semibold',fontSize: 12,color: color.blue)),
                ),
                Spacer(),
                Container(
                  margin: EdgeInsets.only(top: 10,right: 15),
                  child: Text("+  ₹7996",style: TextStyle(fontFamily: 'semibold',fontSize: 12,color: color.black)),
                )
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10,left: 20),
                  child: Text("Delivery Fee ",style: TextStyle(fontFamily: 'semibold',fontSize: 12,color: color.blue)),
                ),
                Spacer(),
                Container(
                  margin: EdgeInsets.only(top: 10,right: 15),
                  child: Text("+     ₹100",style: TextStyle(fontFamily: 'semibold',fontSize: 12,color: color.black)),
                )
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10,left: 20),
                  child: Text("Texes and Charge",style: TextStyle(fontFamily: 'semibold',fontSize: 12,color: color.blue)),
                ),
                Spacer(),
                Container(
                  margin: EdgeInsets.only(top: 10,right: 15),
                  child: Text("+      ₹96",style: TextStyle(fontFamily: 'semibold',fontSize: 12,color: color.black)),
                )
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10,left: 20),
                  child: Text("Items Total",style: TextStyle(fontFamily: 'semibold',fontSize: 12,color: color.red
                  )),
                ),
                Spacer(),
                Container(
                  margin: EdgeInsets.only(top: 10,right: 15),
                  child: Text("+  ₹1000",style: TextStyle(fontFamily: 'semibold',fontSize: 12,color: color.black)),
                ),
              ],
            ),
            Divider(
              endIndent: 18,
              indent: 21,
              thickness: 2,
              color: Colors.black12,
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 5,left: 20),
                  child: Text("Order Total",style: TextStyle(fontFamily: 'semibold',fontSize: 12
                  )),
                ),
                Spacer(),
                Container(
                  margin: EdgeInsets.only(top: 5,right: 15),
                  child: Text("  ₹9192",style: TextStyle(fontFamily: 'semibold',fontSize: 12,color: color.black)),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 45,left: 15,right: 7,bottom: 20),
              width:MediaQuery.of(context).size.width/2.4,
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
                      return order_sucssesfully();
                    },));

                  }, child: Text("Pay ₹9192",style: loginbutton,)),
            ),
          ],
        ),
      ),
    );
  }
}
