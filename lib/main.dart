import 'package:booking_app/core/utils/constants/constants.dart';
import 'package:flutter/material.dart';
import 'core/utils/injection/injection_container.dart' as di;
import 'features/auth/presntation/screen/login_screen/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Booking App',
      theme: kLightThemeData,
      home:  LoginScreen(),
    );
  }
}
