import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          style: ButtonStyle(
            foregroundColor:
                WidgetStateProperty.all(const Color.fromARGB(255, 150, 7, 7)),
          ),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
        title: const Text(
          'Pyralume',
          style: TextStyle(color: Color.fromARGB(255, 178, 0, 0)),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
            style: ButtonStyle(
              foregroundColor:
                  WidgetStateProperty.all(const Color.fromARGB(255, 169, 0, 0)),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.account_circle),
            style: ButtonStyle(
              foregroundColor:
                  WidgetStateProperty.all(const Color.fromARGB(255, 173, 7, 7)),
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        color: Colors.black,
        alignment: Alignment.center,
        child: const Text('Home Screen',
            style: TextStyle(
                fontSize: 18,
                color: Colors.amber,
                fontWeight: FontWeight.bold)),
      ),
    );
  }
}
