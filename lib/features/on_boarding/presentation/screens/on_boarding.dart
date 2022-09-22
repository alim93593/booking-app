import 'package:booking_app/core/themes/light.dart';
import 'package:booking_app/features/on_boarding/presentation/widgets/boarding_body.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: backgroundColor,
      body: BoardingBody(),
    );
  }
}
