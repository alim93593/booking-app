import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('profile',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            )
          ],
        ),
      ),
    );
  }
}
