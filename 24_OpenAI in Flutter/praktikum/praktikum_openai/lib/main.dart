import 'package:flutter/material.dart';
import 'package:praktikum_openai/result.dart';
import 'package:praktikum_openai/services/recommendation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); // GlobalKey untuk mengakses form
  final TextEditingController _price = TextEditingController(); // TextEditingController untuk mengontrol input harga
  final TextEditingController _camera = TextEditingController(); // TextEditingController untuk mengontrol input kamera
  final TextEditingController _storage = TextEditingController(); // TextEditingController untuk mengontrol input penyimpanan internal
  bool isLoading = false; // Variabel untuk menunjukkan apakah sedang memuat atau tidak

  // Fungsi untuk mendapatkan rekomendasi dari layanan RecommendationService
  void _getRecommendations() async {
    setState(() {
      isLoading = true;
    });

    try {
      // Memanggil layanan untuk mendapatkan rekomendasi
      final result = await RecommendationService.getRecommendation(
        budget: _price.text,
        camera: _camera.text,
        storage: _storage.text,
      );

      // Jika widget masih terpasang (mounted), mengubah isLoading menjadi false
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
      // ignore: use_build_context_synchronously
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ResultPage(
            gptResponseData: result,
          ),
        ),
      );
    } catch (e) {
      // Jika terjadi kesalahan, menampilkan snackbar dengan pesan kesalahan
      const snackBar = SnackBar(
        content: Text('Failed to get recommendation'),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Phone Recommendations'),
          backgroundColor: const Color(0xff5041FF),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  // Input untuk harga
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _price,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Budget',
                        hintText: 'Enter your budget in IDR',
                        filled: true,
                        fillColor: Color(0xffE7E0EC),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter your budget';
                        }
                        return null;
                      },
                    ),
                  ),
                  // Input untuk resolusi kamera
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _camera,
                      decoration: const InputDecoration(
                        labelText: 'Camera (MP)',
                        hintText: 'Enter your requirement for the Camera',
                        filled: true,
                        fillColor: Color(0xffE7E0EC),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter camera resolution';
                        }
                        return null;
                      },
                    ),
                  ),
                  // Input untuk penyimpanan internal
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _storage,
                       decoration: const InputDecoration(
                        labelText: 'Internal Storage',
                        hintText: 'Enter your desired internal storage',
                        filled: true,
                        fillColor: Color(0xffE7E0EC),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter internal storage';
                        }
                        return null;
                      },
                    ),
                  ),
                  // Tombol untuk mendapatkan rekomendasi
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: isLoading
                        ? const CircularProgressIndicator()
                        : SizedBox(
                           width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff5041FF),
                            ),
                              onPressed: () {
                                // Validasi formulir sebelum mendapatkan rekomendasi
                                if (_formKey.currentState!.validate()) {
                                  _getRecommendations();
                                }
                              },
                              child: const Text("GET RECOMMENDATION"),
                            ),
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
