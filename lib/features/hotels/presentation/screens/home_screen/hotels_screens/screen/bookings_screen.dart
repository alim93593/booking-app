// ignore_for_file: prefer_const_constructors, unused_import

import 'package:booking_app/features/auth/presentation/screens/user_profile/screens/user_profile_screen/widget/custom_app_bar.dart';
import 'package:booking_app/features/hotels/presentation/screens/home_screen/hotels_screens/widget/build_booking_body.dart';
import 'package:flutter/material.dart';

class BookingsScreen extends StatelessWidget {
  const BookingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BookingBody();

  }
}
