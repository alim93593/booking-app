// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_import

import 'package:booking_app/core/themes/mode_cubit/mode_cubit.dart';
import 'package:booking_app/features/auth/presentation/screens/user_profile/screens/user_profile_screen/widget/custom_app_bar.dart';
import 'package:booking_app/features/hotels/presentation/screens/home_screen/widgets/vertical_hotels_list_view.dart';
import 'package:flutter/material.dart';

class BookingBody extends StatelessWidget {
  const BookingBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cardColor = ModeCubit.get(context).isDark == true
        ? Colors.black
        : const Color(0xffffffff);
    var color = ModeCubit.get(context).isDark == true
        ? const Color(0xffffffff)
        : const Color(0xff212525);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        // centerTitle: false,
        appBar: AppBar(
          title: Text(
            'My trips',
            style: TextStyle(
              fontFamily: 'Ubuntu',
              fontSize: 20,
              color: color,

            ),
          ),

        ),
        body: Column(children: [
          Material(
            color: cardColor,
            child: const TabBar(
              tabs: <Widget>[
                Tab(
                  text: 'Bookings',
                ),
                Tab(
                  text: 'Favourites',
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                Padding(
                    padding: EdgeInsets.all(10),
                    child: VerticalHotelsListView()),
                Padding(
                    padding: EdgeInsets.all(10),
                    child: VerticalHotelsListView()),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
