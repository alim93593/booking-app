// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';

class MyInputFeild extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  TextInputType type;
  Function(String)? onsubmit;
  Function(dynamic)? onchanged;
  VoidCallback? onTap;
  dynamic validate;
  IconData? prefix;
  IconData? suffix;
  VoidCallback? sufixpressed;
  bool ispassword;
  bool isTextPassword;
  MyInputFeild(
      {Key? key,
        required this.label,
        required this.hint,
        required this.controller,
        required this.type,
        this.onTap,
        this.ispassword =false,
        this.onsubmit,
        this.sufixpressed,
        this.suffix,
        this.prefix,
        this.onchanged,
        this.validate,
        this.isTextPassword=false
      }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: type,
      controller: controller,
      onFieldSubmitted: onsubmit,
      onTap: onTap,
      onChanged: onchanged,
      obscureText: ispassword,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w600,
          // backgroundColor: Colors.white
        ),
        border: UnderlineInputBorder(
            borderSide: BorderSide(
                color: Colors.grey
            )
        ),
        prefixIcon: Icon(prefix),
        suffixIcon: suffix != null
            ? IconButton(
          onPressed: sufixpressed,
          icon: Icon(suffix),
        )
            : null,
      ),
      validator: validate,
    ) ;
  }
}