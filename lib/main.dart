import 'package:flutter/material.dart';
import 'package:project/screen/home_screen.dart';
import 'package:project/screen/payment_screen.dart';
import 'package:project/screen/profile_screen.dart';
import 'package:project/screen/story_screen.dart';

void main() {
  runApp(
    MaterialApp(debugShowCheckedModeBanner: false, home: MainNavigationPage()),
  );
}

class MainNavigationPage extends StatefulWidget {
  @override
  _MainNavigationPageState createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    StoryScreen(),
    PaymentScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.add_box), label: 'Story'),
          BottomNavigationBarItem(icon: Icon(Icons.payment), label: 'Payment'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
