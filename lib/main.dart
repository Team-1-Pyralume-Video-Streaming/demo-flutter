import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/screen_two.dart';
import 'screens/screen_three.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final screens = [const HomeScreen(), const ScreenTwo(), const ScreenThree()];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      drawer: Drawer(
        backgroundColor: Color.fromARGB(255, 220, 13, 13),
        child: ListView(children: [
          ListTile(
            leading: const Icon(Icons.home, color: Colors.white),
            title: const Text("Home", style: TextStyle(color: Colors.white)),
            onTap: () {
              setState(() {
                currentIndex = 0;
              });
            },
          ),
          ListTile(
            leading: const Icon(Icons.movie, color: Colors.white),
            title: const Text("Movies", style: TextStyle(color: Colors.white)),
            onTap: () {
              setState(() {
                currentIndex = 1;
              });
            },
          ),
          ListTile(
            leading:
                const Icon(Icons.supervised_user_circle, color: Colors.white),
            title: const Text("Profile", style: TextStyle(color: Colors.white)),
            onTap: () {
              setState(() {
                currentIndex = 2;
              });
            },
          ),
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: const Color.fromARGB(255, 174, 148, 148),
        backgroundColor: Colors.black,
        selectedItemColor: const Color.fromARGB(255, 254, 242, 242),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Color.fromARGB(255, 220, 13, 13),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.movie,
              color: Color.fromARGB(255, 220, 13, 13),
            ),
            label: 'Movie',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.supervised_user_circle,
              color: Color.fromARGB(255, 220, 13, 13),
            ),
            label: 'Profile',
          ),
        ],
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
      ),
    );
  }
}
