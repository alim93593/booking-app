import 'package:booking_app/features/on_boarding/data/models/boarding_model.dart';
import 'package:flutter/material.dart';

class BuildBoardingItem extends StatelessWidget {
  const BuildBoardingItem({Key? key, required this.model}) : super(key: key);
  final BoardingModel model;

  @override
  Widget build(BuildContext context) {
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
          style: const TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
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
