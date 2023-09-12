import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:praktikum_layout/screen/prioritas1/prioritas1.dart';
import 'package:praktikum_layout/screen/prioritas1/prioritas1b.dart';

void main() => runApp(const NavBar());

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    const PrioritasSatu(),
    PrioritasSatuB(),
  ];

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: buildCustomNavigationBar(),
    );
  }

  CustomNavigationBar buildCustomNavigationBar() {
    return CustomNavigationBar(
        scaleFactor: 0.4,
        backgroundColor: const Color(0xFF616161),
        selectedColor: Colors.teal,
        unSelectedColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: onTappedBar,
        items: [
          CustomNavigationBarItem(
            icon: const Icon(Icons.home_filled),
            title: const Text(
              'Home',
              style: TextStyle(color: Colors.teal),
            ),
          ),
          CustomNavigationBarItem(
            icon: const Icon(Icons.settings),
            title: const Text(
              'Settings',
              style: TextStyle(color: Colors.teal),
            ),
          ),
        ]);
  }
}
