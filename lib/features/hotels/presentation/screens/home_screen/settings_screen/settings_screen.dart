import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text('Settings',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          )
        ],
      ),

    );
  }
}
