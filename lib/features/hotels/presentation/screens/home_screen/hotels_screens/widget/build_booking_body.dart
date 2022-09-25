// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:booking_app/features/auth/presentation/screens/user_profile/screens/user_profile_screen/widget/custom_app_bar.dart';
import 'package:booking_app/features/hotels/presentation/screens/home_screen/widgets/vertical_hotels_list_view.dart';
import 'package:flutter/material.dart';

class BookingBody extends StatelessWidget {
  const BookingBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: appbar(
          // centerTitle: false,
          isAction: true,
          isLeading: true,
          title: 'My Trip',
          isTabShow: true,
          context: context,
          mycolor: Colors.white,
          resizeAppText: true
        ),
        backgroundColor: Colors.white,
        body: TabBarView(
          children: [
            Padding(
                padding: EdgeInsets.all(10),
                child: VerticalHotelsListView()
            ),
            Padding(
                padding: EdgeInsets.all(10),
                child: VerticalHotelsListView()
            ),
            Padding(
                padding: EdgeInsets.all(10),
                child: VerticalHotelsListView()
            ),
          ],
        ),
      ),
    );
  }
}
