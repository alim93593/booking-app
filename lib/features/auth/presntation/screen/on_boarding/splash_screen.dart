import 'dart:async';

import 'package:booking_app/features/auth/presntation/screen/on_boarding/on_boarding.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreen createState() => _SplashScreen();
}
class _SplashScreen extends State<SplashScreen> {

  @override
  void initState() {
    displaySplash();
    super.initState();
  }
  displaySplash() {
    Timer(const Duration(seconds: 5), () async {
      Route route = MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      Navigator.pushReplacement(context, route);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 700.0,
                  width: 700.0,
                  child: Lottie.asset('assets/on_boarding/splash.json'),
                  // child:const Image(
                  //   image: AssetImage('assets/on_boarding/splash.json'),fit: BoxFit.cover,gaplessPlayback: false,),
                ),
                Center(child: const Text('Booking App',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),
                SizedBox(height: 200,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}