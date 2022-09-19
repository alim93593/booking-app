import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final kLightThemeData = ThemeData(
  primarySwatch: Colors.blue,
  scaffoldBackgroundColor: const Color(0xfff5f5f5),
  appBarTheme: const AppBarTheme(
    titleSpacing: 20,
    backgroundColor: const Color(0xfff1f3f6),
    elevation: 0.0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: const Color(0xffF6F4F4FF),
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
  drawerTheme:  DrawerThemeData(
    backgroundColor: const Color(0xfff5f5f5),
  ),

);


// ignore_for_file: constant_identifier_names

const String defaultUserImage = '';

const String CACHED_USER = 'CACHED_USER' ;
