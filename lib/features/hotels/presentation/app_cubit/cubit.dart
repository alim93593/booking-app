import 'package:booking_app/features/hotels/presentation/app_cubit/states.dart';
import 'package:booking_app/features/hotels/presentation/screens/home_screen/home_screen.dart';
import 'package:booking_app/features/hotels/presentation/screens/home_screen/hotels_screens/bookings_screen.dart';
import 'package:booking_app/features/hotels/presentation/screens/home_screen/settings_screen/settings_screen.dart';
import 'package:booking_app/features/hotels/presentation/screens/profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialStates());
  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
      icon: Icon(
        FontAwesomeIcons.earthAfrica,
      ),
      label: 'Explore',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        FontAwesomeIcons.addressBook,
      ),
      label: 'Bookings',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        FontAwesomeIcons.user,
      ),
      label: 'Profile',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        FontAwesomeIcons.gears,
      ),
      label: 'Settings',
    ),
  ];
  List<Widget> screens = [
    HomeScreen(),
    const BookingsScreen(),
    const ProfileScreen(),
    const SettingsScreen(),
  ];
  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(AppBottomNavStates());
  }
}
