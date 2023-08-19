Summary - Fundamental Dart

Apa dan Mengapa Menggunakan Dart?

Dart adalah bahasa pemrograman open source yang telah dikembangkan oleh Google untuk memungkinkan pengembangan aplikasi yang berjalan dengan cepat. Itu dibuat sebagai alternatif untuk JavaScript, yang memiliki beberapa kekurangan, terutama dalam konteks pengembangan front-end. Dart telah menjadi pilihan banyak pengembang karena:

    1. Type Safe: Dart menjamin konsistensi dalam tipe data, mengurangi risiko kesalahan tipe data.
    2. Null Safety: Ini memberikan perlindungan terhadap nilai null atau kosong, yang dapat membantu mencegah kesalahan runtime.
    3. Rich Standard Library: Dart memiliki beragam dukungan dari perpustakaan bawaan yang dapat digunakan dalam pengembangan aplikasi.
    4. Multiplatform: Dart dapat digunakan untuk mengembangkan aplikasi yang berjalan pada berbagai jenis perangkat.

Fungsi Utama (Main)

Fungsi main adalah entri pertama yang dieksekusi dalam program Dart. Ini dapat memiliki tipe data void atau int dan harus memiliki nama "main." Perintah print digunakan untuk menampilkan teks ke layar. Contoh penggunaannya adalah sebagai berikut:

    void main() {
        print("Selamat datang dalam Bahasa Pemrograman Dart");
    }

Tipe Data, Variabel, dan Konstanta

Dart adalah bahasa pemrograman yang tipe datanya dideklarasikan secara statis. Ini berarti Anda harus menentukan tipe data ketika mendeklarasikan variabel. Variabel digunakan untuk menyimpan data, seperti kotak dengan label yang memiliki nilai dan tipe data. Anda dapat menggunakan kata kunci var untuk mendeklarasikan variabel, yang akan secara otomatis menentukan tipe datanya jika tidak ditentukan. Selain itu, Dart mendukung penggunaan konstanta yang memiliki nilai tetap dan tipe data yang didefinisikan. Contohnya adalah sebagai berikut:

    void main() {
        var usia;
        usia = 20;

        var nama = "Joesnadya Azzuhra Tahir";

        final phi = 3.14;
        // phi = 3.5; // Baris ini akan menghasilkan kesalahan karena konstanta tidak dapat diubah.
    }

Komentar

Komentar adalah baris kode yang tidak dijalankan oleh program, tetapi digunakan untuk memberikan catatan atau dokumentasi dalam kode. Ada dua cara untuk menulis komentar dalam Dart, yaitu dengan menggunakan garis miring dua kali // untuk komentar satu baris dan dengan menggunakan /* dan */ untuk komentar beberapa baris.

Operasi

Dart mendukung berbagai operator untuk melakukan operasi pada data. Ini termasuk operator aritmatika (+, -, *, /, %), operator assignment (=, +=, -=, *=, /=, %=), operator perbandingan (==, <, <=, >, >=), dan operator logika (&&, ||, !).

    void main() {
        // Aritmatika
        print(1 + 2);

        // Assignment
        var usia = 18;
        usia = 19;

        // Perbandingan
        print(1 == 2);

        // Logika
        print(1 == 2 && 2 == 1);
    }
