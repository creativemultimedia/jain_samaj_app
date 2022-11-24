import 'package:flutter/material.dart';
import 'package:jain_samaj_app/config/color.dart';
import 'package:jain_samaj_app/config/font_style.dart';
import 'package:jain_samaj_app/pages/home/categories_all.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return categories_all();
                    },));
                  },
                  child: Column(
                    children: [
                      Container(
                          child: Image(
                        image: AssetImage("image/cat_1.png"),
                        height: 170,
                        width: 170,
                      )),
                      Container(
                        child: Text(
                          "Books",
                          style: TextStyle(fontSize: 13, fontFamily: 'semibold'),
                        ),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return categories_all();
                    },));
                  },
                  child: Column(
                    children: [
                      Container(
                          child: Image(
                            image: AssetImage("image/cat_2.png"),
                            height: 170,
                            width: 170,
                          )),
                      Container(
                        child: Text(
                          "Compition Books",
                          style: TextStyle(fontSize: 13, fontFamily: 'semibold'),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return categories_all();
                    },));
                  },
                  child: Column(
                    children: [
                      Container(
                          child: Image(
                            image: AssetImage("image/cat-3.png"),
                            height: 170,
                            width: 170,
                          )),
                      Container(
                        child: Text(
                          "General Books",
                          style: TextStyle(fontSize: 13, fontFamily: 'semibold'),
                        ),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return categories_all();
                    },));
                  },
                  child: Column(
                    children: [
                      Container(
                          child: Image(
                            image: AssetImage("image/cat_4.png"),
                            height: 170,
                            width: 170,
                          )),
                      Container(
                        child: Text(
                          "Guides and solution",
                          style: TextStyle(fontSize: 13, fontFamily: 'semibold'),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return categories_all();
                    },));
                  },
                  child: Column(
                    children: [
                      Container(
                          child: Image(
                            image: AssetImage("image/cat_1.png"),
                            height: 170,
                            width: 170,
                          )),
                      Container(
                        child: Text(
                          "Library Books",
                          style: TextStyle(fontSize: 13, fontFamily: 'semibold'),
                        ),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return categories_all();
                    },));
                  },
                  child: Column(
                    children: [
                      Container(
                          child: Image(
                            image: AssetImage("image/cat_2.png"),
                            height: 170,
                            width: 170,
                          )),
                      Container(
                        child: Text(
                          "Novel Books",
                          style: TextStyle(fontSize: 13, fontFamily: 'semibold'),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),

          ],
        ),
      ),
    );
  }
}
