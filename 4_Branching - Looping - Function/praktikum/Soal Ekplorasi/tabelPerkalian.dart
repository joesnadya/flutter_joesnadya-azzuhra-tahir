import 'dart:io';

void main() {
  stdout.write('Masukkan angka untuk tabel perkalian: ');
  String input = stdin.readLineSync() ?? "";
  int angka = int.tryParse(input) ?? 0;

  if (angka <= 0) {
    print('Masukkan angka positif yang lebih dari 0.');
    return;
  }

  print('Tabel perkalian untuk angka $angka:');
  cetakTabelPerkalian(angka);
}

void cetakTabelPerkalian(int angka) {
  for (int i = 1; i <= angka; i++) {
    for (int j = 1; j <= angka; j++) {
      stdout.write('${i * j}');
      if (j < angka) {
        stdout.write(' ');
      }
    }
    print('');
  }
}
