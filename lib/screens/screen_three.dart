// stle
import 'package:flutter/material.dart';

class ScreenThree extends StatelessWidget {
  const ScreenThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        alignment: Alignment.center,
        child: const Text(' Screen 333',
            style: TextStyle(
                fontSize: 18,
                color: Colors.amber,
                fontWeight: FontWeight.bold)),
      ),
    );
  }
}
