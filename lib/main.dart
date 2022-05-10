import 'package:bottom_nav_bar/screens/favorite.dart';
import 'package:bottom_nav_bar/screens/home.dart';
import 'package:bottom_nav_bar/screens/profile.dart';
import 'package:bottom_nav_bar/screens/search.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: BottomNavBar(),
      ),
    );
  }
}

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  final List children = [
    HomePage(),
    SearchPage(),
    FavoritePage(),
    ProfilePage(),
  ];

  void onTapped(int index){
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        iconSize: 30,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: onTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: ('home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
              label: ('search'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: ('favorite'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: ('profile'),
          )
        ],
      ),
    );
  }
}
