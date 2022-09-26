// ignore_for_file: unnecessary_null_comparison, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, unused_import, prefer_const_constructors

import 'package:booking_app/core/themes/light.dart';
import 'package:booking_app/core/utils/bloc_observer.dart';
import 'package:booking_app/core/utils/constants/strings.dart';
import 'package:booking_app/core/utils/local/cache_helper.dart';
import 'package:booking_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:booking_app/features/auth/presentation/screens/login_screen/login_screen.dart';
import 'package:booking_app/features/hotels/presentation/screens/home_layout/home_layout.dart';
import 'package:booking_app/features/hotels/presentation/screens/home_screen/home_screen.dart';
import 'package:booking_app/features/on_boarding/presentation/screens/on_boarding.dart';
import 'package:booking_app/features/splash/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/themes/dark.dart';
import 'core/utils/injection/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await CacheHelper.init();
  Widget widget;
  bool onBoarding = CacheHelper.getData(key: 'onBoarding') ?? false;
  var toKen = CacheHelper.getData(key: 'toKen');
  debugPrint(onBoarding.toString());
  debugPrint(toKen.toString());
  if (onBoarding == false) {
    widget = const OnBoardingScreen();
  } else {
    if (toKen != null) {
      widget = HomeLayout();
    } else {
      widget = const LoginScreen();
    }
  }
  bool? isDark = CacheHelper.getData(key: 'isDark');

  BlocOverrides.runZoned(
    () {
      runApp(MyApp(
        isDark: isDark,
        startWidget: widget,
      ));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  MyApp({required this.startWidget, this.isDark});
  final Widget startWidget;
  final bool? isDark;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => di.sl<AuthCubit>(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Booking App',
          theme: kLightThemeData,
          darkTheme: kDarkThemeData,
          home: startWidget,
        ));
  }
}
