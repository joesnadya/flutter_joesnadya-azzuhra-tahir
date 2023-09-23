Summary - Assets

1. Assets

Aset adalah file yang dikemas dan didistribusikan bersama dengan aplikasi, dan berbagai jenis aset meliputi data statis (berkas JSON), ikon, gambar, dan berkas font (ttf). Untuk menentukan aset, kita dapat menggunakan:
- Flutter menggunakan pubspec.yaml
- Pubspec.yaml terletak di root proyek dan digunakan untuk mengidentifikasi aset yang diperlukan oleh aplikasi
- Gunakan karakter "/" untuk mengelompokkan semua aset di bawah satu nama direktori. Contoh:

    assets:
        - assets/my_icon.png
        - assets/background.jpg

atau

    assets:
        - assets/

Jadi, yang pertama berarti terdapat file my_icon.png dan background.jpg dalam folder assets, sedangkan yang kedua hanya mengakses folder assets itu sendiri (pilihan yang lebih efisien).

2. Image

Penggunaan gambar dapat meningkatkan daya tarik visual aplikasi yang dibuat. Flutter mendukung berbagai format gambar seperti JPEG, WebP, GIF, Animated Web/GIF, PNG, BMP, dan WBMP. Untuk menampilkan gambar dalam aplikasi, kita dapat menggunakan aset dari proyek atau mengunduhnya dari internet. Untuk memuat gambar, kita menggunakan widget Image dan properti image dengan class AssetImage().

Kita juga bisa memuat gambar dengan menggunakan metode Image.asset, yang memungkinkan kita mengambil gambar yang telah ditambahkan ke dalam proyek. Sedangkan metode Image.network digunakan untuk mengambil gambar dari internet dengan menyediakan URL. Image.asset menghasilkan kode yang lebih bersih, sementara AssetImage membuat proyek lebih efisien dalam penggunaan CPU.

3. Font

Penggunaan gaya font tertentu dapat memberikan identitas unik pada aplikasi. Biasanya, pemilihan font ditentukan oleh desainer UI, dan penggunaan font bisa berasal dari font kustom atau paket font.

Font Kustom

- Cari dan unduh font, misalnya dari fonts.google.com.
- Pilih font yang ingin digunakan, seperti Roboto atau Rowdies.
- Unduh keluarga fontnya.
- Impor berkas .ttf.
- Daftarkan font di pubspec.yaml:

    fonts:
        - family: Rowdies
        fonts:
            - asset: fonts/Rowdies-Bold.ttf
            - asset: fonts/Rowdies-Regular.ttf
            - asset: fonts/Rowdies-Light.ttf

- Atur font sebagai default dalam tema: ThemeData(fontFamily: 'Rowdies'), atau gunakan dalam widget tertentu.

