// stle
import 'package:flutter/material.dart';

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        alignment: Alignment.center,
        child: const Text('22222',
            style: TextStyle(
                fontSize: 18,
                color: Colors.amber,
                fontWeight: FontWeight.bold)),
      ),
    );
  }
}
