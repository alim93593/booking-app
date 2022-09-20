import 'package:booking_app/core/themes/light.dart';
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '$label',
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
