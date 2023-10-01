import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: const CodeCompetence(),
    );
  }
}

class CodeCompetence extends StatefulWidget {
  const CodeCompetence({super.key});

  @override
  State<CodeCompetence> createState() => _CodeCompetenceState();
}

class _CodeCompetenceState extends State<CodeCompetence> {
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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Contacts',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xff27AE60),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 20),
                const Text(
                  'Create New Contacts',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Image.asset(
                  'assets/user.png', // Menampilkan gambar dari aset
                  width: 200,
                ),
                const SizedBox(height: 15),
                const Padding(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: Text(
                    'Selamat datang di Aplikasi Tambah Kontak Kami!\nTambahkan dan kelola kontak dengan mudah dan efisien.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  height: 1,
                  width: 350,
                  color: Colors.grey[350],
                ),
                const SizedBox(height: 20),
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
                          validator:
                              validateUsername, // Menggunakan metode validasi
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
                          validator:
                              validateEmail, // Menggunakan metode validasi
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
                          validator:
                              validateMessage, // Menggunakan metode validasi
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
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
