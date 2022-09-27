import 'package:booking_app/core/themes/mode_cubit/mode_cubit.dart';
import 'package:flutter/material.dart';

class MyDivider extends StatelessWidget {
  const MyDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var color = ModeCubit.get(context).isDark == true
        ?  Colors.grey
        : const Color(0xff212525);
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        bottom: 10,
      ),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              color: color,
              height: 1.5,
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 15),
          //   child: Text(
          //     'Or',
          //     style: TextStyle(
          //       color: Color(0xff8d8e98),
          //     ),
          //   ),
          // ),
          // Expanded(
          //   child: Divider(
          //     color: Colors.teal[200],
          //     height: 1.5,
          //   ),
          // ),
        ],
      ),
    );
  }
}
