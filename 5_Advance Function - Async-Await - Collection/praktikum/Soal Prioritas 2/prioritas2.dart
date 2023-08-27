Future<int> Faktorial(int bilanganBulat) {
  int faktorial = 1;
  if (bilanganBulat < 0) {
    print("$bilanganBulat bukan bilangan bulat");
  } else {
    for (var i = 1; i <= bilanganBulat; i++) {
      faktorial = faktorial * i;
      faktorial.toString();
    }
  }
  return Future.delayed(Duration(seconds: 2), () => faktorial);
}

void main(List<String> args) async {

  // NO 1
  print('NOMOR 1');
  List listElement = [
    ['A', 21],
    ['B', 22],
    ['C', 23]
  ];
  print('Ini adalah List yang berisikan dua sub element $listElement');
  Map mapFromList = {for (var itemList in listElement) '${itemList[0]}': itemList[1]};
  print('Ini adalah Map yang diambil dari List menggunakan For-In $mapFromList');


  // NO 2
  print('NOMOR 2');
  List<int> nilaiAwal = [7, 5, 3, 5, 2, 1];
  var penjumlahanBilangan =
      nilaiAwal.reduce((listValue, listElement) => listValue + listElement);

  double nilaiAkhir = penjumlahanBilangan / nilaiAwal.length;
  print(
      'Nilai rata - rata bilangan dari : ${nilaiAwal} adalah : ${nilaiAkhir}');
  print(
      'Pembulatan ke atasnya adalah : ${nilaiAkhir.round()}');

  // NO 3
  print('NOMOR 3');
  final panggil = await Faktorial(5);
  print('Nilai faktorialnya adalah :  $panggil');
}