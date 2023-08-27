import 'dart:io';

void main() {
  int tingkat = 8; 
  
  for (int i = 1; i <= tingkat; i++) {
    for (int j = tingkat; j > i; j--) {
      stdout.write(' ');
    }
    
    for (int k = 1; k <= i * 2 - 1; k++) {
      stdout.write('*');
    }
    
    print('');
  }
}
