import 'package:flutter/material.dart';

class SectionName extends StatelessWidget {
  const SectionName({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text(
        name,
        style: const TextStyle(
          fontSize: 20,
          color: Colors.black,
          fontFamily: 'Ubuntu',
          fontWeight: FontWeight.bold,
        ),
      ),
      const Spacer(),
      InkWell(
        onTap: () {},
        child: const Text(
          'See all',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      )
    ]);
  }
}