Summary - Storage

1. Implementasi Session Login menggunakan Shared Preferences

    - Fungsi await SharedPreferences.getInstance() digunakan untuk mengambil instance dari Shared Preferences pada aplikasi Flutter. Dengan menggunakan await, aplikasi akan menunggu hingga instance SharedPreferences siap digunakan sebelum melanjutkan eksekusi kode berikutnya.

    - Fungsi box.getString digunakan untuk mengambil nilai string dari box dengan kunci (key) tertentu.

    - Fungsi box.setString digunakan untuk menyimpan nilai string pada box dengan kunci tertentu. Nilai yang disimpan dapat diambil kembali dengan menggunakan fungsi box.getString.

    - Fungsi box.clear() digunakan untuk menghapus semua data yang tersimpan pada box. Fungsi ini berguna untuk membersihkan box sebelum menyimpan data baru atau untuk membersihkan data yang tidak diperlukan.

2. Implementasi CRUD menggunakan sqflite

    - Fungsi db.execute() digunakan untuk mengeksekusi query SQL tanpa hasil (void) seperti CREATE, INSERT, DELETE, dan UPDATE. Dalam contoh ini, fungsi tersebut digunakan untuk membuat tabel 'contacts' dengan kolom-kolom yang dibutuhkan.

    - Fungsi db.query() digunakan untuk mengeksekusi query SELECT dan mengembalikan hasil dalam bentuk List<Map<String, dynamic>>. Dalam contoh ini, fungsi tersebut digunakan untuk mengambil data dari tabel 'contacts'.

    - Fungsi db.insert() digunakan untuk mengeksekusi query INSERT dan menyimpan data baru ke dalam tabel. Dalam contoh ini, fungsi tersebut digunakan untuk menyimpan data kontak baru ke dalam tabel 'contacts'.

    - Fungsi db.update() digunakan untuk mengeksekusi query UPDATE dan mengubah data yang sudah ada di dalam tabel. Dalam contoh ini, fungsi tersebut digunakan untuk mengubah data kontak yang sudah ada di dalam tabel 'contacts'.

    - Fungsi db.delete() digunakan untuk mengeksekusi query DELETE dan menghapus data dari tabel. Dalam contoh ini, fungsi tersebut digunakan untuk menghapus data kontak dari tabel 'contacts' berdasarkan id kontak yang dihapus.