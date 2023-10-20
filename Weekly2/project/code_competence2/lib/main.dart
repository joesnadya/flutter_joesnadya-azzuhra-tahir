import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var formKey = GlobalKey<FormState>(); // Membuat global key untuk form
  TextEditingController usernameController =
      TextEditingController(); // Membuat controller untuk input username
  TextEditingController emailController =
      TextEditingController(); // Membuat controller untuk input email
  TextEditingController messageController =
      TextEditingController(); // Membuat controller untuk input pesan

  String? validateUsername(String? value) {
    // Metode validasi untuk input username
    if (value == null || value.isEmpty) {
      return 'Username harus diisi.';
    }
    if (value.length < 4) {
      return 'Username harus terdiri dari minimal 4 karakter.';
    }
    return null;
  }

  String? validateEmail(String? value) {
    // Metode validasi untuk input email
    if (value == null || value.isEmpty) {
      return 'Email harus diisi.';
    }
    if (!value.contains('@') || !value.contains('.')) {
      return 'Email tidak valid.';
    }
    return null;
  }

  String? validateMessage(String? value) {
    // Metode validasi untuk input pesan
    if (value == null || value.isEmpty) {
      return 'Message harus diisi.';
    }
    if (value.length > 100) {
      return 'Message tidak boleh lebih dari 100 karakter.';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: const Color(0xff1abc9c),
          elevation: 0,
          title: const Text(
            "App Code Competence",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          iconTheme: const IconThemeData(color: Colors.white)),
      endDrawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: const Text("Contact Us"),
              onTap: () {},
            ),
            ListTile(
              title: const Text("About Us"),
              onTap: () {},
            ),
            ListTile(
              title: const Text("Login"),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: const Color(0xff1abc9c),
              height: 200,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        "Temukan Apa\nYang Anda\nButuhkan Di sini",
                        style: TextStyle(
                          fontSize: 35,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                'Pilihan Layanan',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    buildServiceCard(
                      "Servis Pembersihan Rumah",
                      "Layanan profesional untuk membersihkan rumah Anda.",
                      "assets/images/gambar1.jpg",
                    ),
                    buildServiceCard(
                      "Servis Perbaikan Mobil",
                      "Siap membantu perawatan dan perbaikan kendaraan Anda.",
                      "assets/images/gambar2.jpg",
                    ),
                    buildServiceCard(
                      "Servis Tukang Listrik",
                      "Spesialis listrik untuk memperbaiki dan memasang peralatan listrik.",
                      "assets/images/gambar3.jpg",
                    ),
                    buildServiceCard(
                      "Servis Desain Interior",
                      "Ahli desain interior untuk mengubah rumah Anda menjadi tempat yang indah.",
                      "assets/images/gambar4.jpg",
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                'Contact Us',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Form(
              key: formKey, // Menggunakan GlobalKey untuk form
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    TextFormField(
                      controller:
                          usernameController, // Menghubungkan controller dengan input
                      decoration: InputDecoration(
                        labelText: 'Username',
                        hintText: 'Insert your username',
                        filled: true,
                        fillColor: const Color(0xff27AE60).withOpacity(0.2),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: validateUsername, // Menggunakan metode validasi
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      controller:
                          emailController, // Menghubungkan controller dengan input
                      decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'example@example.com',
                        filled: true,
                        fillColor: const Color(0xff27AE60).withOpacity(0.2),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: validateEmail, // Menggunakan metode validasi
                      keyboardType: TextInputType
                          .emailAddress, // Mengatur keyboard untuk email
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      controller:
                          messageController, // Menghubungkan controller dengan input
                      decoration: InputDecoration(
                        labelText: 'Message',
                        hintText: 'Insert your message',
                        filled: true,
                        fillColor: const Color(0xff27AE60).withOpacity(0.2),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: validateMessage, // Menggunakan metode validasi
                      maxLines: 5, // Mengatur jumlah baris maksimum
                    ),
                    const SizedBox(height: 25),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff27AE60),
                        ),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            // Validasi form
                            String username = usernameController.text;
                            String email = emailController.text;
                            String message = messageController.text;
      
                            // Tampilkan data sebagai alert
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Data Submitted'),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          'Username: $username'), // Tampilkan data
                                      Text('Email: $email'),
                                      Text('Message: $message'),
                                    ],
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );
      
                            usernameController.clear(); // Hapus teks input
                            emailController.clear();
                            messageController.clear();
                          }
                        },
                        child: const Text(
                          'Submit', // Teks tombol
                          style: TextStyle(color: Colors.white),
                        ),
                        
                      ),
                    ),
                   const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

// Membangun widget untuk kartu layanan dengan judul, deskripsi, dan gambar
  Widget buildServiceCard(String title, String description, String imagePath) {
    // Menentukan radius border untuk kartu
    const double borderRadius = 10.0;

    return GestureDetector(
      onTap: () {},
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: Stack(
            children: [
              Image.asset(
                imagePath,
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
              ),
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(borderRadius),
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        description,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
