import 'package:flutter/material.dart';

import 'models/open_ai_models.dart';

class ResultPage extends StatelessWidget {
  // Data rekomendasi dari OpenAI
  final GPTData gptResponseData;
  const ResultPage({super.key, required this.gptResponseData}); // Konstruktor untuk menerima data rekomendasi saat pembuatan objek

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Result'),
        centerTitle: true,
        backgroundColor: const Color(0xff5041FF),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(
            child: Column(
              children: [
                Text(
                  // Text untuk menampilkan hasil rekomendasi dari OpenAI
                  gptResponseData.choices[0].text,
                  textAlign: TextAlign.start,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
