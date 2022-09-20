import 'dart:async';
import 'package:booking_app/features/on_boarding/presentation/screens/on_boarding.dart';
import 'package:booking_app/features/splash/presentation/widgets/splash_body.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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
    return const Scaffold(
      backgroundColor: Colors.white,
      body:SplashBody(),
    );
  }
}
