import 'package:booking_app/core/themes/mode_cubit/mode_cubit.dart';
import 'package:booking_app/features/on_boarding/data/models/boarding_model.dart';
import 'package:flutter/material.dart';

class BuildBoardingItem extends StatelessWidget {
  const BuildBoardingItem({Key? key, required this.model}) : super(key: key);
  final BoardingModel model;

  @override
  Widget build(BuildContext context) {
    var color = ModeCubit.get(context).isDark == true
        ? const Color(0xffffffff)
        : const Color(0xff212525);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            child: Image(
              image: AssetImage(model.image),
            )),
        const SizedBox(
          height: 30.0,
        ),

        Text(
          model.title,
          style:  TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        const SizedBox(
          height: 30.0,
        ),
        Text(
          model.body,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 18.0,
            color: Colors.grey,
          ),
        ),
        const SizedBox(
          height: 30.0,
        ),

      ],
    );
  }
}