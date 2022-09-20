import 'package:booking_app/core/themes/light.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomPageIndicator extends StatelessWidget {
  const CustomPageIndicator({Key? key ,required this.controller}) : super(key: key);
final PageController controller;
  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,
      count: 3,
      effect:  const ExpandingDotsEffect(
        dotColor: mainColor,
        activeDotColor: mainColor,
        dotHeight: 10,
        dotWidth: 10.0,
        spacing: 5.0,
        expansionFactor: 4.0,
      ),
    );
  }
}
