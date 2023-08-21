void main() {
  // Harga barang
  var buku = 10000;
  var pensil = 5000;
  var tas = 100000;

  // Jumlah barang dibeli
  var jumlahBuku = 3;
  var jumlahPensil = 5;
  var jumlahTas = 2;

  // Menghitung jumlah barang
  var totalBarang = (buku * jumlahBuku) + (pensil * jumlahPensil) + (tas * jumlahTas);

  // Menghitung diskon 
  var diskon = 0.10 * totalBarang;

  // Menghitung harga setelah diskon
  var hargaAkhir = totalBarang - diskon;

 // Hasil
  print('Total barang yang dibeli: $totalBarang');
  print('Diskon 10%: $diskon');
  print('Harga yang harus dibayar: $hargaAkhir');
}