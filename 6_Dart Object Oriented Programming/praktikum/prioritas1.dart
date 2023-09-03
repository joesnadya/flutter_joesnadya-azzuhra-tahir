class Hewan {
  double berat;
  Hewan(this.berat);
}

class Mobil {
  double kapasitas;
  List<Hewan> muatan = [];

  Mobil(this.kapasitas);

  void tambahMuatan(Hewan hewan) {
    if ((muatan.fold(0.0, (sum, h) => sum + h.berat) + hewan.berat) <= kapasitas) {
      muatan.add(hewan);
      print("Hewan ditambahkan ke dalam muatan.");
    } else {
      print("Kapasitas muatan penuh, hewan tidak dapat ditambahkan.");
    }
  }

  double totalMuatan() {
    return muatan.fold(0.0, (sum, h) => sum + h.berat);
  }
}

void main() {
  Mobil mobil = Mobil(500.0); // Kapasitas maksimum mobil
  Hewan hewan1 = Hewan(500.0); 
  Hewan hewan2 = Hewan(200.0); 

  mobil.tambahMuatan(hewan1);
  mobil.tambahMuatan(hewan2);

  print("Total muatan mobil: ${mobil.totalMuatan()} kg");
}
