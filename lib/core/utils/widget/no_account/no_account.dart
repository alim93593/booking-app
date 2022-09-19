import 'package:flutter/material.dart';

class DoNotHaveAccount extends StatelessWidget {
  final String? label;
  final VoidCallback? onPressed;
  final String? btnLabel;

  DoNotHaveAccount(
      {required this.label, required this.onPressed, required this.btnLabel});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${label?.toUpperCase()}',
        ),
        TextButton(
          onPressed: onPressed,

          child: Text('${btnLabel}'),
        ),
      ],
    );
  }
}