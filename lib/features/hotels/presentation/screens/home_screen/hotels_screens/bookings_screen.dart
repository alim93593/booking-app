import 'package:flutter/material.dart';

class BookingsScreen extends StatelessWidget {
  const BookingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Bookings',
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
