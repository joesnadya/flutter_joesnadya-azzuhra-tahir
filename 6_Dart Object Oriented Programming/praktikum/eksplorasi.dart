import 'dart:io';

class Buku {
  int id;
  String judul;
  String penerbit;
  double harga;
  String kategori;

  Buku(this.id, this.judul, this.penerbit, this.harga, this.kategori);

  @override
  String toString() {
    return "ID: $id, Judul: $judul, Penerbit: $penerbit, Harga: $harga, Kategori: $kategori";
  }
}

class TokoBuku {
  List<Buku> daftarBuku = [];
  int _nextId = 1;

  void tambahBuku(
      String judul, String penerbit, double harga, String kategori) {
    daftarBuku.add(Buku(_nextId++, judul, penerbit, harga, kategori));
  }

  List<Buku> semuaBuku() {
    return daftarBuku;
  }

  void hapusBuku(int id) {
    daftarBuku.removeWhere((buku) => buku.id == id);
  }
}

void main() {
  TokoBuku toko = TokoBuku();

  while (true) {
    print("\nMenu:");
    print("1. Tambah Buku");
    print("2. Lihat Semua Buku");
    print("3. Hapus Buku");
    print("4. Keluar");
    stdout.write("Pilih menu (1/2/3/4): ");
    var choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        stdout.write("Masukkan judul buku: ");
        var judul = stdin.readLineSync()!;
        stdout.write("Masukkan penerbit: ");
        var penerbit = stdin.readLineSync()!;
        stdout.write("Masukkan harga: ");
        var harga = double.parse(stdin.readLineSync()!);
        stdout.write("Masukkan kategori: ");
        var kategori = stdin.readLineSync()!;
        toko.tambahBuku(judul, penerbit, harga, kategori);
        print("Buku telah ditambahkan.");
        break;
      case '2':
        List<Buku> semuaBuku = toko.semuaBuku();
        print("\nDaftar Semua Buku:");
        for (var buku in semuaBuku) {
          print(buku.toString());
        }
        break;
      case '3':
        stdout.write("Masukkan ID buku yang ingin dihapus: ");
        var id = int.parse(stdin.readLineSync()!);
        toko.hapusBuku(id);
        print("Buku dengan ID $id telah dihapus.");
        break;
      case '4':
        return;
      default:
        print("Pilihan tidak valid. Silakan coba lagi.");
        break;
    }
  }
}
