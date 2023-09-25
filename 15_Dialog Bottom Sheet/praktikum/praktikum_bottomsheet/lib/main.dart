import 'package:flutter/material.dart';
import 'package:praktikum_bottomsheet/screen/contact_screen.dart';
import 'package:praktikum_bottomsheet/screen/gallery_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const GalleryScreen(), // Setel layar awal aplikasi ke GalleryScreen
      routes: {
        // Menentukan rute bernama '/contact' yang akan menavigasi ke ContactScreen
        '/contact': (context) => const ContactScreen(), 
      },
      theme: ThemeData(
        useMaterial3: true,
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xff816EB3),
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.photo),
            title: const Text('Gallery'), // Opsi dalam drawer untuk membuka galeri
            onTap: () {
              Navigator.of(context).pop(); // Tutup drawer
              Navigator.of(context).pushReplacementNamed('/'); // Navigasi ke halaman utama (galeri)
            },
          ),
          ListTile(
            leading: const Icon(Icons.contacts),
            title: const Text('Contact'), // Opsi dalam drawer untuk membuka halaman kontak
            onTap: () {
              Navigator.of(context).pop(); // Tutup drawer
              Navigator.of(context).pushNamed('/contact'); // Navigasi ke halaman kontak
            },
          ),
        ],
      ),
    );
  }
}
