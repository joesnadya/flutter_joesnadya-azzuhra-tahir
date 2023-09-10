import 'package:flutter/material.dart';

class PrioritasSatuB extends StatelessWidget {
  final List<String> nama = [
    "Leanne Graham",
    "Ervin Howell",
    "Clementine Bauch",
    "Patricia Lebsack",
    "Chelsey Detrich",
    "Mrs. Dennis Schulist",
    "Kurtis Weissnat",
  ];

  final List<String> nomor = [
    "1-770-736-8031 x56442",
    "010-692-6593 x09125",
    "1-463-123-4447",
    "493-170-9623 x156",
    "(254)954-1289",
    "1-477-935-8478 x6430",
    "210.067.6132",
  ];

  PrioritasSatuB({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('ListView'),
      ),
      body: ListView.builder(
        itemCount: nama.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green,
              ),
              child: Center(
                child: Text(
                  nama[index][0],
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            title: Text(nama[index]),
            subtitle: Text(nomor[index]),
          );
        },
      ),
    );
  }
}
