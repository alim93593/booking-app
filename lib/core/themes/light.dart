import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
const Color mainColor = Color(0xff1ed5a2);
final kLightThemeData = ThemeData(
  fontFamily: 'Ubuntu',
  primarySwatch: Colors.teal,
  scaffoldBackgroundColor: const Color(0xfff5f5f5),
  appBarTheme: const AppBarTheme(
    titleSpacing: 20,
    backgroundColor: Color(0xfff1f3f6),
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