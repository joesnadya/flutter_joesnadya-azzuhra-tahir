import 'dart:io';

class Calculator {
  double tambah(double a, double b) {
    return a + b;
  }

  double kurang(double a, double b) {
    return a - b;
  }

  double kali(double a, double b) {
    return a * b;
  }

  double bagi(double a, double b) {
    if (b != 0) {
      return a / b;
    } else {
      throw Exception("Tidak bisa dibagi oleh nol.");
    }
  }
}

class Course {
  String judul;
  String deskripsi;

  Course(this.judul, this.deskripsi);
}

class Siswa {
  String nama;
  String kelas;
  List<Course> daftarCourse = [];

  Siswa(this.nama, this.kelas);

  void tambahCourse() {
    stdout.write("Masukkan judul course: ");
    String judul = stdin.readLineSync()!;
    stdout.write("Masukkan deskripsi course: ");
    String deskripsi = stdin.readLineSync()!;
    Course course = Course(judul, deskripsi);
    daftarCourse.add(course);
    print("Course \"$judul\" berhasil ditambahkan.");
  }

  void hapusCourse() {
    stdout.write("Masukkan judul course yang akan dihapus: ");
    String judul = stdin.readLineSync()!;
    Course? courseToDelete;

    for (var course in daftarCourse) {
      if (course.judul == judul) {
        courseToDelete = course;
        break;
      }
    }

    if (courseToDelete != null) {
      daftarCourse.remove(courseToDelete);
      print("Course \"$judul\" berhasil dihapus.");
    } else {
      print("Course dengan judul \"$judul\" tidak ditemukan.");
    }
  }

  void lihatSemuaCourse() {
    if (daftarCourse.isEmpty) {
      print("Belum ada course yang ditambahkan.");
    } else {
      print("Daftar Course yang Dimiliki oleh $nama ($kelas):");
      for (var course in daftarCourse) {
        print("${course.judul}: ${course.deskripsi}");
      }
    }
  }
}

void main() {
  Calculator calculator = Calculator();

  stdout.write("Masukkan angka pertama: ");
  double angka1 = double.parse(stdin.readLineSync()!);

  stdout.write("Masukkan angka kedua: ");
  double angka2 = double.parse(stdin.readLineSync()!);

  double hasilTambah = calculator.tambah(angka1, angka2);
  print("Hasil Penjumlahan dari: $hasilTambah");

  double hasilKurang = calculator.kurang(angka1, angka2);
  print("Hasil Pengurangan dari: $hasilKurang");

  double hasilKali = calculator.kali(angka1, angka2);
  print("Hasil Perkalian dari: $hasilKali");

  try {
    double hasilBagi = calculator.bagi(angka1, angka2);
    print("Hasil Pembagian dari: $hasilBagi");
  } catch (e) {
    print("Error: ${e.toString()}");
  }

  stdout.write("Masukkan nama siswa: ");
  String namaSiswa = stdin.readLineSync()!;
  stdout.write("Masukkan kelas siswa: ");
  String kelasSiswa = stdin.readLineSync()!;
  
  Siswa siswa = Siswa(namaSiswa, kelasSiswa);
  
  while (true) {
    print("1. Tambah Course");
    print("2. Hapus Course");
    print("3. Lihat Semua Course");
    print("4. Keluar");
    stdout.write("Masukkan pilihan (1/2/3/4): ");
    String pilihan = stdin.readLineSync()!;
    
    switch (pilihan) {
      case "1":
        siswa.tambahCourse();
        break;
      case "2":
        siswa.hapusCourse();
        break;
      case "3":
        siswa.lihatSemuaCourse();
        break;
      case "4":
        return;
      default:
        print("Pilihan tidak valid.");
    }
  }
}
