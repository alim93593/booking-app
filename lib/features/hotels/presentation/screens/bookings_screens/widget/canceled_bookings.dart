import 'package:booking_app/features/hotels/presentation/app_cubit/cubit.dart';
import 'package:booking_app/features/hotels/presentation/app_cubit/states.dart';
import 'package:booking_app/features/hotels/presentation/screens/home_screen/widgets/vertical_hotels_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CanceledBookings extends StatelessWidget {
  const CanceledBookings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return const Scaffold(
          body: VerticalHotelsListView(),
        );
      },
    );
  }
}