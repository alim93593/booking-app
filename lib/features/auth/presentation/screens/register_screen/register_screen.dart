import 'package:booking_app/features/auth/presentation/screens/register_screen/widgets/register_screen_body.dart';
import 'package:flutter/material.dart';



class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RegisterScreenBody(),
    );
  }
}
