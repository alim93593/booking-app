// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_import

import 'package:booking_app/core/themes/mode_cubit/mode_cubit.dart';
import 'package:booking_app/features/auth/presentation/screens/user_profile/screens/user_profile_screen/widget/custom_app_bar.dart';
import 'package:booking_app/features/hotels/presentation/screens/bookings_screens/widget/canceled_bookings.dart';
import 'package:booking_app/features/hotels/presentation/screens/bookings_screens/widget/completed_bookings.dart';
import 'package:booking_app/features/hotels/presentation/screens/bookings_screens/widget/upcoming_bookings.dart';
import 'package:booking_app/features/hotels/presentation/screens/home_screen/widgets/vertical_hotels_list_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
          leading: Icon( FontAwesomeIcons.book,
            color:color,
          ),
          title: Text(
            'Bookings',
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
                  text: 'Completed',
                ),
                Tab(
                  text: 'Canceled',
                ),
                Tab(
                  text: 'Upcoming',
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                Padding(
                    padding: EdgeInsets.all(10),
                    child: CompletedBookings()),
                Padding(
                    padding: EdgeInsets.all(10),
                    child: CanceledBookings()),
                Padding(
                    padding: EdgeInsets.all(10),
                    child: UpComingBookings()),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
