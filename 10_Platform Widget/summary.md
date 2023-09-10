Summary - Platform Widget

1. Material App
Material App merupakan widget dasar yang mengelilingi dan membungkus semua widget dalam sebuah aplikasi. Widget ini digunakan untuk mengembangkan aplikasi yang berjalan pada sistem operasi Android. Untuk menggunakannya, kita perlu mengimpor library dari package:flutter/material.dart.
    - Struktur: Untuk widget yang akan dibuka ketika pertama kali dijalankan akan diletakkan pada bagian home. Mengatur halaman juga bisa diterapkan dengan menggunakan routes dan initialRoute.

2. Scaffold
Scaffold adalah widgt dasar untuk membangun sebuah halaman pada MaterialApp. 
    - Struktur: Membentuk tata letak dasar pada sebuah halaman yang ditulis melalui properti-properti.

3. Cupertino App
CupertinoApp adalah widget asal yang membungkus semua widget dalam aplikasi, khusus digunakan pada sistem operasi iOS. Untuk mengintegrasikan CupertinoApp, perlu mengimpor library dari package:flutter/cupertino.dart dan memanggilnya dalam kode program.
    - Struktur: Tidak seperti opsi tema gelap yang ada di MaterialApp (Android), dalam iOS (CupertinoApp), kita tidak dapat mengakses tema gelap secara langsung karena tidak ada dukungan bawaan dalam library. Oleh karena itu, kita perlu membuat variabel khusus untuk menyimpan dan mengatur tema gelap jika diperlukan. Lalu widget yang pertama kali dibuka sama seperti di MaterialApp yaitu terletak di properti home. 

4. CupertinoPageScaffold
CupertinoPageScaffold adalah elemen dasar yang digunakan untuk konstruksi halaman dalam CupertinoApp, sebanding dengan penggunaan Scaffold dalam MaterialApp. Dalam konteks CupertinoApp, kita memanfaatkan CupertinoPageScaffold untuk membangun tampilan halaman, berbeda dengan MaterialApp yang menggunakan Scaffold.

