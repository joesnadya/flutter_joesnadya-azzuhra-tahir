Summary - MVVM Architecture

MVVM merupakan sebuah metode untuk memisahkan logika dari tampilan (view) dengan ViewModel.

1. MVVM memiliki beberapa keunggulan, di antaranya:

    - Dapat Digunakan Kembali: Jika ada beberapa tampilan yang memerlukan alur logika yang sama, ViewModel yang sama bisa digunakan kembali.
    - Kemudahan Perawatan: Mudah untuk dirawat karena pekerjaan yang terkait dengan tampilan tidak bercampur dengan logika.
    - Dapat Diuji: Pengujian terbagi menjadi dua, yaitu pengujian tampilan (ui test) dan pengujian logika (unit test), sehingga dapat meningkatkan produktivitas dalam pengujian.

2. Struktur Direktori

    - Model memiliki dua bagian, yaitu bentuk data yang akan digunakan dan sumber data itu sendiri.
    - Setiap layar ditempatkan dalam sebuah direktori yang berisi View dan juga ViewModel.


3. Model

Data yang akan digunakan dibentuk dalam bentuk class, dengan data-data yang ditempatkan dalam properti properti yang sesuai.

Contoh:

    class Contact {
        final int id;
        final String name;
        final String phone;

        Contact({
            required this.id,
            required this.name,
            required this.phone,
        });
    }

4. ViewModel

ViewModel bertanggung jawab menyimpan data dan logika yang dibutuhkan oleh halaman, seperti halaman ContactScreen. Apabila widget lain memerlukan logika yang serupa, ViewModel ini juga dapat digunakan, namun, jangan lupa mendaftarkan ViewModel di MultiProvider untuk digunakan oleh berbagai ViewModel lainnya.

5. View

Menggunakan StatefulWidget. Cara menampilkan data di View adalah sebagai berikut:

    - Letakkan dalam bagian build.
    - Gunakan getter yang ada pada ViewModel.
    - Data dapat ditampilkan langsung pada widget.
