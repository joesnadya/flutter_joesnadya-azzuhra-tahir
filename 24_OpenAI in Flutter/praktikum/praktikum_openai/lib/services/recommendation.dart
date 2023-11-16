import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import '../constants/open_ai.dart';
import '../models/open_ai_models.dart';

class RecommendationService {
  // Metode untuk mendapatkan rekomendasi menggunakan OpenAI
  static Future<GPTData> getRecommendation({
    required String budget,
    required String camera,
    required String storage,
  }) async {
    // Inisialisasi objek GPTData dengan nilai default
    late GPTData gptData = GPTData(
      id: "",
      object: "",
      created: 0,
      model: "",
      choices: [],
      usage: UsageData(
        promptToken: 0,
        completionToken: 0,
        totalTokens: 0,
      ),
    );

    try {
      // Tentukan URL untuk permintaan OpenAI
      var url = Uri.parse("https://api.openai.com/v1/completions");

      // Tentukan header yang diperlukan, termasuk Authorization menggunakan API key
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Charset": "utf-8",
        "Authorization": "Bearer $apiKey",
      };

      // Buat format mata uang untuk menampilkan anggaran dalam format Rupiah
      final formatCurrency = NumberFormat.currency(
        locale: 'id_ID',
        symbol: 'Rp. ',
        decimalDigits: 0,
      );

      // Format anggaran telepon sesuai dengan mata uang Rupiah
      String phoneBudget = formatCurrency.format(int.parse(budget));

      // Buat data prompt yang akan dikirimkan ke OpenAI
      String promptData =
          "You are a smartphone expert. Kindly provide me with your top three smartphone suggestions that meet the criteria of having a camera of $camera MP or higher, a storage capacity of $storage GB or more, and fall within the budget of less than $phoneBudget in Indonesia. Additionally, please offer a brief explanation for your recommendations, highlighting specifications, features, and other relevant factors.";

      // Encode data menjadi format JSON
      final data = jsonEncode({
        "model": "text-davinci-003",
        "prompt": promptData,
        "max_tokens": 400,
        "temperature": 0.7,
        "top_p": 1,
        "frequency_penalty": 0,
        "presence_penalty": 0,
      });

      // Kirim permintaan POST ke OpenAI
      var response = await http.post(
        url,
        headers: headers,
        body: data,
      );

      // Periksa status kode respons dari OpenAI
      if (response.statusCode == 200) {
        // Jika berhasil, ambil data dan konversi menjadi objek GPTData
        gptData = gptDataFromJson(response.body);
      } else {
        // Jika gagal, tampilkan status kode respons
        print(response.statusCode);
      }
    } catch (e) {
      // Tangkap dan tampilkan kesalahan (jika ada)
      print(e);
    }

    // Kembalikan hasil rekomendasi dari OpenAI
    return gptData;
  }
}
