void main(List<String> args) {

  // NO 1
  List<String> itemName = [
    'Amuse',
    'Tommy Kaira',
    'Spoon',
    'HKS',
    'Litchfield',
    'Amuse',
    'HKS'
  ];
  var uniqueItem = itemName.toSet().toList();
  print(itemName);
  print('Data yang telah dibersihkan:\n$uniqueItem');

  print('=================');
  
  List<String> itemName2 = [
    'JS Racing',
    'Amuse',
    'Spoon',
    'Spoon',
    'JS Racing',
    'Amuse'
  ];
  var uniqueItem2 = itemName2.toSet().toList();
  print(itemName2);
  print('Data yang telah dibersihkan:\n$uniqueItem2');

  print('===========================');
  print('Nomor 2');

  // NO 2
  List<String> programmingLanguage = [
    'JS',
    'JS',
    'JS',
    'Golang',
    'Python',
    'JS',
    'JS',
    'Golang',
    'Rust'
  ];

  var countJS =
      programmingLanguage.where((element) => element.contains('JS')).length;
  var countGolang =
      programmingLanguage.where((element) => element.contains('Golang')).length;
  var countPython =
      programmingLanguage.where((element) => element.contains('Python')).length;
  var countRust =
      programmingLanguage.where((element) => element.contains('Rust')).length;

  print(programmingLanguage);
  print('JS : $countJS');
  print('Golang : $countGolang');
  print('Python : $countPython');
  print('Rust : $countRust');
}