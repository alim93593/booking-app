import 'package:booking_app/core/themes/mode_cubit/mode_cubit.dart';
import 'package:booking_app/features/hotels/presentation/app_cubit/cubit.dart';
import 'package:booking_app/features/hotels/presentation/app_cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var color = ModeCubit.get(context).isDark == true
            ? const Color(0xffffffff)
            : const Color(0xff212525);
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              IconButton(
                onPressed: () {
                  ModeCubit.get(context).changeAppMode();
                },
                icon:  Icon(
                  FontAwesomeIcons.lightbulb,
                  size: 25,
                  color:color,
                ),
              ),
            ]),
          ),
        );
      },
    );
  }
}
