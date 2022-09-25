// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:flutter/material.dart';

appbar(
    {context,
    Function()? ontap,
    IconData? myIcon,
    Color? mycolor,
    required String title,
    bool? isLeading,
    bool? isAction,
    List<Widget>? actions,
    bool? isTabShow,
    bool?centerTitle,
    // ignore: non_constant_identifier_names
    bool? resizeAppText
    }) {
  return AppBar(
      centerTitle: centerTitle,
      bottom: isTabShow == true
          ? TabBar(
              indicatorColor: Colors.grey,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              labelStyle: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              tabs: [
                Tab(
                  // icon: Icon(
                  //   Icons.list_alt_rounded,
                  //   color: Colors.black,
                  // ),
                  text: "UpComing",
                ),
                Tab(
                  // icon: Icon(
                  //   Icons.favorite_border_outlined,
                  //   color: Colors.black,
                  // ),
                  text: "Finished",
                ),
                Tab(
                  // icon: Icon(
                  //   Icons.check_circle_outline,
                  //   color: Colors.black,
                  // ),
                  text: "Favorites",
                ),
              ],
            )
          : null,
      title:resizeAppText==true? Transform(
        transform:  Matrix4.translationValues(-50.0, 0.0, 0.0),
        child: Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black),
        ),
      ):Text(
        title,
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black),
      ),
      elevation: 0,
      backgroundColor: ThemeData().appBarTheme.backgroundColor,
      leading: isLeading == true
          ? GestureDetector(
              onTap: ontap,
              child: Icon(
                myIcon,
                size: 30,
                color: mycolor,
              ),
            )
          : Container(),
      actions: actions);
}
