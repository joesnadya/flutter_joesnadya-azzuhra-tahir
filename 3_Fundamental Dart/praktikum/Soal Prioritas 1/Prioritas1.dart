void main() {
  print("SOAL PRIORITAS 1");

  // Deklarasi Variabel
  double kelilingPersegi,
      luasPersegi,
      kelilingPersegiPanjang,
      luasPersegiPanjang,
      panjang = 5,
      lebar = 5,
      sisi = 5;

  // Keliling Persegi
  kelilingPersegi = 4 * sisi;
  print("Keliling Persegi: ${kelilingPersegi}");

  // Luas Persegi
  luasPersegi = sisi * sisi;
  print("Luas Persegi: ${luasPersegi}");

  // Keliling Persegi Panjang
  kelilingPersegiPanjang = 2 * (panjang + lebar);
  print("Keliling Persegi Panjang: ${kelilingPersegiPanjang}");

  // Luas Persegi Panjang
  luasPersegiPanjang = panjang * lebar;
  print("Luas Persegi Panjang: ${luasPersegiPanjang}");
}