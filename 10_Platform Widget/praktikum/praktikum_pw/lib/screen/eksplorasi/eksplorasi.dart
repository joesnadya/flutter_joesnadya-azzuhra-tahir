import 'package:flutter/material.dart';

class EksplorasiScreen extends StatefulWidget {
  const EksplorasiScreen({super.key});

  @override
  State<EksplorasiScreen> createState() => _EksplorasiScreenState();
}

class _EksplorasiScreenState extends State<EksplorasiScreen> {
  final List<String> course = [
    "Learn Flutter",
    "Learn ReactJS",
    "Learn VueJS",
    "Learn Tailwind CSS",
    "Learn UI/UX",
    "Learn Figma",
    "Learn Digital Marketing",
  ];

  int _selectedIndex = 0;

  final List<BottomNavigationBarItem> _bottomNavigationBarItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.favorite),
      label: 'Favorites',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.search),
      label: 'Search',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.info),
      label: 'Information',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF6200EE),
          title: const Text('My Flutter App'),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
          ],
        ),
        body: ListView.separated(
          itemCount: course.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(course[index]),
            );
          },
          separatorBuilder: (context, index) {
            return const Divider(
              height: 1.0,
              color: Colors.grey,
            );
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: _bottomNavigationBarItems,
          currentIndex: _selectedIndex,
          backgroundColor: const Color(0xFF6200EE),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: const Color(0xFF03DAC5),
          child: const Icon(Icons.add, color: Colors.black),
        ),
      ),
    );
  }
}
