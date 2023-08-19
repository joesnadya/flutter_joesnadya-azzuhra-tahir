import 'dart:io';

void main(List<String> args) {

  stdout.write('Masukkan kata: ');
  String? kata = stdin.readLineSync();

  if (kata == kata?.split('').reversed.join()) {
    print('Kata diatas adalah palindrom');
  } else {
    print('Kata diatas bukan palindrom');
  }
}