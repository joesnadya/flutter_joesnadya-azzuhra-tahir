Summary - Installation CLI and Package Management in Flutter

1. Flutter CLI
Flutter CLI merupakan sebuah perangkat yang digunakan untuk berkomunikasi dengan Flutter SDK (Software Development Kit) dan perintah-perintahnya dieksekusi melalui terminal. Perintah-perintah dalam Flutter CLI:
    - Flutter Doctor: Perintah ini berguna untuk memeriksa perangkat lunak yang diperlukan untuk menjalankan Flutter, serta untuk mengidentifikasi perangkat lunak yang belum terpasang.
    - Flutter Create: Perintah ini digunakan untuk membuat projek di Flutter.
    - Flutter Run: Perintah yang digunakan untuk menjalankan projek Flutter di device yang tersedia.
    - Flutter Emulator: Perintah ini digunakan untuk melihat emulator apa saja yang terinstall.
    - Flutter Channel: Berfungsi untuk melihat Flutter yang digunakan adalah Flutter yang sudah stabil atau masih beta atau master. 
    - Flutter Pub: Perintah untuk mendapatkan package Flutter.
    - Flutter Build: Perintah untuk membuild aplikasi dalam bentuk APK (Android), IPA (iOS), Web dan lain-lain. Fitur ini digunakan untuk keprluan deploy atau publish ke AppStore, PlayStore.
    - Flutter Clean: Perintah ini berfungsi untuk menghapus file-file sisa yang tidak diperlukan dalam proyek Flutter. Disarankan untuk menjalankan perintah Flutter clean setelah menyelesaikan revisi pada aplikasi untuk mencegah munculnya bug atau masalah di masa mendatang.

2. Packages Management
Flutter memfasilitasi penggunaan dan pengelolaan sharing packages, memungkinkan penggunaan papackages yang dikembangkan oleh para pengembang lain. Hal ini dapat meningkatkan efisiensi pengembangan aplikasi karena menghindari kebutuhan untuk membuat semua komponen dari awal, atau "from scratch". Untuk mengakses packages tersebut, dapat dilakukan dengan mengunjungi situs web pub.dev.