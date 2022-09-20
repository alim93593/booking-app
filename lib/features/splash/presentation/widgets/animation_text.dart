// ignore_for_file: must_be_immutable, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class AnimationText extends StatelessWidget {
   AnimationText({Key? key,required this.text}) : super(key: key);
   String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Marquee(
        text: text,
        style: const TextStyle(fontSize:48 ,color: Colors.black),
        fadingEdgeEndFraction: 1,
        fadingEdgeStartFraction: 1,
        blankSpace: 90,
        velocity: 150,
      ),
    );
  }
}
