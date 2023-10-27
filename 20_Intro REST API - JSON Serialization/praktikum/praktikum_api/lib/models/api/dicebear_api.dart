import 'package:dio/dio.dart';

class DicebearApi {
  // Metode untuk mengambil gambar SVG dari Dicebear API.
  Future<String> getDicebear({required String query, required String artStyle}) async {
    final response = await Dio().get(
      'https://api.dicebear.com/7.x/$artStyle/svg',
      queryParameters: {
        "seed" : query
      }
    );

    print("Response Status Code : ${response.statusCode}");

    // Mengambil respons API dalam bentuk string SVG.
    String svgString = response.data.toString();
    print("Svg String dari GET API : imageString = $svgString");

    return svgString;
  }
}