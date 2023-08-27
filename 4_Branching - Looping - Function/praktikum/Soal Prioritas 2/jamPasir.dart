import 'dart:io';

void main() {
  int tinggi = 10; 

  for (int i = 0; i <= (tinggi - 1); i++) {
    for (int j = 1; j <= i; j++) {
      stdout.write(" ");
    }
    for (int k = 0; k >= (i - tinggi + 1); k--) {
      stdout.write("0 ");
    }
    stdout.write("\n");
  }

  for (int a = 0; a < tinggi; a++) {
    for (int b = 1; b < tinggi - a; b++) {
      stdout.write(" ");
    }
    for (int b = 0; b < (a + 1); b++) {
      stdout.write("0 ");
    }
    stdout.write("\n");
  }
}
