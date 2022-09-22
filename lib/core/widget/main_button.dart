import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final VoidCallback? onTabbed;
  final Text? myStyle;
  final Color? myColor;
  final bool isPlatformLogin;
  final Image? platFormImage;
  final double width;
  final double height;

  const MainButton({
    required this.onTabbed,
    required this.myStyle,
    required this.myColor,
    this.isPlatformLogin = false,
    this.platFormImage,
    required this.width,
    required this.height,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTabbed,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            40.0,
          ),
          color: myColor,
        ),
        child: Center(
          child: myStyle,
        ),
      ),
    );
  }
}
