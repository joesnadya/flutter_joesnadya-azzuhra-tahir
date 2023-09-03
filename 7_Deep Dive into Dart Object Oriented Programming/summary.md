Summary - Deep Dive into Dart Object Oriented Programming

1. Constructor
Constructor digunakan untuk membuat objek baru dan merupakan sebuah metode yang dijalankan saat objek dibuat. Mirip dengan metode lainnya, constructor dapat menerima parameter tetapi tidak mengembalikan nilai. Nama constructor sama dengan nama kelas yang bersangkutan.

2. Inheritance
Inheritance, atau pewarisan, adalah kemampuan untuk membuat kelas baru dengan menggunakan kelas yang sudah ada. Inheritance dapat diibaratkan seperti sifat seorang anak yang diwarisi dari orang tuanya. Kelas yang mewarisi sifat disebut child class, sedangkan kelas yang memberikan warisan sifat disebut super class/parent class.

3. Method Overriding
Method Overriding adalah kemampuan untuk menggantikan (override) metode yang sudah ada dalam parent class. Tujuannya adalah agar child class memiliki metode yang sama dengan parent class, tetapi dengan implementasi yang berbeda. Langkah-langkah dalam method overriding melibatkan pembuatan metode baru di dalam child class yang memiliki nama yang sama dengan metode yang ada di parent class. Metode ini juga diberi anotasi @override sebelum pendefinisian metodenya.

4. Interface
Interface adalah sebuah kontrak yang menentukan daftar metode yang harus ada dalam sebuah kelas. Semua metode dalam sebuah interface harus diimplementasikan oleh kelas yang menggunakannya, dengan menggunakan kata kunci "implements". Ini memungkinkan untuk memastikan bahwa kelas memiliki metode yang diharapkan.

5. Abstract Class
Abstract Class adalah kelas yang bersifat abstrak, artinya hanya berupa kerangka umum dari sebuah kelas. Tidak dapat membuat objek langsung dari kelas abstrak ini. Namun, kelas abstrak dapat menjadi kelas induk yang menurunkan semua properti dan metodenya kepada child class. Tidak semua metode di kelas abstrak harus di-override oleh child class.

6. Polymorphism
Polymorphism adalah kemampuan suatu objek untuk mengambil bentuk atau tipe lain yang lebih umum. Ini berarti objek dapat memiliki tipe data super class dan dapat digunakan dalam konteks di mana objek dari kelas yang lebih khusus dibutuhkan.

7. Generics
Generics adalah kemampuan untuk menambahkan parameter tipe data pada kelas atau fungsi. Dengan menggunakan parameter tipe data, kita dapat membuat kelas atau fungsi yang dapat bekerja dengan berbagai jenis tipe data yang berbeda. Tipe data yang digunakan ditentukan saat membuat kelas atau menjalankan fungsi.

