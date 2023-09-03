abstract class Bangun {
  int getArea() {
    print("Belum ada data untuk dihitung");
    return 0;
  }

  int getPerimeter() {
    print("Belum ada data untuk dihitung");
    return 0;
  }
}

class Lingkaran implements Bangun {
  final int radius;
  Lingkaran({required this.radius});

  @override
  int getArea() {
    double hasil = 3.14 * radius * radius;
    return hasil.toInt();
  }

  @override
  int getPerimeter() {
    double hasil = 2 * 3.14 * radius;
    return hasil.toInt();
  }
}

class Persegi implements Bangun {
  final int sisi;
  Persegi({required this.sisi});

  @override
  int getArea() {
    int hasil = sisi * sisi;
    return hasil;
  }

  @override
  int getPerimeter() {
    int hasil = 4 * sisi;
    return hasil;
  }
}

class PersegiPanjang implements Bangun {
  final int lebar;
  final int tinggi;
  PersegiPanjang({required this.lebar, required this.tinggi});

  @override
  int getArea() {
    int hasil = lebar * tinggi;
    return hasil;
  }

  @override
  int getPerimeter() {
    int hasil = 2 * (lebar + tinggi);
    return hasil;
  }
}

void main() {
  final Lingkaran lingkaran = Lingkaran(radius: 7);
  final Persegi persegi = Persegi(sisi: 5);
  final PersegiPanjang persegiPanjang = PersegiPanjang(lebar: 4, tinggi: 6);

  print("Luas lingkaran: ${lingkaran.getArea()}");
  print("Keliling lingkaran: ${lingkaran.getPerimeter()}");

  print("Luas persegi: ${persegi.getArea()}");
  print("Keliling persegi: ${persegi.getPerimeter()}");

  print("Luas persegi panjang: ${persegiPanjang.getArea()}");
  print("Keliling persegi panjang: ${persegiPanjang.getPerimeter()}");
}