// ignore_for_file: sort_child_properties_last, must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  DefaultButton(
      {Key? key,
      required this.text,
      this.radius = 10.0,
      this.background = Colors.blue,
      this.height = 40.0,
      required this.function,
      this.width = double.infinity,
      this.isuppercase = true
      }) : super(key: key);
  double width;
  Color background;
  bool isuppercase;
  double radius;
  double height;
  Function() function;
  String text;
  @override
  Widget build(BuildContext context) {
   return  Container(
      width: width,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isuppercase ? text.toUpperCase() : text,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18.0, color: Colors.white),
        ),
        height: height,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: background,
      ),
    );
  }
}
