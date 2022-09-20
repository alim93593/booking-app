// ignore_for_file: unused_import

import 'package:booking_app/core/themes/light.dart';
import 'package:booking_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:booking_app/features/auth/presentation/screens/login_screen/login_screen.dart';
import 'package:booking_app/features/auth/presentation/screens/user_profile/screens/user_profile_screen.dart';
import 'package:booking_app/features/on_boarding/presentation/screens/on_boarding.dart';
import 'package:booking_app/features/splash/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/utils/injection/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => di.sl<AuthCubit>()
              ..getProfileInfo(token: AuthCubit.get(context).userModel!.token!),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Booking App',
          theme: kLightThemeData,
          home: const OnBoardingScreen(),
        ));
  }
}
