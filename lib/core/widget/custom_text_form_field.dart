// ignore_for_file: unused_local_variable

import 'package:booking_app/core/themes/mode_cubit/mode_cubit.dart';
import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    Key? key,
    required this.controller,
    required this.textInputType,
    required this.hintText,
    this.isPhone = false,
    this.isPassWord = false,
    this.suffixIcon =
    const Icon(Icons.remove_red_eye_outlined, color: Colors.black),
    required this.prefix,
    this.onTaped,
    this.onChanged,
    this.onFieldSubmitted,
    this.style,
    this.hintStyle,
    this.suffix,
    this.suffixPressed,
    required this.validator,
  }) : super(key: key);

  final TextEditingController controller;
  final TextInputType textInputType;
  final String? hintText;
  final bool isPhone;
  final bool isPassWord;
  final Widget suffixIcon;
  final Widget? prefix;
  final VoidCallback? onTaped;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final IconData? suffix;
  final void Function()? suffixPressed;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    var color = ModeCubit.get(context).isDark == true
        ? const Color(0xffffffff)
        : const Color(0xff212525);
    var cardColor = ModeCubit.get(context).isDark == true
        ?  const Color(0xff212525)
        : const Color(0xffffffff);
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: textInputType,
        onFieldSubmitted: onFieldSubmitted,
        onChanged: onChanged,
        onTap: onTaped,
        style: style,
        obscureText: isPassWord,
        validator: validator,
        decoration: InputDecoration(
          filled: true,
          fillColor: cardColor,
          prefixIcon: prefix,
          hintText: '$hintText',
          hintStyle: hintStyle,
          suffixIcon: suffix != null
              ? IconButton(
            onPressed: suffixPressed,
            icon: Icon(
              suffix,
              color: color,
            ),
          )
              : null,
          contentPadding: const EdgeInsets.all(20.0),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
    );
  }
}