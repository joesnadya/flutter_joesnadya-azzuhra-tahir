import 'dart:io';

bool cekPrima(int angka) {
  if (angka <= 1) {
    return false;
  }
  for (int i = 2; i <= angka / 2; i++) {
    if (angka % i == 0) {
      return false;
    }
  }
  return true;
}
void main() {
  stdout.write('Masukkan sebuah angka: ');
  String input = stdin.readLineSync() ?? "";
  int angka = int.tryParse(input) ?? 0;

  if (angka <= 1) {
    print('bukan bilangan prima');
  } else if (cekPrima(angka)) {
    print('bilangan prima');
  } else {
    print('bukan bilangan prima');
  }
}