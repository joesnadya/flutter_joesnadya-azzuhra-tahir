import 'dart:math';

double hitungLuasLingkaran(double jariJari) {
  return pi * jariJari * jariJari;
}

int hitungFaktorial(int angka) {
  if (angka == 0 || angka == 1) {
    return 1;
  } else {
    return angka * hitungFaktorial(angka - 1);
  }
}

void main() {
  double jariJariLingkaran = 5.0;
  double luas = hitungLuasLingkaran(jariJariLingkaran);
  print('Luas lingkaran dengan jari-jari $jariJariLingkaran adalah $luas');

  List<int> angka = [10, 40, 50];
  for (int n in angka) {
    int faktorial = hitungFaktorial(n);
    print('Faktorial dari $n adalah $faktorial');
  }
}
