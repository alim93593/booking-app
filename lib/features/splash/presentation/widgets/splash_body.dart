// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:booking_app/features/splash/presentation/widgets/animation_text.dart';
import 'package:flutter/material.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 720.0,
                width: 720.0,
                child: Image(
                    image: AssetImage(
                      'assets/on_boarding/splash.jpg',
                    ),
                    fit: BoxFit.fill),
              ),
              Center(
                  child: AnimationText(
                text: 'Booking App',
              )),
              const SizedBox(
                height: 200,
              )
            ],
          ),
        ),
      ),
    );
  }
}
