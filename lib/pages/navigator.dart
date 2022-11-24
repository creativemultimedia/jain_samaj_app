import 'package:flutter/material.dart';
import 'package:jain_samaj_app/config/color.dart';
import 'package:jain_samaj_app/pages/home/home_page.dart';
import 'package:jain_samaj_app/pages/my_cart/my_cart_page.dart';
import 'package:jain_samaj_app/pages/my_order/my_order_page.dart';
import 'package:jain_samaj_app/pages/profile/profile_page.dart';

class navigator extends StatefulWidget {


  @override
  State<navigator> createState() => _navigatorState();
}

class _navigatorState extends State<navigator> {
  int currentTab = 0;
  final List<Widget> screens = [
    home_page(),
    my_order_page(),
    my_cart_page(),
    profile_page(),
  ];
  // final PageStorageBucket bucket = PageStorageBucket();
  // Widget currentScreen = home();
  int selelectedindex = 0;
  PageController pageController = PageController();

  void ontaped(int index) {
    setState(() {
      selelectedindex = index;
      pageController.animateToPage(
        index,
        duration: Duration(milliseconds: 1),
        curve: Curves.ease,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          Container(
            child: home_page(),
          ),
          Container(
            child: my_order_page(),
          ),
          Container(
            child: my_cart_page(),
          ),
          Container(
            child: profile_page(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
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
        currentIndex: selelectedindex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: color.white,
        selectedItemColor: color.black,
        // selectedIconTheme: IconThemeData(size: 20),
        unselectedItemColor: color.black,
        onTap: ontaped,
        showUnselectedLabels: true,
        selectedFontSize: 11,
        unselectedFontSize: 11,
        elevation: 0,
      ),
    );
  }
}
