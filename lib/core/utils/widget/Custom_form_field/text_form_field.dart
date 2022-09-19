import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final TextEditingController Controller;
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
  CustomFormField({
    required this.Controller,
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
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: Controller,
      keyboardType: textInputType,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      onTap: onTaped,
      style: style,
      obscureText: isPassWord,
      validator: validator,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        prefixIcon: prefix,
        hintText: '$hintText',
        hintStyle: hintStyle,
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(
                  suffix,
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
    );
  }
}
