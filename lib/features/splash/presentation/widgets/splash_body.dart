import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 700.0,
                width: 700.0,
                child: Lottie.asset('assets/on_boarding/splash.json'),
              ),
              const Center(
                  child: Text(
                'Booking App',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),),
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
