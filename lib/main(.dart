import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:get/get.dart' hide Trans;
import 'package:get_storage/get_storage.dart';
import 'package:jain_samaj_app/config/color.dart';
import 'package:jain_samaj_app/pages/home/home_page.dart';
import 'package:jain_samaj_app/pages/login_system/login_page.dart';
import 'package:jain_samaj_app/pages/my_cart/my_cart_page.dart';
import 'package:jain_samaj_app/pages/my_order/my_order_page.dart';
import 'package:jain_samaj_app/pages/profile/profile_page.dart';



class main_pages extends StatefulWidget {
  int? ind;

  main_pages(this.ind);

  @override
  State<main_pages> createState() => _main_pagesState();
}

class _main_pagesState extends State<main_pages> {
  GetStorage box =GetStorage();
  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (context) =>
      new AlertDialog(
        title: Text("Are you Sure"),
        content: Text("You want exit app"),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(
                "No", style: TextStyle(color: color.green)),

          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text("Yes",
                style: TextStyle(color: color.green)),

          ),
        ],
      ),
    )) ??
        false;
  }

  PageController pageController = PageController();




  Future<void> opTapped(int index) async {
    widget.ind=index;
    if (box.read("user_id")!=null||index==0|| index==4) {
      setState(() {
        widget.ind=index;
      });
    }
    else if(
        index==1&& box.read("user_id")==null||
        index==2&& box.read("user_id")==null||
        index==3&& box.read("user_id")==null
    )
    {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) =>login_page(),), (route) => false);

    }
  }
  final List<Widget> screens = [
    home_page(),
    my_order_page(),
    my_cart_page(),
    profile_page(),
  ];







  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child:
      SafeArea(
        child: Scaffold(

            body: screens[widget.ind!],
            bottomNavigationBar: BottomNavigationBar(
              elevation: 0,

              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('image/home_logo.png'),
                    // color: Colors.black26,
                    size: 25,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('image/order_logo.png'),
                    size: 25,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('image/cart_logo.png'),
                    size: 25,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('image/profile_logo (2).png'),
                    size: 25,
                  ),
                  label: '',
                ),
              ],
              currentIndex: widget.ind!,
              type: BottomNavigationBarType.fixed,
              unselectedIconTheme: IconThemeData(size: 25,),
              selectedIconTheme: IconThemeData(size: 25,),

              onTap: opTapped,
              showUnselectedLabels: false,
              selectedFontSize: 0,
              unselectedFontSize: 0,
            )
        ),
      )
    );
  }
}

