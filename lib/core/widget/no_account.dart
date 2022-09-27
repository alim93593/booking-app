import 'package:booking_app/core/themes/light.dart';
import 'package:booking_app/core/themes/mode_cubit/mode_cubit.dart';
import 'package:flutter/material.dart';

class DoNotHaveAccount extends StatelessWidget {
  final String? label;
  final VoidCallback? onPressed;
  final String? btnLabel;

  const DoNotHaveAccount(
      {required this.label,
      required this.onPressed,
      required this.btnLabel,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var color = ModeCubit.get(context).isDark == true
        ? const Color(0xffffffff)
        : const Color(0xff212525);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '$label',
          style: TextStyle(
            color: color,
          ),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            '$btnLabel',
            style:const TextStyle(
              color: mainColor,
            ),
          ),
        ),
      ],
    );
  }
}
