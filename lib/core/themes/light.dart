import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
const Color mainColor = Color(0xff0288D1);
final kLightThemeData = ThemeData(
  fontFamily: 'Ubuntu',
  primarySwatch:Colors.blue,
  scaffoldBackgroundColor: const Color(0xffffffff),
  appBarTheme: const AppBarTheme(
    titleSpacing: 20,
    backgroundColor: Color(0xffffffff),
    elevation: 0.0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Color(0xffF6F4F4),
      statusBarIconBrightness: Brightness.dark,
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
  ),
  textTheme: const TextTheme(
      bodyText1: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      )),
  drawerTheme:  const DrawerThemeData(
    backgroundColor: Color(0xfff5f5f5),
  ),

);