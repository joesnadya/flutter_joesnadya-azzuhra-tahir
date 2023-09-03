class BangunRuang {
  double? panjangBangunRuang, lebarBangunRuang, tinggiBangunRuang;

  BangunRuang({
    this.panjangBangunRuang,
    this.lebarBangunRuang,
    this.tinggiBangunRuang,
  });

  volumeBangunRuang() {
    return 'Tidak diketahui';
  }
}

class Kubus extends BangunRuang {
  double? sisi;

  Kubus({
    this.sisi,
  });

  @override
  volumeBangunRuang() {
    return sisi! * sisi! * sisi!;
  }
}

class Balok extends BangunRuang {
  @override
  volumeBangunRuang() {
    return panjangBangunRuang! * lebarBangunRuang! * tinggiBangunRuang!;
  }
}

void main(List<String> args) {
  Kubus kubus = Kubus(sisi: 5);
  print(
      'Volume Kubus jika sisinya ${kubus.sisi} adalah ${kubus.volumeBangunRuang()}');

  Balok balok = Balok();
  print(
      'Volume Balok jika panjang ${balok.panjangBangunRuang = 3} lebar ${balok.lebarBangunRuang = 4.5} dan tingginya ${balok.tinggiBangunRuang = 5.5} adalah : '
      '${balok.volumeBangunRuang()}');

  BangunRuang bangun = BangunRuang();
  print(
      'Method volume di class BangunRuang adalah : ${bangun.volumeBangunRuang()}');
}