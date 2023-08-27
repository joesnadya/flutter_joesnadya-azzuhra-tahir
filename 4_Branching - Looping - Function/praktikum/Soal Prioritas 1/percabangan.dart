import 'dart:io';

void main() {
  stdout.write('Masukkan nilai: ');
  String? input = stdin.readLineSync();
  
  double nilai = double.tryParse(input ?? "") ?? 0.0;
  String kategori = kategorikanNilai(nilai);
  print('Kategori nilai: $kategori');
}

String kategorikanNilai(double nilai) {
  if (nilai > 70) {
    return 'Nilai A';
  } else if (nilai > 40) {
    return 'Nilai B';
  } else if (nilai > 0) {
    return 'Nilai C';
  } else {
    return '';
  }
}
