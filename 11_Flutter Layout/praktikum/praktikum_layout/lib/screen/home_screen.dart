import 'package:flutter/material.dart';
import 'package:praktikum_layout/navbar.dart';
import 'package:praktikum_layout/screen/eksplorasi/eksplorasi.dart';
import 'package:praktikum_layout/screen/prioritas2/prioritas2.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home Screen'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const NavBar(),
                  ));
                },
                child: const Text('Soal Prioritas 1'),
              ),
              const SizedBox(height: 16), 
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const PrioritasDua(),
                  ));
                },
                child: const Text('Soal Prioritas 2'),
              ),
              const SizedBox(height: 16), 
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const EksplorasiScreen(),
                  ));
                },
                child: const Text('Soal Eksplorasi'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
